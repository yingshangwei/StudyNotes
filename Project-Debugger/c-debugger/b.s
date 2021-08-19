	.file	"a.c"
	.text
	.globl	p
	.section	.rodata
.LC0:
	.string	"Hello world!\n"
	.section	.data.rel.local,"aw",@progbits
	.align 8
	.type	p, @object
	.size	p, 8
p:
	.quad	.LC0
	.text
	.globl	print
	.type	print, @function
print:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	p(%rip), %rax
#APP
# 4 "b.c" 1
	movl $13,%edx 
	movq %rax,%ecx 
	movl $0,%ebx 
	movl $4,%eax 
# 0 "" 2
#NO_APP
	nop
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print, .-print
	.globl	exit
	.type	exit, @function
exit:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 14 "b.c" 1
	movl $42,%ebx 
	movl $1,%eax 
	int $0x80 
	
# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	exit, .-exit
	.globl	nomain
	.type	nomain, @function
nomain:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	print
	movl	$0, %eax
	call	exit
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	nomain, .-nomain
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
