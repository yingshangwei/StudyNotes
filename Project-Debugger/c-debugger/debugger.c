#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/wait.h>
#include <sys/user.h>


void run_target(const char *name) {
    printf("target run : %s\n", name);
    if(ptrace(PTRACE_TRACEME,0,0,0) < 0) {
        perror("ptrace");
        return;
    }
    execl(name,name,NULL);
    return ;
}

void run_debugger(pid_t pid) {
    printf("debugger run %x\n", pid);

    int wait_status;
    unsigned icounter = 0;
    wait(&wait_status);
    
    while(WIFSTOPPED(wait_status)) {
        struct user_regs_struct regs;
        icounter++;
        ptrace(PTRACE_GETREGS,pid,0,&regs);
        unsigned long long instr = ptrace(PTRACE_PEEKTEXT,pid,regs.rip,0);
        if(((instr<<24)>>24)==0xFFFFFE98E8ull) {
            printf("ins = \'mov    %%rax,%%rdi\', int=%016llX, s=%016llX\n", instr, regs.rdi);
            //printf("ins s = %c\n", *((char*)regs.rdi));
        }

        
        // if(((instr<<24)>>24)==0xFFFFFEC6E8) {
        //     printf("ins = \'callq  510 <puts@plt>\', s=%s",(char*)regs.rdi);
        // }
        //printf("icounter=%d, EIP = 0x%016llX. instr = 0x%016llX\n", icounter, regs.rip, instr);
        if(ptrace(PTRACE_SINGLESTEP,pid,0,0)<0) {
            perror("ptrace");
            return;
        }
        wait(&wait_status);
    }
    printf("the child executed %u instructions\n", icounter);
}

void main(int argc, char** argv) {
    pid_t child_pid;
    if(argc < 2) {
        fprintf(stderr, "arg count error\n");
        return ;
    }

    child_pid = fork();
    if(child_pid==0) {
        run_target(argv[1]);
    } else if(child_pid>0) {
        run_debugger(child_pid);
    } else {
        perror("fork");
    }
}

