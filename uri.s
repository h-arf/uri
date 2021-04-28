	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.globl	_matchchar              ## -- Begin function matchchar
	.p2align	4, 0x90
_matchchar:                             ## @matchchar
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
                                        ## kill: def $sil killed $sil killed $esi
                                        ## kill: def $dil killed $dil killed $edi
	movb	%dil, -17(%rbp)
	movb	%sil, -18(%rbp)
	movsbl	-17(%rbp), %edi
	callq	_tolower
	movsbl	-18(%rbp), %edi
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	callq	_tolower
	movl	-24(%rbp), %ecx         ## 4-byte Reload
	cmpl	%eax, %ecx
	jne	LBB0_2
## %bb.1:
	movb	$1, -16(%rbp)
	movq	$1, -8(%rbp)
	jmp	LBB0_3
LBB0_2:
	movb	$0, -16(%rbp)
	movq	$0, -8(%rbp)
LBB0_3:
	movb	-16(%rbp), %al
	movq	-8(%rbp), %rdx
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_matchrange             ## -- Begin function matchrange
	.p2align	4, 0x90
_matchrange:                            ## @matchrange
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        ## kill: def $dl killed $dl killed $edx
                                        ## kill: def $sil killed $sil killed $esi
                                        ## kill: def $dil killed $dil killed $edi
	movb	%dil, -17(%rbp)
	movb	%sil, -18(%rbp)
	movb	%dl, -19(%rbp)
	movsbl	-17(%rbp), %eax
	movsbl	-18(%rbp), %ecx
	cmpl	%ecx, %eax
	jl	LBB1_3
## %bb.1:
	movsbl	-17(%rbp), %eax
	movsbl	-19(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	LBB1_3
## %bb.2:
	movb	$1, -16(%rbp)
	movq	$1, -8(%rbp)
	jmp	LBB1_4
LBB1_3:
	movb	$0, -16(%rbp)
	movq	$0, -8(%rbp)
LBB1_4:
	movb	-16(%rbp), %al
	movq	-8(%rbp), %rdx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_ALPHA                  ## -- Begin function ALPHA
	.p2align	4, 0x90
_ALPHA:                                 ## @ALPHA
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        ## kill: def $dil killed $dil killed $edi
	movb	%dil, -17(%rbp)
	movsbl	-17(%rbp), %eax
	cmpl	$65, %eax
	jl	LBB2_2
## %bb.1:
	movsbl	-17(%rbp), %eax
	cmpl	$90, %eax
	jl	LBB2_4
LBB2_2:
	movsbl	-17(%rbp), %eax
	cmpl	$97, %eax
	jl	LBB2_5
## %bb.3:
	movsbl	-17(%rbp), %eax
	cmpl	$122, %eax
	jge	LBB2_5
LBB2_4:
	movb	$1, -16(%rbp)
	movq	$1, -8(%rbp)
	jmp	LBB2_6
LBB2_5:
	movb	$0, -16(%rbp)
	movq	$0, -8(%rbp)
LBB2_6:
	movb	-16(%rbp), %al
	movq	-8(%rbp), %rdx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_DIGIT                  ## -- Begin function DIGIT
	.p2align	4, 0x90
_DIGIT:                                 ## @DIGIT
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
                                        ## kill: def $dil killed $dil killed $edi
	movb	%dil, -17(%rbp)
	movsbl	-17(%rbp), %edi
	movl	$49, %esi
	movl	$57, %edx
	callq	_matchrange
	movb	%al, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movb	-16(%rbp), %al
	movq	-8(%rbp), %rdx
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_scheme                 ## -- Begin function scheme
	.p2align	4, 0x90
_scheme:                                ## @scheme
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB4_2
## %bb.1:
	movq	-16(%rbp), %rdi
	callq	_strlen
	cmpq	$1, %rax
	jae	LBB4_3
LBB4_2:
	movq	$0, -8(%rbp)
	jmp	LBB4_4
LBB4_3:
	movq	$0, -8(%rbp)
LBB4_4:
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_validscheme            ## -- Begin function validscheme
	.p2align	4, 0x90
_validscheme:                           ## @validscheme
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movb	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movb	-16(%rbp), %al
	movq	-8(%rbp), %rdx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.comm	_scheme_sep,8,3         ## @scheme_sep
.subsections_via_symbols
