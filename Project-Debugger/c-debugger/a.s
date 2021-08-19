	.file	"a.c"
	.text
	.globl	p1
	.section	.rodata
.LC0:
	.string	"hello"
	.section	.data.rel.local,"aw",@progbits
	.align 8
	.type	p1, @object
	.size	p1, 8
p1:
	.quad	.LC0
	.globl	p2
	.section	.rodata
.LC1:
	.string	"world"
	.section	.data.rel.local
	.align 8
	.type	p2, @object
	.size	p2, 8
p2:
	.quad	.LC1
	.section	.rodata
.LC2:
	.string	"%016llX\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	p1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	p1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	int $0x80
	movq	p2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
