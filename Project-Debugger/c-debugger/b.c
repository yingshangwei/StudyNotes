char* p = "Hello world!\n";

void print() {
    asm("movl $13,%%edx \n\t"
        "movq %0,%%rcx \n\t" //64位操作系统的话指针大小就是64位，就得用moveq 和 rcx寄存器
        "movl $0,%%ebx \n\t"
        "movl $4,%%eax \n\t"
        "int $0x80     \n\t"
        ::"r"(p):"edx","rcx","ebx"
    );
}

void exit() {
    asm(
        "movl $42,%ebx \n\t"
        "movl $1,%eax \n\t"
        "int $0x80 \n\t"
    );
}

void nomain() {
    print();
    exit();
}
