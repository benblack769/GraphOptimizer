	.file	"test.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	kern0
	.type	kern0, @function
kern0:
.LFB14:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$tbuf.3887, %eax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rax, %rdi
	leaq	3136(%r12), %rax
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rcx, %rbx
	movl	$397, %ecx
	subq	$64, %rsp
	rep movsq
	leaq	3168(%r12), %rdi
	cmpq	$tbuf.3887+3208, %rax
	movq	%rax, -80(%rbp)
	movq	%rdi, -88(%rbp)
	jnb	.L323
	cmpq	$tbuf.3887+3176, %rdi
	ja	.L2
.L323:
	vmovss	3136(%r12), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, tbuf.3887+3176(%rip)
	vmovss	3140(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+3180(%rip)
	vmovss	3144(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+3184(%rip)
	vmovss	3148(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+3188(%rip)
	vmovss	3152(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+3192(%rip)
	vmovss	3156(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+3196(%rip)
	.p2align 4,,10
	.p2align 3
.L4:
	vmovups	3160(%r12,%rax), %xmm0
	vinsertf128	$0x1, 3176(%r12,%rax), %ymm0, %ymm0
	addq	$32, %rax
	vmovaps	%ymm0, tbuf.3887+3168(%rax)
	cmpq	$95392, %rax
	jne	.L4
	vmovss	98552(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+98592(%rip)
	vmovss	98556(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+98596(%rip)
	vmovss	98560(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+98600(%rip)
	vmovss	98564(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+98604(%rip)
	vmovss	98568(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+98608(%rip)
	vmovss	98572(%r12), %xmm0
	vmovss	%xmm0, tbuf.3887+98612(%rip)
	vzeroupper
.L5:
	vmovss	98576(%rbx), %xmm0
	movl	$tbuf.3887+3336, %edx
	movl	$tbuf.3887+98624, %eax
	vmovss	%xmm0, tbuf.3887+98616(%rip)
	movl	$tbuf.3887+104896, %ecx
	vmovss	101876(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+98620(%rip)
	.p2align 4,,10
	.p2align 3
.L7:
	vmovss	(%rdx), %xmm0
	addq	$8, %rax
	addq	$4, %rdx
	vmulss	-3340(%rdx), %xmm0, %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm0, -8(%rax)
	vmovss	%xmm1, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L7
	vmovss	tbuf.3887+6472(%rip), %xmm1
	movl	$tbuf.3887+6480, %r8d
	vmulss	tbuf.3887(%rip), %xmm1, %xmm1
	vmovss	108152(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+104896(%rip)
	movl	$tbuf.3887+104912, %eax
	movl	$tbuf.3887+111168, %r9d
	movq	%r8, %rdx
	vmovss	%xmm1, tbuf.3887+104900(%rip)
	vaddss	%xmm1, %xmm0, %xmm1
	vmovss	tbuf.3887+6476(%rip), %xmm0
	vmulss	tbuf.3887+4(%rip), %xmm0, %xmm0
	vmovss	%xmm1, tbuf.3887+104904(%rip)
	vmovss	%xmm0, tbuf.3887+104908(%rip)
.L8:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-6476(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+111168, %rax
	jne	.L8
	vmovss	tbuf.3887+111160(%rip), %xmm0
	movl	$tbuf.3887+9612, %edi
	vaddss	tbuf.3887+111164(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+111180, %eax
	movq	%rdi, %rdx
	vmovss	%xmm0, tbuf.3887+111168(%rip)
	vmovss	tbuf.3887+9608(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	114428(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+111172(%rip)
	vmovss	%xmm0, tbuf.3887+111176(%rip)
.L9:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-9612(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+117444, %rax
	jne	.L9
	vmovss	tbuf.3887+117436(%rip), %xmm0
	movl	$tbuf.3887+117456, %eax
	vaddss	tbuf.3887+117440(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+12748, %edx
	movl	$tbuf.3887+123720, %ecx
	vmovss	%xmm0, tbuf.3887+117444(%rip)
	vmovss	tbuf.3887+12744(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	120704(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+117448(%rip)
	vmovss	%xmm0, tbuf.3887+117452(%rip)
.L10:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-12748(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L10
	vmovss	tbuf.3887+123712(%rip), %xmm0
	movl	$tbuf.3887+123732, %eax
	vaddss	tbuf.3887+123716(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+15884, %edx
	movl	$tbuf.3887+129996, %ecx
	vmovss	%xmm0, tbuf.3887+123720(%rip)
	vmovss	tbuf.3887+15880(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	126980(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+123724(%rip)
	vmovss	%xmm0, tbuf.3887+123728(%rip)
.L11:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-15884(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L11
	vmovss	tbuf.3887+129988(%rip), %xmm0
	movl	$tbuf.3887+130008, %eax
	vaddss	tbuf.3887+129992(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+19020, %edx
	movl	$tbuf.3887+136272, %ecx
	vmovss	%xmm0, tbuf.3887+129996(%rip)
	vmovss	tbuf.3887+19016(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	133256(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+130000(%rip)
	vmovss	%xmm0, tbuf.3887+130004(%rip)
.L12:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-19020(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L12
	vmovss	tbuf.3887+136264(%rip), %xmm0
	movl	$tbuf.3887+136284, %eax
	vaddss	tbuf.3887+136268(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+22156, %edx
	movl	$tbuf.3887+142548, %ecx
	vmovss	%xmm0, tbuf.3887+136272(%rip)
	vmovss	tbuf.3887+22152(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	139532(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+136276(%rip)
	vmovss	%xmm0, tbuf.3887+136280(%rip)
.L13:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-22156(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L13
	vmovss	tbuf.3887+142540(%rip), %xmm0
	movl	$tbuf.3887+142560, %eax
	vaddss	tbuf.3887+142544(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+25292, %edx
	movl	$tbuf.3887+148824, %ecx
	vmovss	%xmm0, tbuf.3887+142548(%rip)
	vmovss	tbuf.3887+25288(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	145808(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+142552(%rip)
	vmovss	%xmm0, tbuf.3887+142556(%rip)
.L14:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-25292(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L14
	vmovss	tbuf.3887+148816(%rip), %xmm0
	movl	$tbuf.3887+148836, %eax
	vaddss	tbuf.3887+148820(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+28428, %edx
	movl	$tbuf.3887+155100, %ecx
	vmovss	%xmm0, tbuf.3887+148824(%rip)
	vmovss	tbuf.3887+28424(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	152084(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+148828(%rip)
	vmovss	%xmm0, tbuf.3887+148832(%rip)
.L15:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-28428(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L15
	vmovss	tbuf.3887+155092(%rip), %xmm0
	movl	$tbuf.3887+155112, %eax
	vaddss	tbuf.3887+155096(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+31564, %edx
	movl	$tbuf.3887+161376, %ecx
	vmovss	%xmm0, tbuf.3887+155100(%rip)
	vmovss	tbuf.3887+31560(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	158360(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+155104(%rip)
	vmovss	%xmm0, tbuf.3887+155108(%rip)
.L16:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-31564(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L16
	vmovss	tbuf.3887+161368(%rip), %xmm0
	movl	$tbuf.3887+34700, %esi
	vaddss	tbuf.3887+161372(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+161388, %eax
	movl	$tbuf.3887+167652, %ecx
	movq	%rsi, %rdx
	vmovss	%xmm0, tbuf.3887+161376(%rip)
	vmovss	tbuf.3887+34696(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	164636(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+161380(%rip)
	vmovss	%xmm0, tbuf.3887+161384(%rip)
.L17:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-34700(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L17
	vmovss	tbuf.3887+167644(%rip), %xmm0
	movl	$tbuf.3887+167664, %eax
	vaddss	tbuf.3887+167648(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+37836, %edx
	movl	$tbuf.3887+173928, %ecx
	vmovss	%xmm0, tbuf.3887+167652(%rip)
	vmovss	tbuf.3887+37832(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	170912(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+167656(%rip)
	vmovss	%xmm0, tbuf.3887+167660(%rip)
.L18:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-37836(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L18
	vmovss	tbuf.3887+173920(%rip), %xmm0
	movl	$tbuf.3887+173940, %eax
	vaddss	tbuf.3887+173924(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+40972, %edx
	movl	$tbuf.3887+180204, %ecx
	vmovss	%xmm0, tbuf.3887+173928(%rip)
	vmovss	tbuf.3887+40968(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	177188(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+173932(%rip)
	vmovss	%xmm0, tbuf.3887+173936(%rip)
.L19:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-40972(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L19
	vmovss	tbuf.3887+180196(%rip), %xmm0
	movl	$tbuf.3887+180216, %eax
	vaddss	tbuf.3887+180200(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+44108, %edx
	movl	$tbuf.3887+186480, %ecx
	vmovss	%xmm0, tbuf.3887+180204(%rip)
	vmovss	tbuf.3887+44104(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	183464(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+180208(%rip)
	vmovss	%xmm0, tbuf.3887+180212(%rip)
.L20:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-44108(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L20
	vmovss	tbuf.3887+186472(%rip), %xmm0
	movl	$tbuf.3887+186492, %eax
	vaddss	tbuf.3887+186476(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+47244, %edx
	movl	$tbuf.3887+192756, %ecx
	vmovss	%xmm0, tbuf.3887+186480(%rip)
	vmovss	tbuf.3887+47240(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	189740(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+186484(%rip)
	vmovss	%xmm0, tbuf.3887+186488(%rip)
.L21:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-47244(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L21
	vmovss	tbuf.3887+192748(%rip), %xmm0
	movl	$tbuf.3887+192768, %eax
	vaddss	tbuf.3887+192752(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+50380, %edx
	movl	$tbuf.3887+199032, %ecx
	vmovss	%xmm0, tbuf.3887+192756(%rip)
	vmovss	tbuf.3887+50376(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	196016(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+192760(%rip)
	vmovss	%xmm0, tbuf.3887+192764(%rip)
.L22:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-50380(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L22
	vmovss	tbuf.3887+199024(%rip), %xmm0
	movl	$tbuf.3887+199044, %eax
	vaddss	tbuf.3887+199028(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+53516, %edx
	movl	$tbuf.3887+205308, %ecx
	vmovss	%xmm0, tbuf.3887+199032(%rip)
	vmovss	tbuf.3887+53512(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	202292(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+199036(%rip)
	vmovss	%xmm0, tbuf.3887+199040(%rip)
.L23:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-53516(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L23
	vmovss	tbuf.3887+205300(%rip), %xmm0
	movl	$tbuf.3887+205320, %eax
	vaddss	tbuf.3887+205304(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+56652, %edx
	movl	$tbuf.3887+211584, %ecx
	vmovss	%xmm0, tbuf.3887+205308(%rip)
	vmovss	tbuf.3887+56648(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	208568(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+205312(%rip)
	vmovss	%xmm0, tbuf.3887+205316(%rip)
.L24:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-56652(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L24
	vmovss	tbuf.3887+211576(%rip), %xmm0
	movl	$tbuf.3887+59788, %r13d
	vaddss	tbuf.3887+211580(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+211596, %eax
	movl	$tbuf.3887+217860, %r10d
	movq	%r13, %rdx
	vmovss	%xmm0, tbuf.3887+211584(%rip)
	vmovss	tbuf.3887+59784(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	214844(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+211588(%rip)
	vmovss	%xmm0, tbuf.3887+211592(%rip)
.L25:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-59788(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L25
	vmovss	tbuf.3887+217852(%rip), %xmm0
	movl	$tbuf.3887+217872, %eax
	vaddss	tbuf.3887+217856(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+62924, %edx
	movl	$tbuf.3887+224136, %r10d
	vmovss	%xmm0, tbuf.3887+217860(%rip)
	vmovss	tbuf.3887+62920(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	221120(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+217864(%rip)
	vmovss	%xmm0, tbuf.3887+217868(%rip)
.L26:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-62924(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L26
	vmovss	tbuf.3887+224128(%rip), %xmm0
	movl	$tbuf.3887+224148, %eax
	vaddss	tbuf.3887+224132(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+66060, %edx
	movl	$tbuf.3887+230412, %r10d
	vmovss	%xmm0, tbuf.3887+224136(%rip)
	vmovss	tbuf.3887+66056(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	227396(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+224140(%rip)
	vmovss	%xmm0, tbuf.3887+224144(%rip)
.L27:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-66060(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L27
	vmovss	tbuf.3887+230404(%rip), %xmm0
	movl	$tbuf.3887+230424, %eax
	vaddss	tbuf.3887+230408(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+69196, %edx
	vmovss	%xmm0, tbuf.3887+230412(%rip)
	vmovss	tbuf.3887+69192(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	233672(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+230416(%rip)
	vmovss	%xmm0, tbuf.3887+230420(%rip)
.L28:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-69196(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+236688, %rax
	jne	.L28
	vmovss	tbuf.3887+236680(%rip), %xmm0
	movl	$tbuf.3887+236700, %eax
	vaddss	tbuf.3887+236684(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+72332, %edx
	vmovss	%xmm0, tbuf.3887+236688(%rip)
	vmovss	tbuf.3887+72328(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	239948(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+236692(%rip)
	vmovss	%xmm0, tbuf.3887+236696(%rip)
.L29:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-72332(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+242964, %rax
	jne	.L29
	vmovss	tbuf.3887+242956(%rip), %xmm0
	movl	$tbuf.3887+242976, %eax
	vaddss	tbuf.3887+242960(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+75468, %edx
	vmovss	%xmm0, tbuf.3887+242964(%rip)
	vmovss	tbuf.3887+75464(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	246224(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+242968(%rip)
	vmovss	%xmm0, tbuf.3887+242972(%rip)
.L30:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-75468(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+249240, %rax
	jne	.L30
	vmovss	tbuf.3887+249232(%rip), %xmm0
	movl	$tbuf.3887+249252, %eax
	vaddss	tbuf.3887+249236(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+78604, %edx
	vmovss	%xmm0, tbuf.3887+249240(%rip)
	vmovss	tbuf.3887+78600(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	252500(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+249244(%rip)
	vmovss	%xmm0, tbuf.3887+249248(%rip)
.L31:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-78604(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+255516, %rax
	jne	.L31
	vmovss	tbuf.3887+255508(%rip), %xmm0
	movl	$tbuf.3887+255528, %eax
	vaddss	tbuf.3887+255512(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+81740, %edx
	vmovss	%xmm0, tbuf.3887+255516(%rip)
	vmovss	tbuf.3887+81736(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	258776(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+255520(%rip)
	vmovss	%xmm0, tbuf.3887+255524(%rip)
.L32:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-81740(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+261792, %rax
	jne	.L32
	vmovss	tbuf.3887+261784(%rip), %xmm0
	movl	$tbuf.3887+84876, %r14d
	vaddss	tbuf.3887+261788(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+261804, %eax
	movq	%r14, %r10
	vmovss	%xmm0, tbuf.3887+261792(%rip)
	vmovss	tbuf.3887+84872(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	265052(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+261796(%rip)
	vmovss	%xmm0, tbuf.3887+261800(%rip)
.L33:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r10
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r10), %xmm0
	vmulss	-84876(%r10), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+268068, %rax
	jne	.L33
	vmovss	tbuf.3887+268060(%rip), %xmm0
	movl	$tbuf.3887+268080, %eax
	vaddss	tbuf.3887+268064(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+88012, %r10d
	vmovss	%xmm0, tbuf.3887+268068(%rip)
	vmovss	tbuf.3887+88008(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	271328(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+268072(%rip)
	vmovss	%xmm0, tbuf.3887+268076(%rip)
.L34:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r10
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r10), %xmm0
	vmulss	-88012(%r10), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+274344, %rax
	jne	.L34
	vmovss	tbuf.3887+274336(%rip), %xmm0
	movl	$tbuf.3887+274356, %eax
	vaddss	tbuf.3887+274340(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+91148, %r10d
	vmovss	%xmm0, tbuf.3887+274344(%rip)
	vmovss	tbuf.3887+91144(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	277604(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+274348(%rip)
	vmovss	%xmm0, tbuf.3887+274352(%rip)
.L35:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r10
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r10), %xmm0
	vmulss	-91148(%r10), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+280620, %rax
	jne	.L35
	vmovss	tbuf.3887+280612(%rip), %xmm0
	movl	$tbuf.3887+280632, %eax
	vaddss	tbuf.3887+280616(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+94284, %r10d
	vmovss	%xmm0, tbuf.3887+280620(%rip)
	vmovss	tbuf.3887+94280(%rip), %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm0
	vmovss	283880(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+280624(%rip)
	vmovss	%xmm0, tbuf.3887+280628(%rip)
.L36:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r10
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r10), %xmm0
	vmulss	-94284(%r10), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+286896, %rax
	jne	.L36
	vmovss	tbuf.3887+286888(%rip), %xmm0
	movl	$tbuf.3887+3180, %eax
	vaddss	tbuf.3887+286892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+286896(%rip)
	vmovss	tbuf.3887+3176(%rip), %xmm0
	vaddss	tbuf.3887+104892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+286900(%rip)
	.p2align 4,,10
	.p2align 3
.L37:
	vmovss	(%rax), %xmm0
	addq	$6276, %r9
	addq	$4, %rax
	vaddss	-6276(%r9), %xmm0, %xmm0
	vmovss	%xmm0, 283720(%rax)
	cmpq	$tbuf.3887+293172, %r9
	jne	.L37
	vmovss	290276(%rbx), %xmm0
	movl	$tbuf.3887+286900, %eax
	vmovss	%xmm0, tbuf.3887+287020(%rip)
	vmovss	290280(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+287024(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L38:
	vsubss	(%rax), %xmm0, %xmm0
	addq	$4, %rax
	vmovss	%xmm0, 124(%rax)
	cmpq	$tbuf.3887+287020, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L38
	movl	$tbuf.3887+287028, %r15d
	.p2align 4,,10
	.p2align 3
.L39:
	vmovss	(%r15), %xmm0
	movq	%rsi, -72(%rbp)
	addq	$4, %r15
	movq	%rdi, -64(%rbp)
	movq	%r8, -56(%rbp)
	call	expf
	vmovss	%xmm0, 116(%r15)
	cmpq	$tbuf.3887+287148, %r15
	movq	-56(%rbp), %r8
	movq	-64(%rbp), %rdi
	movq	-72(%rbp), %rsi
	jne	.L39
	vmovss	tbuf.3887+287020(%rip), %xmm0
	movl	$tbuf.3887+287524, %eax
	vaddss	tbuf.3887+287152(%rip), %xmm0, %xmm1
	movl	$tbuf.3887+97424, %r9d
	movl	$tbuf.3887+287748, %r10d
	vaddss	tbuf.3887+287148(%rip), %xmm0, %xmm2
	vaddss	tbuf.3887+287264(%rip), %xmm0, %xmm4
	vmovss	%xmm1, tbuf.3887+287272(%rip)
	vaddss	tbuf.3887+287156(%rip), %xmm0, %xmm1
	vmovss	%xmm2, tbuf.3887+287268(%rip)
	vdivss	%xmm2, %xmm0, %xmm2
	vmovss	%xmm4, tbuf.3887+287384(%rip)
	vmovss	%xmm1, tbuf.3887+287276(%rip)
	vaddss	tbuf.3887+287160(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+287280(%rip)
	vaddss	tbuf.3887+287164(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+287284(%rip)
	vbroadcastss	%xmm0, %ymm1
	vaddps	tbuf.3887+287168(%rip), %ymm1, %ymm3
	vmovss	%xmm2, tbuf.3887+287388(%rip)
	vmovups	%xmm3, tbuf.3887+287288(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+287304(%rip)
	vaddps	tbuf.3887+287200(%rip), %ymm1, %ymm3
	vmovups	%xmm3, tbuf.3887+287320(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+287336(%rip)
	vaddps	tbuf.3887+287232(%rip), %ymm1, %ymm3
	vmovups	%xmm3, tbuf.3887+287352(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+287368(%rip)
	vmovups	tbuf.3887+287272(%rip), %xmm3
	vinsertf128	$0x1, tbuf.3887+287288(%rip), %ymm3, %ymm3
	vdivps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, tbuf.3887+287392(%rip)
	vmovups	tbuf.3887+287304(%rip), %xmm3
	vinsertf128	$0x1, tbuf.3887+287320(%rip), %ymm3, %ymm3
	vdivps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, tbuf.3887+287424(%rip)
	vmovups	tbuf.3887+287336(%rip), %xmm3
	vinsertf128	$0x1, tbuf.3887+287352(%rip), %ymm3, %ymm3
	vdivps	%ymm3, %ymm1, %ymm1
	vmovaps	%ymm1, tbuf.3887+287456(%rip)
	vdivss	tbuf.3887+287368(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+287488(%rip)
	vdivss	tbuf.3887+287372(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+287492(%rip)
	vdivss	tbuf.3887+287376(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+287496(%rip)
	vdivss	tbuf.3887+287380(%rip), %xmm0, %xmm1
	vdivss	%xmm4, %xmm0, %xmm0
	vmovss	%xmm1, tbuf.3887+287500(%rip)
	vmovss	%xmm0, tbuf.3887+287504(%rip)
	vmulss	tbuf.3887+97416(%rip), %xmm2, %xmm0
	vmovss	290804(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+287508(%rip)
	vmovss	%xmm0, tbuf.3887+287512(%rip)
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	tbuf.3887+97420(%rip), %xmm1
	vmulss	tbuf.3887+287392(%rip), %xmm1, %xmm1
	vmovss	%xmm0, tbuf.3887+287516(%rip)
	vmovss	%xmm1, tbuf.3887+287520(%rip)
.L40:
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm0, -8(%rax)
	vmovss	-4(%r9), %xmm1
	vmulss	189968(%r9), %xmm1, %xmm1
	vmovss	%xmm1, -4(%rax)
	cmpq	%rax, %r10
	jne	.L40
	vmovss	tbuf.3887+287740(%rip), %xmm0
	movl	$tbuf.3887+287760, %eax
	vaddss	tbuf.3887+287744(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+97540, %r9d
	movl	$tbuf.3887+287992, %r10d
	vmovss	%xmm0, tbuf.3887+287748(%rip)
	vmovss	tbuf.3887+97536(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	291048(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+287752(%rip)
	vmovss	%xmm0, tbuf.3887+287756(%rip)
.L41:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189848(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L41
	vmovss	tbuf.3887+287984(%rip), %xmm0
	movl	$tbuf.3887+288004, %eax
	vaddss	tbuf.3887+287988(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+97660, %r9d
	movl	$tbuf.3887+288236, %r10d
	vmovss	%xmm0, tbuf.3887+287992(%rip)
	vmovss	tbuf.3887+97656(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	291292(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+287996(%rip)
	vmovss	%xmm0, tbuf.3887+288000(%rip)
.L42:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189728(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L42
	vmovss	tbuf.3887+288228(%rip), %xmm0
	movl	$tbuf.3887+288248, %eax
	vaddss	tbuf.3887+288232(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+97780, %r9d
	movl	$tbuf.3887+288480, %r10d
	vmovss	%xmm0, tbuf.3887+288236(%rip)
	vmovss	tbuf.3887+97776(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	291536(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+288240(%rip)
	vmovss	%xmm0, tbuf.3887+288244(%rip)
.L43:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189608(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L43
	vmovss	tbuf.3887+288472(%rip), %xmm0
	movl	$tbuf.3887+288492, %eax
	vaddss	tbuf.3887+288476(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+97900, %r9d
	vmovss	%xmm0, tbuf.3887+288480(%rip)
	vmovss	tbuf.3887+97896(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	291780(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+288484(%rip)
	vmovss	%xmm0, tbuf.3887+288488(%rip)
.L44:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189488(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+288724, %rax
	jne	.L44
	vmovss	tbuf.3887+288716(%rip), %xmm0
	movl	$tbuf.3887+288736, %eax
	vaddss	tbuf.3887+288720(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+98020, %r9d
	movl	$tbuf.3887+288968, %r10d
	vmovss	%xmm0, tbuf.3887+288724(%rip)
	vmovss	tbuf.3887+98016(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	292024(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+288728(%rip)
	vmovss	%xmm0, tbuf.3887+288732(%rip)
.L45:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189368(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L45
	vmovss	tbuf.3887+288960(%rip), %xmm0
	movl	$tbuf.3887+288980, %eax
	vaddss	tbuf.3887+288964(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+98140, %r9d
	movl	$tbuf.3887+289212, %r10d
	vmovss	%xmm0, tbuf.3887+288968(%rip)
	vmovss	tbuf.3887+98136(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	292268(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+288972(%rip)
	vmovss	%xmm0, tbuf.3887+288976(%rip)
.L46:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189248(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L46
	vmovss	tbuf.3887+289204(%rip), %xmm0
	movl	$tbuf.3887+289224, %eax
	vaddss	tbuf.3887+289208(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+98260, %r9d
	movl	$tbuf.3887+289456, %r10d
	vmovss	%xmm0, tbuf.3887+289212(%rip)
	vmovss	tbuf.3887+98256(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	292512(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+289216(%rip)
	vmovss	%xmm0, tbuf.3887+289220(%rip)
.L47:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189128(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L47
	vmovss	tbuf.3887+289448(%rip), %xmm0
	movl	$tbuf.3887+289468, %eax
	vaddss	tbuf.3887+289452(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+98380, %r9d
	movl	$tbuf.3887+289700, %r10d
	vmovss	%xmm0, tbuf.3887+289456(%rip)
	vmovss	tbuf.3887+98376(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	292756(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+289460(%rip)
	vmovss	%xmm0, tbuf.3887+289464(%rip)
.L48:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	189008(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r10
	jne	.L48
	vmovss	tbuf.3887+289692(%rip), %xmm0
	movl	$tbuf.3887+289712, %eax
	vaddss	tbuf.3887+289696(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+98500, %r9d
	vmovss	%xmm0, tbuf.3887+289700(%rip)
	vmovss	tbuf.3887+98496(%rip), %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm0
	vmovss	293000(%rbx), %xmm1
	vmovss	%xmm1, tbuf.3887+289704(%rip)
	vmovss	%xmm0, tbuf.3887+289708(%rip)
.L49:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %r9
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%r9), %xmm0
	vmulss	188888(%r9), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.3887+289944, %rax
	jne	.L49
	vmovss	tbuf.3887+289936(%rip), %xmm0
	movl	$tbuf.3887+289996, %r15d
	vaddss	tbuf.3887+289940(%rip), %xmm0, %xmm0
	vmovss	tbuf.3887+3296(%rip), %xmm6
	vmovss	tbuf.3887+3300(%rip), %xmm5
	vaddss	tbuf.3887+287748(%rip), %xmm6, %xmm6
	vmovss	tbuf.3887+3304(%rip), %xmm4
	vaddss	tbuf.3887+287992(%rip), %xmm5, %xmm5
	vmovss	tbuf.3887+3308(%rip), %xmm3
	vaddss	tbuf.3887+288236(%rip), %xmm4, %xmm4
	vmovss	tbuf.3887+3312(%rip), %xmm2
	vaddss	tbuf.3887+288480(%rip), %xmm3, %xmm3
	vmovss	tbuf.3887+3316(%rip), %xmm10
	vaddss	tbuf.3887+288724(%rip), %xmm2, %xmm2
	vmovss	tbuf.3887+3320(%rip), %xmm9
	vaddss	tbuf.3887+3332(%rip), %xmm0, %xmm1
	vmovss	tbuf.3887+3324(%rip), %xmm8
	vaddss	tbuf.3887+288968(%rip), %xmm10, %xmm10
	vmovss	tbuf.3887+3328(%rip), %xmm7
	vaddss	tbuf.3887+289212(%rip), %xmm9, %xmm9
	vaddss	tbuf.3887+289456(%rip), %xmm8, %xmm8
	vmovss	%xmm6, tbuf.3887+289948(%rip)
	vaddss	tbuf.3887+289700(%rip), %xmm7, %xmm7
	vmovss	%xmm5, tbuf.3887+289952(%rip)
	vmovss	%xmm4, tbuf.3887+289956(%rip)
	vmovss	%xmm3, tbuf.3887+289960(%rip)
	vmovss	%xmm2, tbuf.3887+289964(%rip)
	vmovss	%xmm10, tbuf.3887+289968(%rip)
	vmovss	%xmm9, tbuf.3887+289972(%rip)
	vmovss	%xmm8, tbuf.3887+289976(%rip)
	vmovss	%xmm7, tbuf.3887+289980(%rip)
	vmovss	%xmm1, tbuf.3887+289984(%rip)
	vmovss	%xmm0, tbuf.3887+289944(%rip)
	vmovss	293284(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+289988(%rip)
	vmovss	293288(%rbx), %xmm0
	vsubss	%xmm6, %xmm0, %xmm6
	vmovss	%xmm0, tbuf.3887+289992(%rip)
	vsubss	%xmm5, %xmm0, %xmm5
	vsubss	%xmm4, %xmm0, %xmm4
	vsubss	%xmm3, %xmm0, %xmm3
	vsubss	%xmm2, %xmm0, %xmm2
	vmovss	%xmm6, tbuf.3887+289996(%rip)
	vsubss	%xmm10, %xmm0, %xmm10
	vmovss	%xmm5, tbuf.3887+290000(%rip)
	vsubss	%xmm9, %xmm0, %xmm9
	vmovss	%xmm4, tbuf.3887+290004(%rip)
	vsubss	%xmm8, %xmm0, %xmm8
	vmovss	%xmm3, tbuf.3887+290008(%rip)
	vsubss	%xmm7, %xmm0, %xmm7
	vmovss	%xmm2, tbuf.3887+290012(%rip)
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm10, tbuf.3887+290016(%rip)
	vmovss	%xmm9, tbuf.3887+290020(%rip)
	vmovss	%xmm8, tbuf.3887+290024(%rip)
	vmovss	%xmm7, tbuf.3887+290028(%rip)
	vmovss	%xmm0, tbuf.3887+290032(%rip)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L50:
	vmovss	(%r15), %xmm0
	addq	$4, %r15
	movq	%rsi, -72(%rbp)
	movq	%rdi, -64(%rbp)
	movq	%r8, -56(%rbp)
	call	expf
	movl	$tbuf.3887+290036, %eax
	vmovss	%xmm0, 36(%r15)
	movq	-56(%rbp), %r8
	cmpq	%r15, %rax
	movq	-64(%rbp), %rdi
	movq	-72(%rbp), %rsi
	jne	.L50
	vmovss	tbuf.3887+289988(%rip), %xmm0
	leaq	293492(%rbx), %rax
	vaddss	tbuf.3887+290036(%rip), %xmm0, %xmm1
	vmovups	tbuf.3887+290040(%rip), %xmm2
	cmpq	$tbuf.3887+290228, %rax
	vaddss	tbuf.3887+290072(%rip), %xmm0, %xmm3
	vinsertf128	$0x1, tbuf.3887+290056(%rip), %ymm2, %ymm2
	vmovss	%xmm1, tbuf.3887+290076(%rip)
	vbroadcastss	%xmm0, %ymm1
	vaddps	%ymm1, %ymm2, %ymm2
	vmovss	%xmm3, tbuf.3887+290112(%rip)
	vmovaps	%ymm2, tbuf.3887+290080(%rip)
	vmovups	tbuf.3887+290076(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+290092(%rip), %ymm2, %ymm2
	vdivps	%ymm2, %ymm1, %ymm1
	vdivss	tbuf.3887+290108(%rip), %xmm0, %xmm2
	vmovups	%xmm1, tbuf.3887+290116(%rip)
	vdivss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm2, tbuf.3887+290148(%rip)
	vsubss	tbuf.3887+3168(%rip), %xmm2, %xmm2
	vmovss	%xmm2, tbuf.3887+290188(%rip)
	vextractf128	$0x1, %ymm1, tbuf.3887+290132(%rip)
	vsubps	tbuf.3887+3136(%rip), %ymm1, %ymm1
	vmovss	%xmm0, tbuf.3887+290152(%rip)
	vsubss	tbuf.3887+3172(%rip), %xmm0, %xmm0
	vmovups	%xmm1, tbuf.3887+290156(%rip)
	vextractf128	$0x1, %ymm1, tbuf.3887+290172(%rip)
	vmovss	%xmm0, tbuf.3887+290192(%rip)
	jnb	.L324
	leaq	293524(%rbx), %rax
	cmpq	$tbuf.3887+290196, %rax
	ja	.L51
.L324:
	vmovss	293492(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+290196(%rip)
	vmovss	293496(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+290200(%rip)
	vmovss	293500(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+290204(%rip)
	vmovups	293504(%rbx), %xmm0
	vinsertf128	$0x1, 293520(%rbx), %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+290208(%rip)
	vmovups	293536(%rbx), %xmm0
	vinsertf128	$0x1, 293552(%rbx), %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+290240(%rip)
	vmovups	293568(%rbx), %xmm0
	vinsertf128	$0x1, 293584(%rbx), %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+290272(%rip)
	vmovss	293600(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+290304(%rip)
	vmovss	293604(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+290308(%rip)
	vmovss	293608(%rbx), %xmm0
	vmovss	%xmm0, tbuf.3887+290312(%rip)
.L53:
	vmovss	tbuf.3887+290156(%rip), %xmm1
	movl	$tbuf.3887+287400, %r9d
	movl	$tbuf.3887+287508, %eax
	vmulss	tbuf.3887+97428(%rip), %xmm1, %xmm0
	vbroadcastss	%xmm1, %ymm4
	vmovups	tbuf.3887+97436(%rip), %xmm3
	vmulss	tbuf.3887+97424(%rip), %xmm1, %xmm6
	vinsertf128	$0x1, tbuf.3887+97452(%rip), %ymm3, %ymm3
	vmulss	tbuf.3887+97420(%rip), %xmm1, %xmm7
	vmovss	%xmm0, tbuf.3887+290328(%rip)
	vmulss	tbuf.3887+97432(%rip), %xmm1, %xmm0
	vmulss	tbuf.3887+97416(%rip), %xmm1, %xmm5
	vmulps	%ymm4, %ymm3, %ymm3
	vmovss	%xmm6, tbuf.3887+290324(%rip)
	vmulss	tbuf.3887+97532(%rip), %xmm1, %xmm1
	vaddss	tbuf.3887+290200(%rip), %xmm7, %xmm2
	vmovss	%xmm7, tbuf.3887+290320(%rip)
	vmovss	%xmm0, tbuf.3887+290332(%rip)
	vmovaps	%ymm3, tbuf.3887+290336(%rip)
	vmovss	%xmm5, tbuf.3887+290316(%rip)
	vaddss	tbuf.3887+290196(%rip), %xmm5, %xmm5
	vmovss	%xmm1, tbuf.3887+290432(%rip)
	vmovups	tbuf.3887+97500(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97516(%rip), %ymm0, %ymm0
	vmovss	%xmm2, tbuf.3887+290440(%rip)
	vmovups	tbuf.3887+97468(%rip), %xmm3
	vinsertf128	$0x1, tbuf.3887+97484(%rip), %ymm3, %ymm3
	vmovss	%xmm5, tbuf.3887+290436(%rip)
	vmulps	%ymm4, %ymm0, %ymm0
	vmulps	%ymm4, %ymm3, %ymm3
	vmovaps	%ymm0, tbuf.3887+290400(%rip)
	vaddss	tbuf.3887+290204(%rip), %xmm6, %xmm0
	vmovaps	%ymm3, tbuf.3887+290368(%rip)
	vmovss	%xmm0, tbuf.3887+290444(%rip)
	vmovups	tbuf.3887+290328(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+290344(%rip), %ymm0, %ymm0
	vaddps	tbuf.3887+290208(%rip), %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.3887+290448(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+290464(%rip)
	vaddss	tbuf.3887+290312(%rip), %xmm1, %xmm3
	vmovups	tbuf.3887+290360(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+290376(%rip), %ymm0, %ymm0
	vmovss	tbuf.3887+290160(%rip), %xmm1
	vmovss	tbuf.3887+290304(%rip), %xmm6
	vmulss	tbuf.3887+97636(%rip), %xmm1, %xmm8
	vmovss	tbuf.3887+290308(%rip), %xmm4
	vaddss	tbuf.3887+290424(%rip), %xmm6, %xmm6
	vaddss	tbuf.3887+290428(%rip), %xmm4, %xmm4
	vmovss	%xmm3, tbuf.3887+290552(%rip)
	vaddps	tbuf.3887+290240(%rip), %ymm0, %ymm0
	vmovss	%xmm8, tbuf.3887+290656(%rip)
	vmovss	%xmm6, tbuf.3887+290544(%rip)
	vmovss	%xmm4, tbuf.3887+290548(%rip)
	vmovaps	%xmm0, tbuf.3887+290480(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+290496(%rip)
	vmovups	tbuf.3887+290392(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+290408(%rip), %ymm0, %ymm0
	vaddps	tbuf.3887+290272(%rip), %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.3887+290512(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+290528(%rip)
	vbroadcastss	%xmm1, %ymm0
	vmulps	tbuf.3887+97536(%rip), %ymm0, %ymm2
	vmovups	%xmm2, tbuf.3887+290556(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+290572(%rip)
	vmulps	tbuf.3887+97568(%rip), %ymm0, %ymm2
	vmulps	tbuf.3887+97600(%rip), %ymm0, %ymm0
	vmovups	%xmm2, tbuf.3887+290588(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+290604(%rip)
	vmovups	%xmm0, tbuf.3887+290620(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+290636(%rip)
	vmulss	tbuf.3887+97632(%rip), %xmm1, %xmm0
	vmovss	%xmm0, tbuf.3887+290652(%rip)
	vmulss	tbuf.3887+97640(%rip), %xmm1, %xmm7
	vaddss	tbuf.3887+290556(%rip), %xmm5, %xmm2
	vmovups	tbuf.3887+290440(%rip), %xmm0
	vmulss	tbuf.3887+97644(%rip), %xmm1, %xmm10
	vinsertf128	$0x1, tbuf.3887+290456(%rip), %ymm0, %ymm0
	vaddss	tbuf.3887+290536(%rip), %xmm8, %xmm8
	vmulss	tbuf.3887+97648(%rip), %xmm1, %xmm9
	vmulss	tbuf.3887+97652(%rip), %xmm1, %xmm1
	vmovss	%xmm7, tbuf.3887+290660(%rip)
	vaddss	tbuf.3887+290540(%rip), %xmm7, %xmm7
	vmovss	%xmm2, tbuf.3887+290676(%rip)
	vaddss	%xmm6, %xmm10, %xmm6
	vmovss	%xmm10, tbuf.3887+290664(%rip)
	vmovss	%xmm8, tbuf.3887+290776(%rip)
	vaddps	tbuf.3887+290560(%rip), %ymm0, %ymm0
	vmovss	%xmm9, tbuf.3887+290668(%rip)
	vmovss	%xmm1, tbuf.3887+290672(%rip)
	vaddss	%xmm9, %xmm4, %xmm4
	vmovss	%xmm7, tbuf.3887+290780(%rip)
	vaddss	%xmm1, %xmm3, %xmm1
	vmovss	%xmm6, tbuf.3887+290784(%rip)
	vmovss	%xmm4, tbuf.3887+290788(%rip)
	vmovups	%xmm0, tbuf.3887+290680(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+290696(%rip)
	vmovss	%xmm1, tbuf.3887+290792(%rip)
	vmovups	tbuf.3887+290472(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+290488(%rip), %ymm0, %ymm0
	vaddps	tbuf.3887+290592(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+290712(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+290728(%rip)
	vmovups	tbuf.3887+290504(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+290520(%rip), %ymm0, %ymm0
	vaddps	tbuf.3887+290624(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+290744(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+290760(%rip)
	vmovss	tbuf.3887+290164(%rip), %xmm0
	vbroadcastss	%xmm0, %ymm3
	vmulss	tbuf.3887+97656(%rip), %xmm0, %xmm5
	vmulss	tbuf.3887+97660(%rip), %xmm0, %xmm8
	vmulps	tbuf.3887+97664(%rip), %ymm3, %ymm7
	vmovss	%xmm5, tbuf.3887+290796(%rip)
	vaddss	%xmm5, %xmm2, %xmm5
	vmovss	tbuf.3887+290684(%rip), %xmm2
	vmovss	%xmm8, tbuf.3887+290800(%rip)
	vaddss	tbuf.3887+290680(%rip), %xmm8, %xmm8
	vmovups	%xmm7, tbuf.3887+290804(%rip)
	vextractf128	$0x1, %ymm7, tbuf.3887+290820(%rip)
	vmovss	%xmm5, tbuf.3887+290916(%rip)
	vaddss	tbuf.3887+290804(%rip), %xmm2, %xmm2
	vmulps	tbuf.3887+97696(%rip), %ymm3, %ymm7
	vmovss	%xmm8, tbuf.3887+290920(%rip)
	vmulps	tbuf.3887+97728(%rip), %ymm3, %ymm3
	vmovss	%xmm2, tbuf.3887+290924(%rip)
	vmovups	tbuf.3887+290808(%rip), %xmm2
	vextractf128	$0x1, %ymm7, tbuf.3887+290852(%rip)
	vmovups	%xmm7, tbuf.3887+290836(%rip)
	vmulss	tbuf.3887+97764(%rip), %xmm0, %xmm7
	vmovups	%xmm3, tbuf.3887+290868(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+290884(%rip)
	vinsertf128	$0x1, tbuf.3887+290824(%rip), %ymm2, %ymm2
	vmovss	%xmm7, tbuf.3887+290904(%rip)
	vaddss	%xmm7, %xmm6, %xmm6
	vmulss	tbuf.3887+97760(%rip), %xmm0, %xmm3
	vaddps	tbuf.3887+290688(%rip), %ymm2, %ymm2
	vmovss	%xmm3, tbuf.3887+290900(%rip)
	vmulss	tbuf.3887+97768(%rip), %xmm0, %xmm3
	vmulss	tbuf.3887+97772(%rip), %xmm0, %xmm0
	vmovaps	%xmm2, tbuf.3887+290928(%rip)
	vmovss	%xmm3, tbuf.3887+290908(%rip)
	vaddss	%xmm3, %xmm4, %xmm4
	vmovss	%xmm0, tbuf.3887+290912(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+290944(%rip)
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	tbuf.3887+290168(%rip), %xmm0
	vbroadcastss	%xmm0, %ymm8
	vmulss	tbuf.3887+97776(%rip), %xmm0, %xmm13
	vmovss	%xmm6, tbuf.3887+291024(%rip)
	vmovups	tbuf.3887+290840(%rip), %xmm2
	vmulss	tbuf.3887+97884(%rip), %xmm0, %xmm11
	vinsertf128	$0x1, tbuf.3887+290856(%rip), %ymm2, %ymm2
	vmovss	%xmm4, tbuf.3887+291028(%rip)
	vmovss	%xmm1, tbuf.3887+291032(%rip)
	vmulss	tbuf.3887+97876(%rip), %xmm0, %xmm9
	vmulss	tbuf.3887+97888(%rip), %xmm0, %xmm10
	vmovss	%xmm13, tbuf.3887+291036(%rip)
	vaddss	%xmm5, %xmm13, %xmm5
	vmovss	%xmm11, tbuf.3887+291144(%rip)
	vaddss	%xmm6, %xmm11, %xmm6
	vaddps	tbuf.3887+290720(%rip), %ymm2, %ymm2
	vmovss	%xmm9, tbuf.3887+291136(%rip)
	vaddss	%xmm10, %xmm4, %xmm4
	vmovaps	%xmm2, tbuf.3887+290960(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+290976(%rip)
	vmovups	tbuf.3887+290872(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+290888(%rip), %ymm2, %ymm2
	vaddps	tbuf.3887+290752(%rip), %ymm2, %ymm2
	vmovaps	%xmm2, tbuf.3887+290992(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+291008(%rip)
	vmovups	tbuf.3887+97780(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+97796(%rip), %ymm2, %ymm2
	vmulps	%ymm8, %ymm2, %ymm3
	vmovups	tbuf.3887+97812(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+97828(%rip), %ymm2, %ymm2
	vmovaps	%ymm3, tbuf.3887+291040(%rip)
	vmulps	%ymm8, %ymm2, %ymm12
	vmovups	tbuf.3887+97844(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+97860(%rip), %ymm2, %ymm2
	vmovaps	%ymm12, tbuf.3887+291072(%rip)
	vmulps	%ymm8, %ymm2, %ymm7
	vmulss	tbuf.3887+97880(%rip), %xmm0, %xmm8
	vmovaps	%ymm7, tbuf.3887+291104(%rip)
	vmovss	%xmm8, tbuf.3887+291140(%rip)
	vmovss	%xmm10, tbuf.3887+291148(%rip)
	vmulss	tbuf.3887+97892(%rip), %xmm0, %xmm0
	vaddss	tbuf.3887+291016(%rip), %xmm9, %xmm9
	vaddss	tbuf.3887+291020(%rip), %xmm8, %xmm8
	vmovss	%xmm5, tbuf.3887+291156(%rip)
	vmovss	%xmm6, tbuf.3887+291264(%rip)
	vmovss	%xmm4, tbuf.3887+291268(%rip)
	vmovups	tbuf.3887+290920(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+290936(%rip), %ymm2, %ymm2
	vmovss	%xmm0, tbuf.3887+291152(%rip)
	vmovss	%xmm9, tbuf.3887+291256(%rip)
	vmovss	%xmm8, tbuf.3887+291260(%rip)
	vaddps	%ymm3, %ymm2, %ymm2
	vaddss	%xmm0, %xmm1, %xmm3
	vmovss	tbuf.3887+290172(%rip), %xmm1
	vmulss	tbuf.3887+97908(%rip), %xmm1, %xmm0
	vbroadcastss	%xmm1, %ymm10
	vmulss	tbuf.3887+97896(%rip), %xmm1, %xmm9
	vmovups	%xmm2, tbuf.3887+291160(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+291176(%rip)
	vmovss	%xmm3, tbuf.3887+291272(%rip)
	vmulss	tbuf.3887+97900(%rip), %xmm1, %xmm8
	vmovss	%xmm0, tbuf.3887+291288(%rip)
	vmovups	tbuf.3887+290952(%rip), %xmm2
	vaddss	%xmm9, %xmm5, %xmm5
	vmulss	tbuf.3887+97912(%rip), %xmm1, %xmm0
	vinsertf128	$0x1, tbuf.3887+290968(%rip), %ymm2, %ymm2
	vmovss	%xmm9, tbuf.3887+291276(%rip)
	vmovss	%xmm8, tbuf.3887+291280(%rip)
	vaddps	%ymm12, %ymm2, %ymm2
	vmovups	%xmm2, tbuf.3887+291192(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+291208(%rip)
	vmovups	tbuf.3887+290984(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+291000(%rip), %ymm2, %ymm2
	vaddps	%ymm7, %ymm2, %ymm2
	vmulss	tbuf.3887+97904(%rip), %xmm1, %xmm7
	vmovups	%xmm2, tbuf.3887+291224(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+291240(%rip)
	vmovss	%xmm7, tbuf.3887+291284(%rip)
	vmovss	%xmm0, tbuf.3887+291292(%rip)
	vmulss	tbuf.3887+98012(%rip), %xmm1, %xmm1
	vmovss	%xmm5, tbuf.3887+291396(%rip)
	vaddss	tbuf.3887+291160(%rip), %xmm8, %xmm8
	vaddss	tbuf.3887+291164(%rip), %xmm7, %xmm7
	vmovups	tbuf.3887+97916(%rip), %xmm2
	vmovups	tbuf.3887+97980(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97932(%rip), %ymm2, %ymm2
	vmovss	%xmm1, tbuf.3887+291392(%rip)
	vinsertf128	$0x1, tbuf.3887+97996(%rip), %ymm0, %ymm0
	vmovss	%xmm8, tbuf.3887+291400(%rip)
	vmovss	%xmm7, tbuf.3887+291404(%rip)
	vmulps	%ymm10, %ymm2, %ymm2
	vmulps	%ymm10, %ymm0, %ymm0
	vmovaps	%ymm2, tbuf.3887+291296(%rip)
	vmovups	tbuf.3887+97948(%rip), %xmm2
	vmovaps	%ymm0, tbuf.3887+291360(%rip)
	vinsertf128	$0x1, tbuf.3887+97964(%rip), %ymm2, %ymm2
	vmovups	tbuf.3887+291288(%rip), %xmm0
	vaddss	tbuf.3887+291384(%rip), %xmm6, %xmm6
	vinsertf128	$0x1, tbuf.3887+291304(%rip), %ymm0, %ymm0
	vmulps	%ymm10, %ymm2, %ymm2
	vaddps	tbuf.3887+291168(%rip), %ymm0, %ymm0
	vmovaps	%ymm2, tbuf.3887+291328(%rip)
	vmovaps	%xmm0, tbuf.3887+291408(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+291424(%rip)
	vmovups	tbuf.3887+291320(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+291336(%rip), %ymm0, %ymm0
	vaddps	tbuf.3887+291200(%rip), %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.3887+291440(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+291456(%rip)
	vmovups	tbuf.3887+291352(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+291368(%rip), %ymm0, %ymm0
	vaddps	tbuf.3887+291232(%rip), %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.3887+291472(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+291488(%rip)
	vaddss	%xmm1, %xmm3, %xmm0
	vmovss	%xmm6, tbuf.3887+291504(%rip)
	vmovss	tbuf.3887+290176(%rip), %xmm1
	vbroadcastss	%xmm1, %ymm2
	vmovups	tbuf.3887+291400(%rip), %xmm7
	vaddss	tbuf.3887+291388(%rip), %xmm4, %xmm4
	vmulss	tbuf.3887+98116(%rip), %xmm1, %xmm9
	vmulps	tbuf.3887+98016(%rip), %ymm2, %ymm3
	vmovss	%xmm0, tbuf.3887+291512(%rip)
	vmulss	tbuf.3887+98120(%rip), %xmm1, %xmm8
	vinsertf128	$0x1, tbuf.3887+291416(%rip), %ymm7, %ymm7
	vmovss	%xmm4, tbuf.3887+291508(%rip)
	vmovss	%xmm9, tbuf.3887+291616(%rip)
	vmovups	%xmm3, tbuf.3887+291516(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+291532(%rip)
	vmovss	%xmm8, tbuf.3887+291620(%rip)
	vaddss	tbuf.3887+291516(%rip), %xmm5, %xmm5
	vmulps	tbuf.3887+98048(%rip), %ymm2, %ymm3
	vmulps	tbuf.3887+98080(%rip), %ymm2, %ymm2
	vmovss	%xmm5, tbuf.3887+291636(%rip)
	vmovups	%xmm3, tbuf.3887+291548(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+291564(%rip)
	vmovups	%xmm2, tbuf.3887+291580(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+291596(%rip)
	vmulss	tbuf.3887+98112(%rip), %xmm1, %xmm2
	vaddps	tbuf.3887+291520(%rip), %ymm7, %ymm7
	vmulss	tbuf.3887+98128(%rip), %xmm1, %xmm3
	vmovss	%xmm2, tbuf.3887+291612(%rip)
	vmulss	tbuf.3887+98124(%rip), %xmm1, %xmm2
	vmulss	tbuf.3887+98132(%rip), %xmm1, %xmm1
	vmovss	%xmm3, tbuf.3887+291628(%rip)
	vextractf128	$0x1, %ymm7, tbuf.3887+291656(%rip)
	vmovups	%xmm7, tbuf.3887+291640(%rip)
	vaddss	%xmm3, %xmm4, %xmm3
	vmovss	%xmm2, tbuf.3887+291624(%rip)
	vaddss	%xmm6, %xmm2, %xmm6
	vmovss	%xmm1, tbuf.3887+291632(%rip)
	vaddss	%xmm1, %xmm0, %xmm1
	vmovups	tbuf.3887+291432(%rip), %xmm7
	vaddss	tbuf.3887+291500(%rip), %xmm8, %xmm8
	vinsertf128	$0x1, tbuf.3887+291448(%rip), %ymm7, %ymm7
	vmovss	%xmm6, tbuf.3887+291744(%rip)
	vmovss	tbuf.3887+290180(%rip), %xmm0
	vaddss	tbuf.3887+291496(%rip), %xmm9, %xmm9
	vbroadcastss	%xmm0, %ymm2
	vmulss	tbuf.3887+98140(%rip), %xmm0, %xmm4
	vmovss	%xmm3, tbuf.3887+291748(%rip)
	vmovss	%xmm1, tbuf.3887+291752(%rip)
	vmovss	%xmm8, tbuf.3887+291740(%rip)
	vmulss	tbuf.3887+98136(%rip), %xmm0, %xmm8
	vaddps	tbuf.3887+291552(%rip), %ymm7, %ymm7
	vmovss	%xmm9, tbuf.3887+291736(%rip)
	vmovss	%xmm4, tbuf.3887+291760(%rip)
	vmovss	%xmm8, tbuf.3887+291756(%rip)
	vaddss	%xmm8, %xmm5, %xmm5
	vmovups	%xmm7, tbuf.3887+291672(%rip)
	vextractf128	$0x1, %ymm7, tbuf.3887+291688(%rip)
	vmovups	tbuf.3887+291464(%rip), %xmm7
	vinsertf128	$0x1, tbuf.3887+291480(%rip), %ymm7, %ymm7
	vaddps	tbuf.3887+291584(%rip), %ymm7, %ymm7
	vmovups	%xmm7, tbuf.3887+291704(%rip)
	vextractf128	$0x1, %ymm7, tbuf.3887+291720(%rip)
	vmulps	tbuf.3887+98144(%rip), %ymm2, %ymm7
	vmovups	%xmm7, tbuf.3887+291764(%rip)
	vextractf128	$0x1, %ymm7, tbuf.3887+291780(%rip)
	vmulps	tbuf.3887+98176(%rip), %ymm2, %ymm7
	vmulps	tbuf.3887+98208(%rip), %ymm2, %ymm2
	vmovups	%xmm7, tbuf.3887+291796(%rip)
	vextractf128	$0x1, %ymm7, tbuf.3887+291812(%rip)
	vmovups	%xmm2, tbuf.3887+291828(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+291844(%rip)
	vmulss	tbuf.3887+98240(%rip), %xmm0, %xmm2
	vmovss	%xmm2, tbuf.3887+291860(%rip)
	vaddss	tbuf.3887+291640(%rip), %xmm4, %xmm4
	vmulss	tbuf.3887+98244(%rip), %xmm0, %xmm7
	vmulss	tbuf.3887+98248(%rip), %xmm0, %xmm2
	vmovss	%xmm5, tbuf.3887+291876(%rip)
	vmulss	tbuf.3887+98252(%rip), %xmm0, %xmm0
	vmovss	%xmm4, tbuf.3887+291880(%rip)
	vaddss	%xmm7, %xmm6, %xmm6
	vmovss	tbuf.3887+291644(%rip), %xmm4
	vaddss	%xmm2, %xmm3, %xmm3
	vaddss	tbuf.3887+291764(%rip), %xmm4, %xmm4
	vmovss	%xmm2, tbuf.3887+291868(%rip)
	vaddss	%xmm0, %xmm1, %xmm2
	vmovss	tbuf.3887+290184(%rip), %xmm1
	vmulss	tbuf.3887+98256(%rip), %xmm1, %xmm13
	vmovss	%xmm7, tbuf.3887+291864(%rip)
	vbroadcastss	%xmm1, %ymm7
	vmovss	%xmm0, tbuf.3887+291872(%rip)
	vmovss	%xmm6, tbuf.3887+291984(%rip)
	vmovss	%xmm3, tbuf.3887+291988(%rip)
	vmovss	%xmm4, tbuf.3887+291884(%rip)
	vmovss	%xmm2, tbuf.3887+291992(%rip)
	vaddss	%xmm5, %xmm13, %xmm5
	vmovups	tbuf.3887+291768(%rip), %xmm4
	vinsertf128	$0x1, tbuf.3887+291784(%rip), %ymm4, %ymm4
	vaddps	tbuf.3887+291648(%rip), %ymm4, %ymm4
	vmovaps	%xmm4, tbuf.3887+291888(%rip)
	vextractf128	$0x1, %ymm4, tbuf.3887+291904(%rip)
	vmovups	tbuf.3887+291800(%rip), %xmm4
	vinsertf128	$0x1, tbuf.3887+291816(%rip), %ymm4, %ymm4
	vaddps	tbuf.3887+291680(%rip), %ymm4, %ymm4
	vmovaps	%xmm4, tbuf.3887+291920(%rip)
	vextractf128	$0x1, %ymm4, tbuf.3887+291936(%rip)
	vmovups	tbuf.3887+291832(%rip), %xmm4
	vinsertf128	$0x1, tbuf.3887+291848(%rip), %ymm4, %ymm4
	vaddps	tbuf.3887+291712(%rip), %ymm4, %ymm4
	vmovaps	%xmm4, tbuf.3887+291952(%rip)
	vextractf128	$0x1, %ymm4, tbuf.3887+291968(%rip)
	vmovss	%xmm13, tbuf.3887+291996(%rip)
	vmovss	%xmm5, tbuf.3887+292116(%rip)
	vmulss	tbuf.3887+98364(%rip), %xmm1, %xmm10
	vmulss	tbuf.3887+98368(%rip), %xmm1, %xmm9
	vmovups	tbuf.3887+98260(%rip), %xmm0
	vmulss	tbuf.3887+98356(%rip), %xmm1, %xmm8
	vinsertf128	$0x1, tbuf.3887+98276(%rip), %ymm0, %ymm0
	vmovss	%xmm10, tbuf.3887+292104(%rip)
	vaddss	%xmm6, %xmm10, %xmm6
	vmovss	%xmm9, tbuf.3887+292108(%rip)
	vaddss	%xmm9, %xmm3, %xmm3
	vmulps	%ymm7, %ymm0, %ymm12
	vmovss	%xmm8, tbuf.3887+292096(%rip)
	vmovups	tbuf.3887+98292(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+98308(%rip), %ymm0, %ymm0
	vmovaps	%ymm12, tbuf.3887+292000(%rip)
	vmulps	%ymm7, %ymm0, %ymm11
	vmovups	tbuf.3887+98324(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+98340(%rip), %ymm0, %ymm0
	vmovaps	%ymm11, tbuf.3887+292032(%rip)
	vmulps	%ymm7, %ymm0, %ymm4
	vmovups	tbuf.3887+291880(%rip), %xmm0
	vmulss	tbuf.3887+98360(%rip), %xmm1, %xmm7
	vinsertf128	$0x1, tbuf.3887+291896(%rip), %ymm0, %ymm0
	vmulss	tbuf.3887+98372(%rip), %xmm1, %xmm1
	vmovaps	%ymm4, tbuf.3887+292064(%rip)
	vaddps	%ymm12, %ymm0, %ymm0
	vmovss	%xmm7, tbuf.3887+292100(%rip)
	vmovss	%xmm1, tbuf.3887+292112(%rip)
	vmovups	%xmm0, tbuf.3887+292120(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+292136(%rip)
	vmovups	tbuf.3887+291912(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+291928(%rip), %ymm0, %ymm0
	vaddps	%ymm11, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+292152(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+292168(%rip)
	vmovups	tbuf.3887+291944(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+291960(%rip), %ymm0, %ymm0
	vaddps	%ymm4, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+292184(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+292200(%rip)
	vaddss	tbuf.3887+291976(%rip), %xmm8, %xmm8
	vaddss	%xmm1, %xmm2, %xmm0
	vmovss	%xmm6, tbuf.3887+292224(%rip)
	vmovss	%xmm3, tbuf.3887+292228(%rip)
	vmovss	tbuf.3887+290188(%rip), %xmm1
	vmulss	tbuf.3887+98388(%rip), %xmm1, %xmm2
	vbroadcastss	%xmm1, %ymm10
	vmovups	tbuf.3887+98396(%rip), %xmm4
	vaddss	tbuf.3887+291980(%rip), %xmm7, %xmm7
	vmulss	tbuf.3887+98376(%rip), %xmm1, %xmm9
	vinsertf128	$0x1, tbuf.3887+98412(%rip), %ymm4, %ymm4
	vmovss	%xmm8, tbuf.3887+292216(%rip)
	vmovss	%xmm0, tbuf.3887+292232(%rip)
	vmulss	tbuf.3887+98380(%rip), %xmm1, %xmm8
	vmovss	%xmm2, tbuf.3887+292248(%rip)
	vmulss	tbuf.3887+98392(%rip), %xmm1, %xmm2
	vmulps	%ymm10, %ymm4, %ymm4
	vmovss	%xmm7, tbuf.3887+292220(%rip)
	vaddss	%xmm9, %xmm5, %xmm5
	vmovss	%xmm9, tbuf.3887+292236(%rip)
	vmulss	tbuf.3887+98384(%rip), %xmm1, %xmm7
	vmovss	%xmm8, tbuf.3887+292240(%rip)
	vmulss	tbuf.3887+98492(%rip), %xmm1, %xmm1
	vmovss	%xmm2, tbuf.3887+292252(%rip)
	vaddss	tbuf.3887+292120(%rip), %xmm8, %xmm8
	vmovaps	%ymm4, tbuf.3887+292256(%rip)
	vmovss	%xmm5, tbuf.3887+292356(%rip)
	vmovss	%xmm7, tbuf.3887+292244(%rip)
	vmovups	tbuf.3887+98428(%rip), %xmm4
	vmovups	tbuf.3887+98460(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+98444(%rip), %ymm4, %ymm4
	vmovss	%xmm1, tbuf.3887+292352(%rip)
	vaddss	%xmm1, %xmm0, %xmm1
	vinsertf128	$0x1, tbuf.3887+98476(%rip), %ymm2, %ymm2
	vmovss	%xmm8, tbuf.3887+292360(%rip)
	vmulps	%ymm10, %ymm4, %ymm4
	vmulps	%ymm10, %ymm2, %ymm2
	vmovaps	%ymm4, tbuf.3887+292288(%rip)
	vmovaps	%ymm2, tbuf.3887+292320(%rip)
	vaddss	tbuf.3887+292124(%rip), %xmm7, %xmm7
	vmovups	tbuf.3887+292248(%rip), %xmm2
	vaddss	tbuf.3887+292344(%rip), %xmm6, %xmm6
	vinsertf128	$0x1, tbuf.3887+292264(%rip), %ymm2, %ymm2
	vmovss	%xmm1, tbuf.3887+292472(%rip)
	vmovss	tbuf.3887+290192(%rip), %xmm0
	vmovss	%xmm7, tbuf.3887+292364(%rip)
	vmovss	%xmm6, tbuf.3887+292464(%rip)
	vaddps	tbuf.3887+292128(%rip), %ymm2, %ymm2
	vmovaps	%xmm2, tbuf.3887+292368(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+292384(%rip)
	vmovups	tbuf.3887+292280(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+292296(%rip), %ymm2, %ymm2
	vaddps	tbuf.3887+292160(%rip), %ymm2, %ymm2
	vmovaps	%xmm2, tbuf.3887+292400(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+292416(%rip)
	vmovups	tbuf.3887+292312(%rip), %xmm2
	vinsertf128	$0x1, tbuf.3887+292328(%rip), %ymm2, %ymm2
	vaddps	tbuf.3887+292192(%rip), %ymm2, %ymm2
	vmovaps	%xmm2, tbuf.3887+292432(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+292448(%rip)
	vaddss	tbuf.3887+292348(%rip), %xmm3, %xmm2
	vbroadcastss	%xmm0, %ymm3
	vmulps	tbuf.3887+98496(%rip), %ymm3, %ymm4
	vmovss	%xmm2, tbuf.3887+292468(%rip)
	vmovups	%xmm4, tbuf.3887+292476(%rip)
	vextractf128	$0x1, %ymm4, tbuf.3887+292492(%rip)
	vmulps	tbuf.3887+98528(%rip), %ymm3, %ymm4
	vmulps	tbuf.3887+98560(%rip), %ymm3, %ymm3
	vmovups	%xmm4, tbuf.3887+292508(%rip)
	vextractf128	$0x1, %ymm4, tbuf.3887+292524(%rip)
	vmovups	%xmm3, tbuf.3887+292540(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+292556(%rip)
	vmulss	tbuf.3887+98592(%rip), %xmm0, %xmm3
	vaddss	tbuf.3887+292476(%rip), %xmm5, %xmm5
	vmulss	tbuf.3887+98596(%rip), %xmm0, %xmm8
	vmulss	tbuf.3887+98600(%rip), %xmm0, %xmm7
	vmulss	tbuf.3887+98604(%rip), %xmm0, %xmm4
	vmulss	tbuf.3887+98608(%rip), %xmm0, %xmm9
	vmulss	tbuf.3887+98612(%rip), %xmm0, %xmm0
	vmovss	%xmm3, tbuf.3887+292572(%rip)
	vmovups	tbuf.3887+292360(%rip), %xmm3
	vinsertf128	$0x1, tbuf.3887+292376(%rip), %ymm3, %ymm3
	vmovss	%xmm8, tbuf.3887+292576(%rip)
	vmovss	%xmm7, tbuf.3887+292580(%rip)
	vaddss	tbuf.3887+292456(%rip), %xmm8, %xmm8
	vaddss	tbuf.3887+292460(%rip), %xmm7, %xmm7
	vmovss	%xmm0, tbuf.3887+292592(%rip)
	vaddss	%xmm6, %xmm4, %xmm6
	vmovss	%xmm4, tbuf.3887+292584(%rip)
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm9, tbuf.3887+292588(%rip)
	vaddss	%xmm9, %xmm2, %xmm2
	vmovss	%xmm5, tbuf.3887+292596(%rip)
	vmovss	%xmm8, tbuf.3887+292696(%rip)
	vaddps	tbuf.3887+292480(%rip), %ymm3, %ymm3
	vmovups	%xmm3, tbuf.3887+292600(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+292616(%rip)
	vmovups	tbuf.3887+292392(%rip), %xmm3
	vinsertf128	$0x1, tbuf.3887+292408(%rip), %ymm3, %ymm3
	vaddps	tbuf.3887+292512(%rip), %ymm3, %ymm3
	vmovups	%xmm3, tbuf.3887+292632(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+292648(%rip)
	vmovups	tbuf.3887+292424(%rip), %xmm3
	vinsertf128	$0x1, tbuf.3887+292440(%rip), %ymm3, %ymm3
	vaddps	tbuf.3887+292544(%rip), %ymm3, %ymm3
	vmovups	%xmm3, tbuf.3887+292664(%rip)
	vextractf128	$0x1, %ymm3, tbuf.3887+292680(%rip)
	vmovss	%xmm7, tbuf.3887+292700(%rip)
	vmovss	%xmm6, tbuf.3887+292704(%rip)
	vmovss	%xmm2, tbuf.3887+292708(%rip)
	vmovss	%xmm0, tbuf.3887+292712(%rip)
	vmovss	296012(%rbx), %xmm0
	vsubss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+292716(%rip)
	vmovss	%xmm1, tbuf.3887+292720(%rip)
	vsubss	tbuf.3887+287392(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+292724(%rip)
	vsubss	tbuf.3887+287396(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+292728(%rip)
	vmovaps	%xmm0, %xmm1
.L55:
	vsubss	(%r9), %xmm0, %xmm0
	addq	$4, %r9
	vmovss	%xmm0, 5328(%r9)
	cmpq	%r9, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L55
	vmovss	tbuf.3887+287388(%rip), %xmm5
	movl	$tbuf.3887+287392, %r9d
	vmulss	tbuf.3887+292720(%rip), %xmm5, %xmm0
	vmovss	tbuf.3887+287488(%rip), %xmm4
	vmovss	tbuf.3887+287492(%rip), %xmm3
	vmulss	tbuf.3887+292820(%rip), %xmm4, %xmm4
	vmovss	tbuf.3887+287496(%rip), %xmm2
	vmulss	tbuf.3887+292824(%rip), %xmm3, %xmm3
	vmovss	tbuf.3887+287500(%rip), %xmm1
	vmulss	tbuf.3887+292828(%rip), %xmm2, %xmm2
	vmulss	tbuf.3887+292832(%rip), %xmm1, %xmm1
	movq	%r9, %r10
	vmovss	%xmm0, tbuf.3887+292840(%rip)
	vmovups	tbuf.3887+292724(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+292740(%rip), %ymm0, %ymm0
	vmovss	%xmm4, tbuf.3887+292940(%rip)
	vmovss	%xmm3, tbuf.3887+292944(%rip)
	vmovss	%xmm2, tbuf.3887+292948(%rip)
	vmovss	%xmm1, tbuf.3887+292952(%rip)
	vmulps	tbuf.3887+287392(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+292844(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+292860(%rip)
	vmovups	tbuf.3887+292756(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+292772(%rip), %ymm0, %ymm0
	vmulps	tbuf.3887+287424(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+292876(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+292892(%rip)
	vmovups	tbuf.3887+292788(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+292804(%rip), %ymm0, %ymm0
	vmulps	tbuf.3887+287456(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+292908(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+292924(%rip)
	vmovss	tbuf.3887+287504(%rip), %xmm0
	vmulss	tbuf.3887+292836(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+292956(%rip)
	vmulss	tbuf.3887+292712(%rip), %xmm0, %xmm0
	vmovups	tbuf.3887+292596(%rip), %xmm6
	vmulss	tbuf.3887+292708(%rip), %xmm1, %xmm1
	vmovups	tbuf.3887+292840(%rip), %xmm7
	vinsertf128	$0x1, tbuf.3887+292612(%rip), %ymm6, %ymm6
	vinsertf128	$0x1, tbuf.3887+292856(%rip), %ymm7, %ymm7
	vmovss	%xmm0, tbuf.3887+293076(%rip)
	vmovss	tbuf.3887+290156(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmovss	%xmm1, tbuf.3887+293072(%rip)
	vmulss	tbuf.3887+292696(%rip), %xmm4, %xmm4
	vmulss	tbuf.3887+292700(%rip), %xmm3, %xmm3
	vmulps	%ymm7, %ymm6, %ymm6
	vmovups	tbuf.3887+292872(%rip), %xmm7
	vinsertf128	$0x1, tbuf.3887+292888(%rip), %ymm7, %ymm7
	vmovss	%xmm0, tbuf.3887+293080(%rip)
	vmovaps	%xmm0, %xmm1
	vmulss	tbuf.3887+292704(%rip), %xmm2, %xmm2
	vmovss	%xmm4, tbuf.3887+293060(%rip)
	vmovaps	%ymm6, tbuf.3887+292960(%rip)
	vmulss	%xmm5, %xmm0, %xmm5
	vmovss	%xmm3, tbuf.3887+293064(%rip)
	vmovups	tbuf.3887+292628(%rip), %xmm6
	vinsertf128	$0x1, tbuf.3887+292644(%rip), %ymm6, %ymm6
	vmovss	%xmm2, tbuf.3887+293068(%rip)
	vmovss	%xmm5, tbuf.3887+293084(%rip)
	vmulps	%ymm7, %ymm6, %ymm6
	vmovups	tbuf.3887+292904(%rip), %xmm7
	vinsertf128	$0x1, tbuf.3887+292920(%rip), %ymm7, %ymm7
	vmovaps	%ymm6, tbuf.3887+292992(%rip)
	vmovups	tbuf.3887+292660(%rip), %xmm6
	vinsertf128	$0x1, tbuf.3887+292676(%rip), %ymm6, %ymm6
	vmulps	%ymm7, %ymm6, %ymm6
	vmovaps	%ymm6, tbuf.3887+293024(%rip)
	vmovss	tbuf.3887+292692(%rip), %xmm6
	vmulss	tbuf.3887+292936(%rip), %xmm6, %xmm6
	vmovss	%xmm6, tbuf.3887+293056(%rip)
	.p2align 4,,10
	.p2align 3
.L56:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 5692(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L56
	vmovss	tbuf.3887+97416(%rip), %xmm0
	movl	$tbuf.3887+287392, %r10d
	vsubss	tbuf.3887+293084(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293204(%rip)
	vmovups	tbuf.3887+97420(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97436(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+293088(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+293208(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+293224(%rip)
	vmovups	tbuf.3887+97452(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97468(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+293120(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+293240(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+293256(%rip)
	vmovups	tbuf.3887+97484(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97500(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+293152(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+293272(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+293288(%rip)
	vmovss	tbuf.3887+97516(%rip), %xmm0
	vsubss	tbuf.3887+293184(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293304(%rip)
	vmovss	tbuf.3887+97520(%rip), %xmm0
	vsubss	tbuf.3887+293188(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293308(%rip)
	vmovss	tbuf.3887+97524(%rip), %xmm0
	vsubss	tbuf.3887+293192(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293312(%rip)
	vmovss	tbuf.3887+97528(%rip), %xmm0
	vsubss	tbuf.3887+293196(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293316(%rip)
	vmovss	tbuf.3887+97532(%rip), %xmm0
	vsubss	tbuf.3887+293200(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293320(%rip)
	vmovss	tbuf.3887+290160(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+293324(%rip)
	vmovss	%xmm1, tbuf.3887+293328(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L57:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 5936(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L57
	vmovaps	tbuf.3887+293328(%rip), %xmm0
	movl	$tbuf.3887+287392, %r10d
	vinsertf128	$0x1, tbuf.3887+293344(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+97536(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+293448(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+293464(%rip)
	vmovaps	tbuf.3887+293360(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+293376(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+97568(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+293480(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+293496(%rip)
	vmovaps	tbuf.3887+293392(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+293408(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+97600(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+293512(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+293528(%rip)
	vmovss	tbuf.3887+97632(%rip), %xmm0
	vsubss	tbuf.3887+293424(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293544(%rip)
	vmovss	tbuf.3887+97636(%rip), %xmm0
	vsubss	tbuf.3887+293428(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293548(%rip)
	vmovss	tbuf.3887+97640(%rip), %xmm0
	vsubss	tbuf.3887+293432(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293552(%rip)
	vmovss	tbuf.3887+97644(%rip), %xmm0
	vsubss	tbuf.3887+293436(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293556(%rip)
	vmovss	tbuf.3887+97648(%rip), %xmm0
	vsubss	tbuf.3887+293440(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293560(%rip)
	vmovss	tbuf.3887+97652(%rip), %xmm0
	vsubss	tbuf.3887+293444(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293564(%rip)
	vmovss	tbuf.3887+290164(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+293568(%rip)
	vmovss	%xmm1, tbuf.3887+293572(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L58:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 6180(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L58
	vmovss	tbuf.3887+97656(%rip), %xmm0
	movl	$tbuf.3887+287392, %r10d
	vsubss	tbuf.3887+293572(%rip), %xmm0, %xmm0
	vmovups	tbuf.3887+293576(%rip), %xmm1
	vinsertf128	$0x1, tbuf.3887+293592(%rip), %ymm1, %ymm1
	vmovss	%xmm0, tbuf.3887+293692(%rip)
	vmovups	tbuf.3887+97660(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97676(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	tbuf.3887+293608(%rip), %xmm1
	vinsertf128	$0x1, tbuf.3887+293624(%rip), %ymm1, %ymm1
	vmovaps	%ymm0, tbuf.3887+293696(%rip)
	vmovups	tbuf.3887+97692(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97708(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	tbuf.3887+293640(%rip), %xmm1
	vinsertf128	$0x1, tbuf.3887+293656(%rip), %ymm1, %ymm1
	vmovaps	%ymm0, tbuf.3887+293728(%rip)
	vmovups	tbuf.3887+97724(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97740(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+293760(%rip)
	vmovss	tbuf.3887+97756(%rip), %xmm0
	vsubss	tbuf.3887+293672(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293792(%rip)
	vmovss	tbuf.3887+97760(%rip), %xmm0
	vsubss	tbuf.3887+293676(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293796(%rip)
	vmovss	tbuf.3887+97764(%rip), %xmm0
	vsubss	tbuf.3887+293680(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293800(%rip)
	vmovss	tbuf.3887+97768(%rip), %xmm0
	vsubss	tbuf.3887+293684(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293804(%rip)
	vmovss	tbuf.3887+97772(%rip), %xmm0
	vsubss	tbuf.3887+293688(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293808(%rip)
	vmovss	tbuf.3887+290168(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+293812(%rip)
	vmovss	%xmm1, tbuf.3887+293816(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L59:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 6424(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L59
	vmovss	tbuf.3887+97776(%rip), %xmm0
	movl	$tbuf.3887+287392, %r10d
	vsubss	tbuf.3887+293816(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293936(%rip)
	vmovss	tbuf.3887+97780(%rip), %xmm0
	vsubss	tbuf.3887+293820(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293940(%rip)
	vmovss	tbuf.3887+97784(%rip), %xmm0
	vsubss	tbuf.3887+293824(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293944(%rip)
	vmovss	tbuf.3887+97788(%rip), %xmm0
	vsubss	tbuf.3887+293828(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+293948(%rip)
	vmovups	tbuf.3887+293832(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+293848(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+97792(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+293952(%rip)
	vmovups	tbuf.3887+293864(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+293880(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+97824(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+293984(%rip)
	vmovups	tbuf.3887+293896(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+293912(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+97856(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+294016(%rip)
	vmovss	tbuf.3887+97888(%rip), %xmm0
	vsubss	tbuf.3887+293928(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294048(%rip)
	vmovss	tbuf.3887+97892(%rip), %xmm0
	vsubss	tbuf.3887+293932(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294052(%rip)
	vmovss	tbuf.3887+290172(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294056(%rip)
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+294060(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L60:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 6668(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L60
	vmovss	tbuf.3887+97896(%rip), %xmm0
	movl	$tbuf.3887+287392, %r10d
	vsubss	tbuf.3887+294060(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294180(%rip)
	vmovss	tbuf.3887+97900(%rip), %xmm0
	vsubss	tbuf.3887+294064(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294184(%rip)
	vmovss	tbuf.3887+97904(%rip), %xmm0
	vsubss	tbuf.3887+294068(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294188(%rip)
	vmovss	tbuf.3887+97908(%rip), %xmm0
	vsubss	tbuf.3887+294072(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294192(%rip)
	vmovss	tbuf.3887+97912(%rip), %xmm0
	vsubss	tbuf.3887+294076(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294196(%rip)
	vmovups	tbuf.3887+97916(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97932(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+294080(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294200(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294216(%rip)
	vmovups	tbuf.3887+97948(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97964(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+294112(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294232(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294248(%rip)
	vmovups	tbuf.3887+97980(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+97996(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+294144(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294264(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294280(%rip)
	vmovss	tbuf.3887+98012(%rip), %xmm0
	vsubss	tbuf.3887+294176(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294296(%rip)
	vmovss	tbuf.3887+290176(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+294300(%rip)
	vmovss	%xmm1, tbuf.3887+294304(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L61:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 6912(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L61
	vmovaps	tbuf.3887+98016(%rip), %ymm0
	movl	$tbuf.3887+287392, %r10d
	vsubps	tbuf.3887+294304(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294424(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294440(%rip)
	vmovaps	tbuf.3887+98048(%rip), %ymm0
	vsubps	tbuf.3887+294336(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294456(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294472(%rip)
	vmovaps	tbuf.3887+98080(%rip), %ymm0
	vsubps	tbuf.3887+294368(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294488(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294504(%rip)
	vmovss	tbuf.3887+98112(%rip), %xmm0
	vsubss	tbuf.3887+294400(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294520(%rip)
	vmovss	tbuf.3887+98116(%rip), %xmm0
	vsubss	tbuf.3887+294404(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294524(%rip)
	vmovss	tbuf.3887+98120(%rip), %xmm0
	vsubss	tbuf.3887+294408(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294528(%rip)
	vmovss	tbuf.3887+98124(%rip), %xmm0
	vsubss	tbuf.3887+294412(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294532(%rip)
	vmovss	tbuf.3887+98128(%rip), %xmm0
	vsubss	tbuf.3887+294416(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294536(%rip)
	vmovss	tbuf.3887+98132(%rip), %xmm0
	vsubss	tbuf.3887+294420(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294540(%rip)
	vmovss	tbuf.3887+290180(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294544(%rip)
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+294548(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L62:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 7156(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L62
	vmovss	tbuf.3887+98136(%rip), %xmm0
	movl	$tbuf.3887+287392, %r10d
	vsubss	tbuf.3887+294548(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294668(%rip)
	vmovss	tbuf.3887+98140(%rip), %xmm0
	vsubss	tbuf.3887+294552(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294672(%rip)
	vmovups	tbuf.3887+294556(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+294572(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+98144(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294676(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294692(%rip)
	vmovups	tbuf.3887+294588(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+294604(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+98176(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294708(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294724(%rip)
	vmovups	tbuf.3887+294620(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+294636(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+98208(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+294740(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+294756(%rip)
	vmovss	tbuf.3887+98240(%rip), %xmm0
	vsubss	tbuf.3887+294652(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294772(%rip)
	vmovss	tbuf.3887+98244(%rip), %xmm0
	vsubss	tbuf.3887+294656(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294776(%rip)
	vmovss	tbuf.3887+98248(%rip), %xmm0
	vsubss	tbuf.3887+294660(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294780(%rip)
	vmovss	tbuf.3887+98252(%rip), %xmm0
	vsubss	tbuf.3887+294664(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+294784(%rip)
	vmovss	tbuf.3887+290184(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+294788(%rip)
	vmovss	%xmm1, tbuf.3887+294792(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L63:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 7400(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L63
	vmovaps	tbuf.3887+98256(%rip), %xmm0
	movl	$tbuf.3887+287392, %r10d
	vmovups	tbuf.3887+294792(%rip), %xmm1
	vinsertf128	$0x1, tbuf.3887+98272(%rip), %ymm0, %ymm0
	vinsertf128	$0x1, tbuf.3887+294808(%rip), %ymm1, %ymm1
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	tbuf.3887+294824(%rip), %xmm1
	vinsertf128	$0x1, tbuf.3887+294840(%rip), %ymm1, %ymm1
	vmovaps	%ymm0, tbuf.3887+294912(%rip)
	vmovaps	tbuf.3887+98288(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+98304(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	tbuf.3887+294856(%rip), %xmm1
	vinsertf128	$0x1, tbuf.3887+294872(%rip), %ymm1, %ymm1
	vmovaps	%ymm0, tbuf.3887+294944(%rip)
	vmovaps	tbuf.3887+98320(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+98336(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.3887+294976(%rip)
	vmovss	tbuf.3887+98352(%rip), %xmm0
	vsubss	tbuf.3887+294888(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295008(%rip)
	vmovss	tbuf.3887+98356(%rip), %xmm0
	vsubss	tbuf.3887+294892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295012(%rip)
	vmovss	tbuf.3887+98360(%rip), %xmm0
	vsubss	tbuf.3887+294896(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295016(%rip)
	vmovss	tbuf.3887+98364(%rip), %xmm0
	vsubss	tbuf.3887+294900(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295020(%rip)
	vmovss	tbuf.3887+98368(%rip), %xmm0
	vsubss	tbuf.3887+294904(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295024(%rip)
	vmovss	tbuf.3887+98372(%rip), %xmm0
	vsubss	tbuf.3887+294908(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295028(%rip)
	vmovss	tbuf.3887+290188(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+295032(%rip)
	vmovss	%xmm1, tbuf.3887+295036(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L64:
	vmulss	(%r10), %xmm0, %xmm0
	addq	$4, %r10
	vmovss	%xmm0, 7644(%r10)
	cmpq	%r10, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L64
	vmovss	tbuf.3887+98376(%rip), %xmm0
	vsubss	tbuf.3887+295036(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295156(%rip)
	vmovups	tbuf.3887+98380(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+98396(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+295040(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+295160(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+295176(%rip)
	vmovups	tbuf.3887+98412(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+98428(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+295072(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+295192(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+295208(%rip)
	vmovups	tbuf.3887+98444(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+98460(%rip), %ymm0, %ymm0
	vsubps	tbuf.3887+295104(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+295224(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+295240(%rip)
	vmovss	tbuf.3887+98476(%rip), %xmm0
	vsubss	tbuf.3887+295136(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295256(%rip)
	vmovss	tbuf.3887+98480(%rip), %xmm0
	vsubss	tbuf.3887+295140(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295260(%rip)
	vmovss	tbuf.3887+98484(%rip), %xmm0
	vsubss	tbuf.3887+295144(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295264(%rip)
	vmovss	tbuf.3887+98488(%rip), %xmm0
	vsubss	tbuf.3887+295148(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295268(%rip)
	vmovss	tbuf.3887+98492(%rip), %xmm0
	vsubss	tbuf.3887+295152(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295272(%rip)
	vmovss	tbuf.3887+290192(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+295276(%rip)
	vmovss	%xmm1, tbuf.3887+295280(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L65:
	vmulss	(%r9), %xmm0, %xmm0
	addq	$4, %r9
	vmovss	%xmm0, 7888(%r9)
	cmpq	$tbuf.3887+287508, %r9
	vmovaps	%xmm1, %xmm0
	jne	.L65
	vmovaps	tbuf.3887+295280(%rip), %xmm0
	movl	$tbuf.3887+4, %eax
	movl	$tbuf.3887+3136, %r10d
	movq	%rax, %r9
	vinsertf128	$0x1, tbuf.3887+295296(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+98496(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+295400(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+295416(%rip)
	vmovaps	tbuf.3887+295312(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+295328(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+98528(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+295432(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+295448(%rip)
	vmovaps	tbuf.3887+295344(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+295360(%rip), %ymm0, %ymm1
	vmovaps	tbuf.3887+98560(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+295464(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+295480(%rip)
	vmovss	tbuf.3887+98592(%rip), %xmm0
	vsubss	tbuf.3887+295376(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295496(%rip)
	vmovss	tbuf.3887+98596(%rip), %xmm0
	vsubss	tbuf.3887+295380(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295500(%rip)
	vmovss	tbuf.3887+98600(%rip), %xmm0
	vsubss	tbuf.3887+295384(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295504(%rip)
	vmovss	tbuf.3887+98604(%rip), %xmm0
	vsubss	tbuf.3887+295388(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295508(%rip)
	vmovss	tbuf.3887+98608(%rip), %xmm0
	vsubss	tbuf.3887+295392(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295512(%rip)
	vmovss	tbuf.3887+98612(%rip), %xmm0
	vsubss	tbuf.3887+295396(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+295516(%rip)
	vmovups	tbuf.3887+290156(%rip), %xmm1
	vinsertf128	$0x1, tbuf.3887+290172(%rip), %ymm1, %ymm1
	vmovss	tbuf.3887+98616(%rip), %xmm0
	vbroadcastss	%xmm0, %ymm2
	vmulss	tbuf.3887+290192(%rip), %xmm0, %xmm3
	vmulss	tbuf.3887+290188(%rip), %xmm0, %xmm4
	vmulss	tbuf.3887+292960(%rip), %xmm0, %xmm0
	vmulps	%ymm2, %ymm1, %ymm1
	vmovaps	tbuf.3887+3296(%rip), %ymm2
	vmovss	%xmm3, tbuf.3887+295556(%rip)
	vmovss	%xmm4, tbuf.3887+295552(%rip)
	vmovaps	%ymm1, tbuf.3887+295520(%rip)
	vsubps	%ymm1, %ymm2, %ymm1
	vmovss	tbuf.3887+3328(%rip), %xmm2
	vsubss	%xmm4, %xmm2, %xmm2
	vmovss	%xmm0, tbuf.3887+295600(%rip)
	vmovups	%xmm1, tbuf.3887+295560(%rip)
	vextractf128	$0x1, %ymm1, tbuf.3887+295576(%rip)
	vmovss	%xmm2, tbuf.3887+295592(%rip)
	vmovss	tbuf.3887+3332(%rip), %xmm1
	vsubss	%xmm3, %xmm1, %xmm1
	vmovss	%xmm1, tbuf.3887+295596(%rip)
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+295604(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L66:
	vmulss	(%r9), %xmm0, %xmm0
	addq	$4, %r9
	vmovss	%xmm0, 295600(%r9)
	cmpq	%r9, %r10
	vmovaps	%xmm1, %xmm0
	jne	.L66
	vmovss	tbuf.3887+3336(%rip), %xmm0
	movl	$tbuf.3887+3348, %r9d
	vsubss	tbuf.3887+295604(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+6452, %r10d
	vmovss	%xmm0, tbuf.3887+298740(%rip)
	vmovss	tbuf.3887+3340(%rip), %xmm0
	vsubss	tbuf.3887+295608(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+298744(%rip)
	vmovss	tbuf.3887+3344(%rip), %xmm0
	vsubss	tbuf.3887+295612(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+298748(%rip)
	.p2align 4,,10
	.p2align 3
.L67:
	vmovups	(%r9), %xmm0
	addq	$32, %r9
	vinsertf128	$0x1, -16(%r9), %ymm0, %ymm0
	vsubps	292236(%r9), %ymm0, %ymm0
	vmovaps	%ymm0, 295372(%r9)
	cmpq	%r9, %r10
	jne	.L67
	vmovss	tbuf.3887+6452(%rip), %xmm0
	movl	$tbuf.3887+4, %r9d
	vsubss	tbuf.3887+298720(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+301856(%rip)
	vmovss	tbuf.3887+6456(%rip), %xmm0
	vsubss	tbuf.3887+298724(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+301860(%rip)
	vmovss	tbuf.3887+6460(%rip), %xmm0
	vsubss	tbuf.3887+298728(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+301864(%rip)
	vmovss	tbuf.3887+6464(%rip), %xmm0
	vsubss	tbuf.3887+298732(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+301868(%rip)
	vmovss	tbuf.3887+6468(%rip), %xmm0
	vsubss	tbuf.3887+298736(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+301872(%rip)
	vmovss	tbuf.3887+292964(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+301876(%rip)
	vmovss	%xmm1, tbuf.3887+301880(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L68:
	vmulss	(%r9), %xmm0, %xmm0
	addq	$4, %r9
	vmovss	%xmm0, 301876(%r9)
	cmpq	$tbuf.3887+3136, %r9
	vmovaps	%xmm1, %xmm0
	jne	.L68
	vmovss	tbuf.3887+6472(%rip), %xmm0
	movl	$tbuf.3887+9584, %r9d
	vsubss	tbuf.3887+301880(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+305016(%rip)
	vmovss	tbuf.3887+6476(%rip), %xmm0
	vsubss	tbuf.3887+301884(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+305020(%rip)
	.p2align 4,,10
	.p2align 3
.L69:
	vmovaps	(%r8), %xmm0
	addq	$32, %r8
	vinsertf128	$0x1, -16(%r8), %ymm0, %ymm0
	vsubps	295376(%r8), %ymm0, %ymm0
	vmovaps	%ymm0, 298512(%r8)
	cmpq	%r8, %r9
	jne	.L69
	vmovss	tbuf.3887+9584(%rip), %xmm0
	movl	$tbuf.3887+4, %r8d
	vsubss	tbuf.3887+304992(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+308128(%rip)
	vmovss	tbuf.3887+9588(%rip), %xmm0
	vsubss	tbuf.3887+304996(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+308132(%rip)
	vmovss	tbuf.3887+9592(%rip), %xmm0
	vsubss	tbuf.3887+305000(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+308136(%rip)
	vmovss	tbuf.3887+9596(%rip), %xmm0
	vsubss	tbuf.3887+305004(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+308140(%rip)
	vmovss	tbuf.3887+9600(%rip), %xmm0
	vsubss	tbuf.3887+305008(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+308144(%rip)
	vmovss	tbuf.3887+9604(%rip), %xmm0
	vsubss	tbuf.3887+305012(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+308148(%rip)
	vmovss	tbuf.3887+292968(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+308152(%rip)
	vmovss	%xmm1, tbuf.3887+308156(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L70:
	vmulss	(%r8), %xmm0, %xmm0
	addq	$4, %r8
	vmovss	%xmm0, 308152(%r8)
	cmpq	$tbuf.3887+3136, %r8
	vmovaps	%xmm1, %xmm0
	jne	.L70
	vmovss	tbuf.3887+9608(%rip), %xmm0
	movl	$tbuf.3887+12716, %r8d
	vsubss	tbuf.3887+308156(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+311292(%rip)
	.p2align 4,,10
	.p2align 3
.L71:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	298516(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 301652(%rdi)
	cmpq	%rdi, %r8
	jne	.L71
	vmovss	tbuf.3887+12716(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vsubss	tbuf.3887+311264(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+314400(%rip)
	vmovss	tbuf.3887+12720(%rip), %xmm0
	vsubss	tbuf.3887+311268(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+314404(%rip)
	vmovss	tbuf.3887+12724(%rip), %xmm0
	vsubss	tbuf.3887+311272(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+314408(%rip)
	vmovss	tbuf.3887+12728(%rip), %xmm0
	vsubss	tbuf.3887+311276(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+314412(%rip)
	vmovss	tbuf.3887+12732(%rip), %xmm0
	vsubss	tbuf.3887+311280(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+314416(%rip)
	vmovss	tbuf.3887+12736(%rip), %xmm0
	vsubss	tbuf.3887+311284(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+314420(%rip)
	vmovss	tbuf.3887+12740(%rip), %xmm0
	vsubss	tbuf.3887+311288(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+314424(%rip)
	vmovss	tbuf.3887+292972(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+314428(%rip)
	vmovss	%xmm1, tbuf.3887+314432(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L72:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 314428(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L72
	movl	$tbuf.3887+12744, %edi
	movl	$tbuf.3887+15880, %r8d
	.p2align 4,,10
	.p2align 3
.L73:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	301656(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 304792(%rdi)
	cmpq	%rdi, %r8
	jne	.L73
	vmovss	tbuf.3887+292976(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+320704(%rip)
	vmovss	%xmm1, tbuf.3887+320708(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L74:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 320704(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L74
	vmovss	tbuf.3887+15880(%rip), %xmm0
	movl	$tbuf.3887+15908, %edi
	vsubss	tbuf.3887+320708(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+19012, %r8d
	vmovss	%xmm0, tbuf.3887+323844(%rip)
	vmovss	tbuf.3887+15884(%rip), %xmm0
	vsubss	tbuf.3887+320712(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+323848(%rip)
	vmovss	tbuf.3887+15888(%rip), %xmm0
	vsubss	tbuf.3887+320716(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+323852(%rip)
	vmovss	tbuf.3887+15892(%rip), %xmm0
	vsubss	tbuf.3887+320720(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+323856(%rip)
	vmovss	tbuf.3887+15896(%rip), %xmm0
	vsubss	tbuf.3887+320724(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+323860(%rip)
	vmovss	tbuf.3887+15900(%rip), %xmm0
	vsubss	tbuf.3887+320728(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+323864(%rip)
	vmovss	tbuf.3887+15904(%rip), %xmm0
	vsubss	tbuf.3887+320732(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+323868(%rip)
	.p2align 4,,10
	.p2align 3
.L75:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	304796(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 307932(%rdi)
	cmpq	%rdi, %r8
	jne	.L75
	vmovss	tbuf.3887+19012(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vsubss	tbuf.3887+323840(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+326976(%rip)
	vmovss	tbuf.3887+292980(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+326980(%rip)
	vmovss	%xmm1, tbuf.3887+326984(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L76:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 326980(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L76
	vmovss	tbuf.3887+19016(%rip), %xmm0
	movl	$tbuf.3887+19040, %edi
	vsubss	tbuf.3887+326984(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+330120(%rip)
	vmovss	tbuf.3887+19020(%rip), %xmm0
	vsubss	tbuf.3887+326988(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+330124(%rip)
	vmovss	tbuf.3887+19024(%rip), %xmm0
	vsubss	tbuf.3887+326992(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+330128(%rip)
	vmovss	tbuf.3887+19028(%rip), %xmm0
	vsubss	tbuf.3887+326996(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+330132(%rip)
	vmovss	tbuf.3887+19032(%rip), %xmm0
	vsubss	tbuf.3887+327000(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+330136(%rip)
	vmovss	tbuf.3887+19036(%rip), %xmm0
	vsubss	tbuf.3887+327004(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+330140(%rip)
	.p2align 4,,10
	.p2align 3
.L77:
	vmovaps	(%rdi), %ymm0
	addq	$32, %rdi
	vsubps	307936(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 311072(%rdi)
	cmpq	$tbuf.3887+22144, %rdi
	jne	.L77
	vmovss	tbuf.3887+22144(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vsubss	tbuf.3887+330112(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+333248(%rip)
	vmovss	tbuf.3887+22148(%rip), %xmm0
	vsubss	tbuf.3887+330116(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+333252(%rip)
	vmovss	tbuf.3887+292984(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+333256(%rip)
	vmovss	%xmm1, tbuf.3887+333260(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L78:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 333256(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L78
	vmovss	tbuf.3887+22152(%rip), %xmm0
	movl	$tbuf.3887+22172, %edi
	vsubss	tbuf.3887+333260(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+336396(%rip)
	vmovss	tbuf.3887+22156(%rip), %xmm0
	vsubss	tbuf.3887+333264(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+336400(%rip)
	vmovss	tbuf.3887+22160(%rip), %xmm0
	vsubss	tbuf.3887+333268(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+336404(%rip)
	vmovss	tbuf.3887+22164(%rip), %xmm0
	vsubss	tbuf.3887+333272(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+336408(%rip)
	vmovss	tbuf.3887+22168(%rip), %xmm0
	vsubss	tbuf.3887+333276(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+336412(%rip)
	.p2align 4,,10
	.p2align 3
.L79:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	311076(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 314212(%rdi)
	cmpq	$tbuf.3887+25276, %rdi
	jne	.L79
	vmovss	tbuf.3887+25276(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vsubss	tbuf.3887+336384(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+339520(%rip)
	vmovss	tbuf.3887+25280(%rip), %xmm0
	vsubss	tbuf.3887+336388(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+339524(%rip)
	vmovss	tbuf.3887+25284(%rip), %xmm0
	vsubss	tbuf.3887+336392(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+339528(%rip)
	vmovss	tbuf.3887+292988(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+339532(%rip)
	vmovss	%xmm1, tbuf.3887+339536(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L80:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 339532(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L80
	vmovss	tbuf.3887+25288(%rip), %xmm0
	movl	$tbuf.3887+25304, %edi
	vsubss	tbuf.3887+339536(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+342672(%rip)
	vmovss	tbuf.3887+25292(%rip), %xmm0
	vsubss	tbuf.3887+339540(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+342676(%rip)
	vmovss	tbuf.3887+25296(%rip), %xmm0
	vsubss	tbuf.3887+339544(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+342680(%rip)
	vmovss	tbuf.3887+25300(%rip), %xmm0
	vsubss	tbuf.3887+339548(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+342684(%rip)
	.p2align 4,,10
	.p2align 3
.L81:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	314216(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 317352(%rdi)
	cmpq	$tbuf.3887+28408, %rdi
	jne	.L81
	vmovss	tbuf.3887+28408(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vsubss	tbuf.3887+342656(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+345792(%rip)
	vmovss	tbuf.3887+28412(%rip), %xmm0
	vsubss	tbuf.3887+342660(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+345796(%rip)
	vmovss	tbuf.3887+28416(%rip), %xmm0
	vsubss	tbuf.3887+342664(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+345800(%rip)
	vmovss	tbuf.3887+28420(%rip), %xmm0
	vsubss	tbuf.3887+342668(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+345804(%rip)
	vmovss	tbuf.3887+292992(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+345808(%rip)
	vmovss	%xmm1, tbuf.3887+345812(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L82:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 345808(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L82
	vmovss	tbuf.3887+28424(%rip), %xmm0
	movl	$tbuf.3887+28436, %edi
	vsubss	tbuf.3887+345812(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+348948(%rip)
	vmovss	tbuf.3887+28428(%rip), %xmm0
	vsubss	tbuf.3887+345816(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+348952(%rip)
	vmovss	tbuf.3887+28432(%rip), %xmm0
	vsubss	tbuf.3887+345820(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+348956(%rip)
	.p2align 4,,10
	.p2align 3
.L83:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	317356(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 320492(%rdi)
	cmpq	$tbuf.3887+31540, %rdi
	jne	.L83
	vmovss	tbuf.3887+31540(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vsubss	tbuf.3887+348928(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+352064(%rip)
	vmovss	tbuf.3887+31544(%rip), %xmm0
	vsubss	tbuf.3887+348932(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+352068(%rip)
	vmovss	tbuf.3887+31548(%rip), %xmm0
	vsubss	tbuf.3887+348936(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+352072(%rip)
	vmovss	tbuf.3887+31552(%rip), %xmm0
	vsubss	tbuf.3887+348940(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+352076(%rip)
	vmovss	tbuf.3887+31556(%rip), %xmm0
	vsubss	tbuf.3887+348944(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+352080(%rip)
	vmovss	tbuf.3887+292996(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+352084(%rip)
	vmovss	%xmm1, tbuf.3887+352088(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L84:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 352084(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L84
	vmovss	tbuf.3887+31560(%rip), %xmm0
	movl	$tbuf.3887+31568, %edi
	vsubss	tbuf.3887+352088(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+34672, %r8d
	vmovss	%xmm0, tbuf.3887+355224(%rip)
	vmovss	tbuf.3887+31564(%rip), %xmm0
	vsubss	tbuf.3887+352092(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+355228(%rip)
	.p2align 4,,10
	.p2align 3
.L85:
	vmovaps	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	320496(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 323632(%rdi)
	cmpq	%rdi, %r8
	jne	.L85
	vmovss	tbuf.3887+34672(%rip), %xmm0
	movl	$tbuf.3887+4, %edi
	vsubss	tbuf.3887+355200(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+358336(%rip)
	vmovss	tbuf.3887+34676(%rip), %xmm0
	vsubss	tbuf.3887+355204(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+358340(%rip)
	vmovss	tbuf.3887+34680(%rip), %xmm0
	vsubss	tbuf.3887+355208(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+358344(%rip)
	vmovss	tbuf.3887+34684(%rip), %xmm0
	vsubss	tbuf.3887+355212(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+358348(%rip)
	vmovss	tbuf.3887+34688(%rip), %xmm0
	vsubss	tbuf.3887+355216(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+358352(%rip)
	vmovss	tbuf.3887+34692(%rip), %xmm0
	vsubss	tbuf.3887+355220(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+358356(%rip)
	vmovss	tbuf.3887+293000(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+358360(%rip)
	vmovss	%xmm1, tbuf.3887+358364(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L86:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 358360(%rdi)
	cmpq	$tbuf.3887+3136, %rdi
	vmovaps	%xmm1, %xmm0
	jne	.L86
	vmovss	tbuf.3887+34696(%rip), %xmm0
	vsubss	tbuf.3887+358364(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+361500(%rip)
	.p2align 4,,10
	.p2align 3
.L87:
	vmovups	(%rsi), %xmm0
	addq	$32, %rsi
	vinsertf128	$0x1, -16(%rsi), %ymm0, %ymm0
	vsubps	323636(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 326772(%rsi)
	cmpq	$tbuf.3887+37804, %rsi
	jne	.L87
	vmovss	tbuf.3887+37804(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vsubss	tbuf.3887+361472(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+364608(%rip)
	vmovss	tbuf.3887+37808(%rip), %xmm0
	vsubss	tbuf.3887+361476(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+364612(%rip)
	vmovss	tbuf.3887+37812(%rip), %xmm0
	vsubss	tbuf.3887+361480(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+364616(%rip)
	vmovss	tbuf.3887+37816(%rip), %xmm0
	vsubss	tbuf.3887+361484(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+364620(%rip)
	vmovss	tbuf.3887+37820(%rip), %xmm0
	vsubss	tbuf.3887+361488(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+364624(%rip)
	vmovss	tbuf.3887+37824(%rip), %xmm0
	vsubss	tbuf.3887+361492(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+364628(%rip)
	vmovss	tbuf.3887+37828(%rip), %xmm0
	vsubss	tbuf.3887+361496(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+364632(%rip)
	vmovss	tbuf.3887+293004(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+364636(%rip)
	vmovss	%xmm1, tbuf.3887+364640(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L88:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 364636(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L88
	movl	$tbuf.3887+37832, %esi
	.p2align 4,,10
	.p2align 3
.L89:
	vmovups	(%rsi), %xmm0
	addq	$32, %rsi
	vinsertf128	$0x1, -16(%rsi), %ymm0, %ymm0
	vsubps	326776(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 329912(%rsi)
	cmpq	$tbuf.3887+40968, %rsi
	jne	.L89
	vmovss	tbuf.3887+293008(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+370912(%rip)
	vmovss	%xmm1, tbuf.3887+370916(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L90:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 370912(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L90
	vmovss	tbuf.3887+40968(%rip), %xmm0
	movl	$tbuf.3887+40996, %esi
	vsubss	tbuf.3887+370916(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+374052(%rip)
	vmovss	tbuf.3887+40972(%rip), %xmm0
	vsubss	tbuf.3887+370920(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+374056(%rip)
	vmovss	tbuf.3887+40976(%rip), %xmm0
	vsubss	tbuf.3887+370924(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+374060(%rip)
	vmovss	tbuf.3887+40980(%rip), %xmm0
	vsubss	tbuf.3887+370928(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+374064(%rip)
	vmovss	tbuf.3887+40984(%rip), %xmm0
	vsubss	tbuf.3887+370932(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+374068(%rip)
	vmovss	tbuf.3887+40988(%rip), %xmm0
	vsubss	tbuf.3887+370936(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+374072(%rip)
	vmovss	tbuf.3887+40992(%rip), %xmm0
	vsubss	tbuf.3887+370940(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+374076(%rip)
	.p2align 4,,10
	.p2align 3
.L91:
	vmovups	(%rsi), %xmm0
	addq	$32, %rsi
	vinsertf128	$0x1, -16(%rsi), %ymm0, %ymm0
	vsubps	329916(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 333052(%rsi)
	cmpq	$tbuf.3887+44100, %rsi
	jne	.L91
	vmovss	tbuf.3887+44100(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vsubss	tbuf.3887+374048(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+377184(%rip)
	vmovss	tbuf.3887+293012(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+377188(%rip)
	vmovss	%xmm1, tbuf.3887+377192(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L92:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 377188(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L92
	vmovss	tbuf.3887+44104(%rip), %xmm0
	movl	$tbuf.3887+44128, %esi
	vsubss	tbuf.3887+377192(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+380328(%rip)
	vmovss	tbuf.3887+44108(%rip), %xmm0
	vsubss	tbuf.3887+377196(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+380332(%rip)
	vmovss	tbuf.3887+44112(%rip), %xmm0
	vsubss	tbuf.3887+377200(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+380336(%rip)
	vmovss	tbuf.3887+44116(%rip), %xmm0
	vsubss	tbuf.3887+377204(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+380340(%rip)
	vmovss	tbuf.3887+44120(%rip), %xmm0
	vsubss	tbuf.3887+377208(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+380344(%rip)
	vmovss	tbuf.3887+44124(%rip), %xmm0
	vsubss	tbuf.3887+377212(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+380348(%rip)
	.p2align 4,,10
	.p2align 3
.L93:
	vmovaps	(%rsi), %ymm0
	addq	$32, %rsi
	vsubps	333056(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 336192(%rsi)
	cmpq	$tbuf.3887+47232, %rsi
	jne	.L93
	vmovss	tbuf.3887+47232(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vsubss	tbuf.3887+380320(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+383456(%rip)
	vmovss	tbuf.3887+47236(%rip), %xmm0
	vsubss	tbuf.3887+380324(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+383460(%rip)
	vmovss	tbuf.3887+293016(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+383464(%rip)
	vmovss	%xmm1, tbuf.3887+383468(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L94:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 383464(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L94
	vmovss	tbuf.3887+47240(%rip), %xmm0
	movl	$tbuf.3887+47260, %esi
	vsubss	tbuf.3887+383468(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+386604(%rip)
	vmovss	tbuf.3887+47244(%rip), %xmm0
	vsubss	tbuf.3887+383472(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+386608(%rip)
	vmovss	tbuf.3887+47248(%rip), %xmm0
	vsubss	tbuf.3887+383476(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+386612(%rip)
	vmovss	tbuf.3887+47252(%rip), %xmm0
	vsubss	tbuf.3887+383480(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+386616(%rip)
	vmovss	tbuf.3887+47256(%rip), %xmm0
	vsubss	tbuf.3887+383484(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+386620(%rip)
	.p2align 4,,10
	.p2align 3
.L95:
	vmovups	(%rsi), %xmm0
	addq	$32, %rsi
	vinsertf128	$0x1, -16(%rsi), %ymm0, %ymm0
	vsubps	336196(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 339332(%rsi)
	cmpq	$tbuf.3887+50364, %rsi
	jne	.L95
	vmovss	tbuf.3887+50364(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vsubss	tbuf.3887+386592(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+389728(%rip)
	vmovss	tbuf.3887+50368(%rip), %xmm0
	vsubss	tbuf.3887+386596(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+389732(%rip)
	vmovss	tbuf.3887+50372(%rip), %xmm0
	vsubss	tbuf.3887+386600(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+389736(%rip)
	vmovss	tbuf.3887+293020(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+389740(%rip)
	vmovss	%xmm1, tbuf.3887+389744(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L96:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 389740(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L96
	vmovss	tbuf.3887+50376(%rip), %xmm0
	movl	$tbuf.3887+50392, %esi
	vsubss	tbuf.3887+389744(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+392880(%rip)
	vmovss	tbuf.3887+50380(%rip), %xmm0
	vsubss	tbuf.3887+389748(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+392884(%rip)
	vmovss	tbuf.3887+50384(%rip), %xmm0
	vsubss	tbuf.3887+389752(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+392888(%rip)
	vmovss	tbuf.3887+50388(%rip), %xmm0
	vsubss	tbuf.3887+389756(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+392892(%rip)
	.p2align 4,,10
	.p2align 3
.L97:
	vmovups	(%rsi), %xmm0
	addq	$32, %rsi
	vinsertf128	$0x1, -16(%rsi), %ymm0, %ymm0
	vsubps	339336(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 342472(%rsi)
	cmpq	$tbuf.3887+53496, %rsi
	jne	.L97
	vmovss	tbuf.3887+53496(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vsubss	tbuf.3887+392864(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+396000(%rip)
	vmovss	tbuf.3887+53500(%rip), %xmm0
	vsubss	tbuf.3887+392868(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+396004(%rip)
	vmovss	tbuf.3887+53504(%rip), %xmm0
	vsubss	tbuf.3887+392872(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+396008(%rip)
	vmovss	tbuf.3887+53508(%rip), %xmm0
	vsubss	tbuf.3887+392876(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+396012(%rip)
	vmovss	tbuf.3887+293024(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+396016(%rip)
	vmovss	%xmm1, tbuf.3887+396020(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L98:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 396016(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L98
	vmovss	tbuf.3887+53512(%rip), %xmm0
	movl	$tbuf.3887+53524, %esi
	vsubss	tbuf.3887+396020(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+399156(%rip)
	vmovss	tbuf.3887+53516(%rip), %xmm0
	vsubss	tbuf.3887+396024(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+399160(%rip)
	vmovss	tbuf.3887+53520(%rip), %xmm0
	vsubss	tbuf.3887+396028(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+399164(%rip)
	.p2align 4,,10
	.p2align 3
.L99:
	vmovups	(%rsi), %xmm0
	addq	$32, %rsi
	vinsertf128	$0x1, -16(%rsi), %ymm0, %ymm0
	vsubps	342476(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 345612(%rsi)
	cmpq	$tbuf.3887+56628, %rsi
	jne	.L99
	vmovss	tbuf.3887+56628(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vsubss	tbuf.3887+399136(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+402272(%rip)
	vmovss	tbuf.3887+56632(%rip), %xmm0
	vsubss	tbuf.3887+399140(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+402276(%rip)
	vmovss	tbuf.3887+56636(%rip), %xmm0
	vsubss	tbuf.3887+399144(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+402280(%rip)
	vmovss	tbuf.3887+56640(%rip), %xmm0
	vsubss	tbuf.3887+399148(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+402284(%rip)
	vmovss	tbuf.3887+56644(%rip), %xmm0
	vsubss	tbuf.3887+399152(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+402288(%rip)
	vmovss	tbuf.3887+293028(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+402292(%rip)
	vmovss	%xmm1, tbuf.3887+402296(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L100:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 402292(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L100
	vmovss	tbuf.3887+56648(%rip), %xmm0
	movl	$tbuf.3887+56656, %esi
	vsubss	tbuf.3887+402296(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+405432(%rip)
	vmovss	tbuf.3887+56652(%rip), %xmm0
	vsubss	tbuf.3887+402300(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+405436(%rip)
	.p2align 4,,10
	.p2align 3
.L101:
	vmovaps	(%rsi), %xmm0
	addq	$32, %rsi
	vinsertf128	$0x1, -16(%rsi), %ymm0, %ymm0
	vsubps	345616(%rsi), %ymm0, %ymm0
	vmovaps	%ymm0, 348752(%rsi)
	cmpq	$tbuf.3887+59760, %rsi
	jne	.L101
	vmovss	tbuf.3887+59760(%rip), %xmm0
	movl	$tbuf.3887+4, %esi
	vsubss	tbuf.3887+405408(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+408544(%rip)
	vmovss	tbuf.3887+59764(%rip), %xmm0
	vsubss	tbuf.3887+405412(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+408548(%rip)
	vmovss	tbuf.3887+59768(%rip), %xmm0
	vsubss	tbuf.3887+405416(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+408552(%rip)
	vmovss	tbuf.3887+59772(%rip), %xmm0
	vsubss	tbuf.3887+405420(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+408556(%rip)
	vmovss	tbuf.3887+59776(%rip), %xmm0
	vsubss	tbuf.3887+405424(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+408560(%rip)
	vmovss	tbuf.3887+59780(%rip), %xmm0
	vsubss	tbuf.3887+405428(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+408564(%rip)
	vmovss	tbuf.3887+293032(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+408568(%rip)
	vmovss	%xmm1, tbuf.3887+408572(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L102:
	vmulss	(%rsi), %xmm0, %xmm0
	addq	$4, %rsi
	vmovss	%xmm0, 408568(%rsi)
	cmpq	$tbuf.3887+3136, %rsi
	vmovaps	%xmm1, %xmm0
	jne	.L102
	vmovss	tbuf.3887+59784(%rip), %xmm0
	vsubss	tbuf.3887+408572(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+411708(%rip)
	.p2align 4,,10
	.p2align 3
.L103:
	vmovups	0(%r13), %xmm0
	addq	$32, %r13
	vinsertf128	$0x1, -16(%r13), %ymm0, %ymm0
	vsubps	348756(%r13), %ymm0, %ymm0
	vmovaps	%ymm0, 351892(%r13)
	cmpq	$tbuf.3887+62892, %r13
	jne	.L103
	vmovss	tbuf.3887+62892(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vsubss	tbuf.3887+411680(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+414816(%rip)
	vmovss	tbuf.3887+62896(%rip), %xmm0
	vsubss	tbuf.3887+411684(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+414820(%rip)
	vmovss	tbuf.3887+62900(%rip), %xmm0
	vsubss	tbuf.3887+411688(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+414824(%rip)
	vmovss	tbuf.3887+62904(%rip), %xmm0
	vsubss	tbuf.3887+411692(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+414828(%rip)
	vmovss	tbuf.3887+62908(%rip), %xmm0
	vsubss	tbuf.3887+411696(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+414832(%rip)
	vmovss	tbuf.3887+62912(%rip), %xmm0
	vsubss	tbuf.3887+411700(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+414836(%rip)
	vmovss	tbuf.3887+62916(%rip), %xmm0
	vsubss	tbuf.3887+411704(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+414840(%rip)
	vmovss	tbuf.3887+293036(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+414844(%rip)
	vmovss	%xmm1, tbuf.3887+414848(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L104:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 414844(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L104
	movl	$tbuf.3887+62920, %ecx
	.p2align 4,,10
	.p2align 3
.L105:
	vmovups	(%rcx), %xmm0
	addq	$32, %rcx
	vinsertf128	$0x1, -16(%rcx), %ymm0, %ymm0
	vsubps	351896(%rcx), %ymm0, %ymm0
	vmovaps	%ymm0, 355032(%rcx)
	cmpq	$tbuf.3887+66056, %rcx
	jne	.L105
	vmovss	tbuf.3887+293040(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+421120(%rip)
	vmovss	%xmm1, tbuf.3887+421124(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L106:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 421120(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L106
	vmovss	tbuf.3887+66056(%rip), %xmm0
	movl	$tbuf.3887+66084, %ecx
	vsubss	tbuf.3887+421124(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+424260(%rip)
	vmovss	tbuf.3887+66060(%rip), %xmm0
	vsubss	tbuf.3887+421128(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+424264(%rip)
	vmovss	tbuf.3887+66064(%rip), %xmm0
	vsubss	tbuf.3887+421132(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+424268(%rip)
	vmovss	tbuf.3887+66068(%rip), %xmm0
	vsubss	tbuf.3887+421136(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+424272(%rip)
	vmovss	tbuf.3887+66072(%rip), %xmm0
	vsubss	tbuf.3887+421140(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+424276(%rip)
	vmovss	tbuf.3887+66076(%rip), %xmm0
	vsubss	tbuf.3887+421144(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+424280(%rip)
	vmovss	tbuf.3887+66080(%rip), %xmm0
	vsubss	tbuf.3887+421148(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+424284(%rip)
	.p2align 4,,10
	.p2align 3
.L107:
	vmovups	(%rcx), %xmm0
	addq	$32, %rcx
	vinsertf128	$0x1, -16(%rcx), %ymm0, %ymm0
	vsubps	355036(%rcx), %ymm0, %ymm0
	vmovaps	%ymm0, 358172(%rcx)
	cmpq	$tbuf.3887+69188, %rcx
	jne	.L107
	vmovss	tbuf.3887+69188(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vsubss	tbuf.3887+424256(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+427392(%rip)
	vmovss	tbuf.3887+293044(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+427396(%rip)
	vmovss	%xmm1, tbuf.3887+427400(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L108:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 427396(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L108
	vmovss	tbuf.3887+69192(%rip), %xmm0
	movl	$tbuf.3887+69216, %ecx
	vsubss	tbuf.3887+427400(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+430536(%rip)
	vmovss	tbuf.3887+69196(%rip), %xmm0
	vsubss	tbuf.3887+427404(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+430540(%rip)
	vmovss	tbuf.3887+69200(%rip), %xmm0
	vsubss	tbuf.3887+427408(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+430544(%rip)
	vmovss	tbuf.3887+69204(%rip), %xmm0
	vsubss	tbuf.3887+427412(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+430548(%rip)
	vmovss	tbuf.3887+69208(%rip), %xmm0
	vsubss	tbuf.3887+427416(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+430552(%rip)
	vmovss	tbuf.3887+69212(%rip), %xmm0
	vsubss	tbuf.3887+427420(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+430556(%rip)
	.p2align 4,,10
	.p2align 3
.L109:
	vmovaps	(%rcx), %ymm0
	addq	$32, %rcx
	vsubps	358176(%rcx), %ymm0, %ymm0
	vmovaps	%ymm0, 361312(%rcx)
	cmpq	$tbuf.3887+72320, %rcx
	jne	.L109
	vmovss	tbuf.3887+72320(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vsubss	tbuf.3887+430528(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+433664(%rip)
	vmovss	tbuf.3887+72324(%rip), %xmm0
	vsubss	tbuf.3887+430532(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+433668(%rip)
	vmovss	tbuf.3887+293048(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+433672(%rip)
	vmovss	%xmm1, tbuf.3887+433676(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L110:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 433672(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L110
	vmovss	tbuf.3887+72328(%rip), %xmm0
	movl	$tbuf.3887+72348, %ecx
	vsubss	tbuf.3887+433676(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+436812(%rip)
	vmovss	tbuf.3887+72332(%rip), %xmm0
	vsubss	tbuf.3887+433680(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+436816(%rip)
	vmovss	tbuf.3887+72336(%rip), %xmm0
	vsubss	tbuf.3887+433684(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+436820(%rip)
	vmovss	tbuf.3887+72340(%rip), %xmm0
	vsubss	tbuf.3887+433688(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+436824(%rip)
	vmovss	tbuf.3887+72344(%rip), %xmm0
	vsubss	tbuf.3887+433692(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+436828(%rip)
	.p2align 4,,10
	.p2align 3
.L111:
	vmovups	(%rcx), %xmm0
	addq	$32, %rcx
	vinsertf128	$0x1, -16(%rcx), %ymm0, %ymm0
	vsubps	361316(%rcx), %ymm0, %ymm0
	vmovaps	%ymm0, 364452(%rcx)
	cmpq	$tbuf.3887+75452, %rcx
	jne	.L111
	vmovss	tbuf.3887+75452(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vsubss	tbuf.3887+436800(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+439936(%rip)
	vmovss	tbuf.3887+75456(%rip), %xmm0
	vsubss	tbuf.3887+436804(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+439940(%rip)
	vmovss	tbuf.3887+75460(%rip), %xmm0
	vsubss	tbuf.3887+436808(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+439944(%rip)
	vmovss	tbuf.3887+293052(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+439948(%rip)
	vmovss	%xmm1, tbuf.3887+439952(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L112:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 439948(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L112
	vmovss	tbuf.3887+75464(%rip), %xmm0
	movl	$tbuf.3887+75480, %ecx
	vsubss	tbuf.3887+439952(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+443088(%rip)
	vmovss	tbuf.3887+75468(%rip), %xmm0
	vsubss	tbuf.3887+439956(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+443092(%rip)
	vmovss	tbuf.3887+75472(%rip), %xmm0
	vsubss	tbuf.3887+439960(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+443096(%rip)
	vmovss	tbuf.3887+75476(%rip), %xmm0
	vsubss	tbuf.3887+439964(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+443100(%rip)
	.p2align 4,,10
	.p2align 3
.L113:
	vmovups	(%rcx), %xmm0
	addq	$32, %rcx
	vinsertf128	$0x1, -16(%rcx), %ymm0, %ymm0
	vsubps	364456(%rcx), %ymm0, %ymm0
	vmovaps	%ymm0, 367592(%rcx)
	cmpq	$tbuf.3887+78584, %rcx
	jne	.L113
	vmovss	tbuf.3887+78584(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vsubss	tbuf.3887+443072(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+446208(%rip)
	vmovss	tbuf.3887+78588(%rip), %xmm0
	vsubss	tbuf.3887+443076(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+446212(%rip)
	vmovss	tbuf.3887+78592(%rip), %xmm0
	vsubss	tbuf.3887+443080(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+446216(%rip)
	vmovss	tbuf.3887+78596(%rip), %xmm0
	vsubss	tbuf.3887+443084(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+446220(%rip)
	vmovss	tbuf.3887+293056(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+446224(%rip)
	vmovss	%xmm1, tbuf.3887+446228(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L114:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 446224(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L114
	vmovss	tbuf.3887+78600(%rip), %xmm0
	movl	$tbuf.3887+78612, %ecx
	vsubss	tbuf.3887+446228(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+81716, %esi
	vmovss	%xmm0, tbuf.3887+449364(%rip)
	vmovss	tbuf.3887+78604(%rip), %xmm0
	vsubss	tbuf.3887+446232(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+449368(%rip)
	vmovss	tbuf.3887+78608(%rip), %xmm0
	vsubss	tbuf.3887+446236(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+449372(%rip)
	.p2align 4,,10
	.p2align 3
.L115:
	vmovups	(%rcx), %xmm0
	addq	$32, %rcx
	vinsertf128	$0x1, -16(%rcx), %ymm0, %ymm0
	vsubps	367596(%rcx), %ymm0, %ymm0
	vmovaps	%ymm0, 370732(%rcx)
	cmpq	%rcx, %rsi
	jne	.L115
	vmovss	tbuf.3887+81716(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vsubss	tbuf.3887+449344(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+452480(%rip)
	vmovss	tbuf.3887+81720(%rip), %xmm0
	vsubss	tbuf.3887+449348(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+452484(%rip)
	vmovss	tbuf.3887+81724(%rip), %xmm0
	vsubss	tbuf.3887+449352(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+452488(%rip)
	vmovss	tbuf.3887+81728(%rip), %xmm0
	vsubss	tbuf.3887+449356(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+452492(%rip)
	vmovss	tbuf.3887+81732(%rip), %xmm0
	vsubss	tbuf.3887+449360(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+452496(%rip)
	vmovss	tbuf.3887+293060(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+452500(%rip)
	vmovss	%xmm1, tbuf.3887+452504(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L116:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 452500(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L116
	vmovss	tbuf.3887+81736(%rip), %xmm0
	movl	$tbuf.3887+81744, %ecx
	vsubss	tbuf.3887+452504(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+455640(%rip)
	vmovss	tbuf.3887+81740(%rip), %xmm0
	vsubss	tbuf.3887+452508(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+455644(%rip)
	.p2align 4,,10
	.p2align 3
.L117:
	vmovaps	(%rcx), %xmm0
	addq	$32, %rcx
	vinsertf128	$0x1, -16(%rcx), %ymm0, %ymm0
	vsubps	370736(%rcx), %ymm0, %ymm0
	vmovaps	%ymm0, 373872(%rcx)
	cmpq	$tbuf.3887+84848, %rcx
	jne	.L117
	vmovss	tbuf.3887+84848(%rip), %xmm0
	movl	$tbuf.3887+4, %ecx
	vsubss	tbuf.3887+455616(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+458752(%rip)
	vmovss	tbuf.3887+84852(%rip), %xmm0
	vsubss	tbuf.3887+455620(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+458756(%rip)
	vmovss	tbuf.3887+84856(%rip), %xmm0
	vsubss	tbuf.3887+455624(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+458760(%rip)
	vmovss	tbuf.3887+84860(%rip), %xmm0
	vsubss	tbuf.3887+455628(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+458764(%rip)
	vmovss	tbuf.3887+84864(%rip), %xmm0
	vsubss	tbuf.3887+455632(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+458768(%rip)
	vmovss	tbuf.3887+84868(%rip), %xmm0
	vsubss	tbuf.3887+455636(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+458772(%rip)
	vmovss	tbuf.3887+293064(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+458776(%rip)
	vmovss	%xmm1, tbuf.3887+458780(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L118:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 458776(%rcx)
	cmpq	$tbuf.3887+3136, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L118
	vmovss	tbuf.3887+84872(%rip), %xmm0
	vsubss	tbuf.3887+458780(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+461916(%rip)
	.p2align 4,,10
	.p2align 3
.L119:
	vmovups	(%r14), %xmm0
	addq	$32, %r14
	vinsertf128	$0x1, -16(%r14), %ymm0, %ymm0
	vsubps	373876(%r14), %ymm0, %ymm0
	vmovaps	%ymm0, 377012(%r14)
	cmpq	$tbuf.3887+87980, %r14
	jne	.L119
	vmovss	tbuf.3887+87980(%rip), %xmm0
	movl	$tbuf.3887+4, %edx
	vsubss	tbuf.3887+461888(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+465024(%rip)
	vmovss	tbuf.3887+87984(%rip), %xmm0
	vsubss	tbuf.3887+461892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+465028(%rip)
	vmovss	tbuf.3887+87988(%rip), %xmm0
	vsubss	tbuf.3887+461896(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+465032(%rip)
	vmovss	tbuf.3887+87992(%rip), %xmm0
	vsubss	tbuf.3887+461900(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+465036(%rip)
	vmovss	tbuf.3887+87996(%rip), %xmm0
	vsubss	tbuf.3887+461904(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+465040(%rip)
	vmovss	tbuf.3887+88000(%rip), %xmm0
	vsubss	tbuf.3887+461908(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+465044(%rip)
	vmovss	tbuf.3887+88004(%rip), %xmm0
	vsubss	tbuf.3887+461912(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+465048(%rip)
	vmovss	tbuf.3887+293068(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+465052(%rip)
	vmovss	%xmm1, tbuf.3887+465056(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L120:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 465052(%rdx)
	cmpq	$tbuf.3887+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L120
	movl	$tbuf.3887+88008, %edx
	.p2align 4,,10
	.p2align 3
.L121:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	377016(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 380152(%rdx)
	cmpq	$tbuf.3887+91144, %rdx
	jne	.L121
	vmovss	tbuf.3887+293072(%rip), %xmm0
	movl	$tbuf.3887+4, %edx
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+471328(%rip)
	vmovss	%xmm1, tbuf.3887+471332(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L122:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 471328(%rdx)
	cmpq	$tbuf.3887+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L122
	vmovss	tbuf.3887+91144(%rip), %xmm0
	movl	$tbuf.3887+91172, %edx
	vsubss	tbuf.3887+471332(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+474468(%rip)
	vmovss	tbuf.3887+91148(%rip), %xmm0
	vsubss	tbuf.3887+471336(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+474472(%rip)
	vmovss	tbuf.3887+91152(%rip), %xmm0
	vsubss	tbuf.3887+471340(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+474476(%rip)
	vmovss	tbuf.3887+91156(%rip), %xmm0
	vsubss	tbuf.3887+471344(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+474480(%rip)
	vmovss	tbuf.3887+91160(%rip), %xmm0
	vsubss	tbuf.3887+471348(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+474484(%rip)
	vmovss	tbuf.3887+91164(%rip), %xmm0
	vsubss	tbuf.3887+471352(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+474488(%rip)
	vmovss	tbuf.3887+91168(%rip), %xmm0
	vsubss	tbuf.3887+471356(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+474492(%rip)
	.p2align 4,,10
	.p2align 3
.L123:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	380156(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 383292(%rdx)
	cmpq	$tbuf.3887+94276, %rdx
	jne	.L123
	vmovss	tbuf.3887+94276(%rip), %xmm0
	vsubss	tbuf.3887+474464(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+477600(%rip)
	vmovss	tbuf.3887+293076(%rip), %xmm0
	vmulss	tbuf.3887+98616(%rip), %xmm0, %xmm0
	vmulss	tbuf.3887(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.3887+477604(%rip)
	vmovss	%xmm1, tbuf.3887+477608(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L124:
	vmulss	(%rax), %xmm0, %xmm0
	addq	$4, %rax
	vmovss	%xmm0, 477604(%rax)
	cmpq	$tbuf.3887+3136, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L124
	vmovss	tbuf.3887+94280(%rip), %xmm0
	movl	$tbuf.3887+94304, %eax
	vsubss	tbuf.3887+477608(%rip), %xmm0, %xmm0
	movl	$tbuf.3887+97408, %edx
	vmovss	%xmm0, tbuf.3887+480744(%rip)
	vmovss	tbuf.3887+94284(%rip), %xmm0
	vsubss	tbuf.3887+477612(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+480748(%rip)
	vmovss	tbuf.3887+94288(%rip), %xmm0
	vsubss	tbuf.3887+477616(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+480752(%rip)
	vmovss	tbuf.3887+94292(%rip), %xmm0
	vsubss	tbuf.3887+477620(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+480756(%rip)
	vmovss	tbuf.3887+94296(%rip), %xmm0
	vsubss	tbuf.3887+477624(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+480760(%rip)
	vmovss	tbuf.3887+94300(%rip), %xmm0
	vsubss	tbuf.3887+477628(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+480764(%rip)
	.p2align 4,,10
	.p2align 3
.L125:
	vmovaps	(%rax), %ymm0
	addq	$32, %rax
	vsubps	383296(%rax), %ymm0, %ymm0
	vmovaps	%ymm0, 386432(%rax)
	cmpq	%rax, %rdx
	jne	.L125
	vmovss	tbuf.3887+97408(%rip), %xmm0
	vsubss	tbuf.3887+480736(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+483872(%rip)
	vmovss	tbuf.3887+97412(%rip), %xmm0
	vsubss	tbuf.3887+480740(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+483876(%rip)
	vmovss	tbuf.3887+98616(%rip), %xmm0
	vbroadcastss	%xmm0, %ymm1
	vmulps	tbuf.3887+292960(%rip), %ymm1, %ymm2
	vmovups	%xmm2, tbuf.3887+483880(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+483896(%rip)
	vmulps	tbuf.3887+292992(%rip), %ymm1, %ymm2
	vmulps	tbuf.3887+293024(%rip), %ymm1, %ymm1
	vmovups	%xmm2, tbuf.3887+483912(%rip)
	vextractf128	$0x1, %ymm2, tbuf.3887+483928(%rip)
	vmovups	%xmm1, tbuf.3887+483944(%rip)
	vextractf128	$0x1, %ymm1, tbuf.3887+483960(%rip)
	vmulss	tbuf.3887+293056(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+483976(%rip)
	vmulss	tbuf.3887+293060(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+483980(%rip)
	vmulss	tbuf.3887+293064(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+483984(%rip)
	vmulss	tbuf.3887+293068(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.3887+483988(%rip)
	vmulss	tbuf.3887+293072(%rip), %xmm0, %xmm1
	vmulss	tbuf.3887+293076(%rip), %xmm0, %xmm0
	vmovss	%xmm1, tbuf.3887+483992(%rip)
	vmovss	%xmm0, tbuf.3887+483996(%rip)
	vmovss	tbuf.3887+3176(%rip), %xmm0
	vsubss	tbuf.3887+483880(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+484000(%rip)
	vmovss	tbuf.3887+3180(%rip), %xmm0
	vsubss	tbuf.3887+483884(%rip), %xmm0, %xmm0
	cmpq	$tbuf.3887+484032, -80(%rbp)
	vmovss	%xmm0, tbuf.3887+484004(%rip)
	vmovss	tbuf.3887+3184(%rip), %xmm0
	vsubss	tbuf.3887+483888(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+484008(%rip)
	vmovss	tbuf.3887+3188(%rip), %xmm0
	vsubss	tbuf.3887+483892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+484012(%rip)
	vmovss	tbuf.3887+3192(%rip), %xmm0
	vsubss	tbuf.3887+483896(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+484016(%rip)
	vmovss	tbuf.3887+3196(%rip), %xmm0
	vsubss	tbuf.3887+483900(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.3887+484020(%rip)
	vmovaps	tbuf.3887+3200(%rip), %ymm0
	vsubps	tbuf.3887+483904(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+484024(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+484040(%rip)
	vmovaps	tbuf.3887+3232(%rip), %ymm0
	vsubps	tbuf.3887+483936(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+484056(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+484072(%rip)
	vmovaps	tbuf.3887+3264(%rip), %ymm0
	vsubps	tbuf.3887+483968(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.3887+484088(%rip)
	vextractf128	$0x1, %ymm0, tbuf.3887+484104(%rip)
	jnb	.L325
	cmpq	$tbuf.3887+484000, -88(%rbp)
	ja	.L126
.L325:
	vmovaps	tbuf.3887+484000(%rip), %ymm0
	vmovups	%xmm0, 3136(%r12)
	vextractf128	$0x1, %ymm0, 3152(%r12)
	vmovaps	tbuf.3887+484032(%rip), %ymm0
	vmovups	%xmm0, 3168(%r12)
	vextractf128	$0x1, %ymm0, 3184(%r12)
	vmovaps	tbuf.3887+484064(%rip), %ymm0
	vmovups	%xmm0, 3200(%r12)
	vextractf128	$0x1, %ymm0, 3216(%r12)
	vmovss	tbuf.3887+484096(%rip), %xmm0
	vmovss	%xmm0, 3232(%r12)
	vmovss	tbuf.3887+484100(%rip), %xmm0
	vmovss	%xmm0, 3236(%r12)
	vmovss	tbuf.3887+484104(%rip), %xmm0
	vmovss	%xmm0, 3240(%r12)
	vmovss	tbuf.3887+484108(%rip), %xmm0
	vmovss	%xmm0, 3244(%r12)
	vmovss	tbuf.3887+484112(%rip), %xmm0
	vmovss	%xmm0, 3248(%r12)
	vmovss	tbuf.3887+484116(%rip), %xmm0
	vmovss	%xmm0, 3252(%r12)
.L128:
	leaq	3256(%r12), %rax
	cmpq	$tbuf.3887+295592, %rax
	jnb	.L326
	leaq	3288(%r12), %rax
	cmpq	$tbuf.3887+295560, %rax
	ja	.L130
.L326:
	vmovups	tbuf.3887+295560(%rip), %xmm0
	vinsertf128	$0x1, tbuf.3887+295576(%rip), %ymm0, %ymm0
	vmovups	%xmm0, 3256(%r12)
	vextractf128	$0x1, %ymm0, 3272(%r12)
	vmovss	tbuf.3887+295592(%rip), %xmm0
	vmovss	%xmm0, 3288(%r12)
	vmovss	tbuf.3887+295596(%rip), %xmm0
	vmovss	%xmm0, 3292(%r12)
.L132:
	leaq	3296(%r12), %rax
	cmpq	$tbuf.3887+298772, %rax
	jnb	.L327
	leaq	3328(%r12), %rax
	cmpq	$tbuf.3887+298740, %rax
	ja	.L133
.L327:
	vmovss	tbuf.3887+298740(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 3296(%r12)
	vmovss	tbuf.3887+298744(%rip), %xmm0
	vmovss	%xmm0, 3300(%r12)
	vmovss	tbuf.3887+298748(%rip), %xmm0
	vmovss	%xmm0, 3304(%r12)
	.p2align 4,,10
	.p2align 3
.L135:
	vmovaps	tbuf.3887+298752(%rax), %ymm0
	vmovups	%xmm0, 3308(%r12,%rax)
	vextractf128	$0x1, %ymm0, 3324(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L135
	vmovss	tbuf.3887+301856(%rip), %xmm0
	vmovss	%xmm0, 6412(%r12)
	vmovss	tbuf.3887+301860(%rip), %xmm0
	vmovss	%xmm0, 6416(%r12)
	vmovss	tbuf.3887+301864(%rip), %xmm0
	vmovss	%xmm0, 6420(%r12)
	vmovss	tbuf.3887+301868(%rip), %xmm0
	vmovss	%xmm0, 6424(%r12)
	vmovss	tbuf.3887+301872(%rip), %xmm0
	vmovss	%xmm0, 6428(%r12)
.L136:
	leaq	6432(%r12), %rax
	cmpq	$tbuf.3887+305048, %rax
	jnb	.L328
	leaq	6464(%r12), %rax
	cmpq	$tbuf.3887+305016, %rax
	ja	.L138
.L328:
	vmovss	tbuf.3887+305016(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 6432(%r12)
	vmovss	tbuf.3887+305020(%rip), %xmm0
	vmovss	%xmm0, 6436(%r12)
	.p2align 4,,10
	.p2align 3
.L140:
	vmovaps	tbuf.3887+305024(%rax), %ymm0
	vmovups	%xmm0, 6440(%r12,%rax)
	vextractf128	$0x1, %ymm0, 6456(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L140
	vmovss	tbuf.3887+308128(%rip), %xmm0
	vmovss	%xmm0, 9544(%r12)
	vmovss	tbuf.3887+308132(%rip), %xmm0
	vmovss	%xmm0, 9548(%r12)
	vmovss	tbuf.3887+308136(%rip), %xmm0
	vmovss	%xmm0, 9552(%r12)
	vmovss	tbuf.3887+308140(%rip), %xmm0
	vmovss	%xmm0, 9556(%r12)
	vmovss	tbuf.3887+308144(%rip), %xmm0
	vmovss	%xmm0, 9560(%r12)
	vmovss	tbuf.3887+308148(%rip), %xmm0
	vmovss	%xmm0, 9564(%r12)
.L141:
	leaq	9568(%r12), %rax
	cmpq	$tbuf.3887+311324, %rax
	jnb	.L329
	leaq	9600(%r12), %rax
	cmpq	$tbuf.3887+311292, %rax
	ja	.L143
.L329:
	vmovss	tbuf.3887+311292(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 9568(%r12)
	.p2align 4,,10
	.p2align 3
.L145:
	vmovaps	tbuf.3887+311296(%rax), %ymm0
	vmovups	%xmm0, 9572(%r12,%rax)
	vextractf128	$0x1, %ymm0, 9588(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L145
	vmovss	tbuf.3887+314400(%rip), %xmm0
	vmovss	%xmm0, 12676(%r12)
	vmovss	tbuf.3887+314404(%rip), %xmm0
	vmovss	%xmm0, 12680(%r12)
	vmovss	tbuf.3887+314408(%rip), %xmm0
	vmovss	%xmm0, 12684(%r12)
	vmovss	tbuf.3887+314412(%rip), %xmm0
	vmovss	%xmm0, 12688(%r12)
	vmovss	tbuf.3887+314416(%rip), %xmm0
	vmovss	%xmm0, 12692(%r12)
	vmovss	tbuf.3887+314420(%rip), %xmm0
	vmovss	%xmm0, 12696(%r12)
	vmovss	tbuf.3887+314424(%rip), %xmm0
	vmovss	%xmm0, 12700(%r12)
.L146:
	leaq	12704(%r12), %rax
	cmpq	$tbuf.3887+317600, %rax
	jnb	.L330
	leaq	12736(%r12), %rax
	cmpq	$tbuf.3887+317568, %rax
	ja	.L148
.L330:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L150:
	vmovaps	tbuf.3887+317568(%rax), %ymm0
	vmovups	%xmm0, 12704(%r12,%rax)
	vextractf128	$0x1, %ymm0, 12720(%r12,%rax)
	addq	$32, %rax
	cmpq	$3136, %rax
	jne	.L150
.L151:
	leaq	15840(%r12), %rax
	cmpq	$tbuf.3887+323876, %rax
	jnb	.L331
	leaq	15872(%r12), %rax
	cmpq	$tbuf.3887+323844, %rax
	ja	.L153
.L331:
	vmovss	tbuf.3887+323844(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 15840(%r12)
	vmovss	tbuf.3887+323848(%rip), %xmm0
	vmovss	%xmm0, 15844(%r12)
	vmovss	tbuf.3887+323852(%rip), %xmm0
	vmovss	%xmm0, 15848(%r12)
	vmovss	tbuf.3887+323856(%rip), %xmm0
	vmovss	%xmm0, 15852(%r12)
	vmovss	tbuf.3887+323860(%rip), %xmm0
	vmovss	%xmm0, 15856(%r12)
	vmovss	tbuf.3887+323864(%rip), %xmm0
	vmovss	%xmm0, 15860(%r12)
	vmovss	tbuf.3887+323868(%rip), %xmm0
	vmovss	%xmm0, 15864(%r12)
	.p2align 4,,10
	.p2align 3
.L155:
	vmovaps	tbuf.3887+323872(%rax), %ymm0
	vmovups	%xmm0, 15868(%r12,%rax)
	vextractf128	$0x1, %ymm0, 15884(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L155
	vmovss	tbuf.3887+326976(%rip), %xmm0
	vmovss	%xmm0, 18972(%r12)
.L156:
	leaq	18976(%r12), %rax
	cmpq	$tbuf.3887+330152, %rax
	jnb	.L332
	leaq	19008(%r12), %rax
	cmpq	$tbuf.3887+330120, %rax
	ja	.L158
.L332:
	vmovss	tbuf.3887+330120(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 18976(%r12)
	vmovss	tbuf.3887+330124(%rip), %xmm0
	vmovss	%xmm0, 18980(%r12)
	vmovss	tbuf.3887+330128(%rip), %xmm0
	vmovss	%xmm0, 18984(%r12)
	vmovss	tbuf.3887+330132(%rip), %xmm0
	vmovss	%xmm0, 18988(%r12)
	vmovss	tbuf.3887+330136(%rip), %xmm0
	vmovss	%xmm0, 18992(%r12)
	vmovss	tbuf.3887+330140(%rip), %xmm0
	vmovss	%xmm0, 18996(%r12)
	.p2align 4,,10
	.p2align 3
.L160:
	vmovaps	tbuf.3887+330144(%rax), %ymm0
	vmovups	%xmm0, 19000(%r12,%rax)
	vextractf128	$0x1, %ymm0, 19016(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L160
	vmovss	tbuf.3887+333248(%rip), %xmm0
	vmovss	%xmm0, 22104(%r12)
	vmovss	tbuf.3887+333252(%rip), %xmm0
	vmovss	%xmm0, 22108(%r12)
.L161:
	leaq	22112(%r12), %rax
	cmpq	$tbuf.3887+336428, %rax
	jnb	.L333
	leaq	22144(%r12), %rax
	cmpq	$tbuf.3887+336396, %rax
	ja	.L163
.L333:
	vmovss	tbuf.3887+336396(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 22112(%r12)
	vmovss	tbuf.3887+336400(%rip), %xmm0
	vmovss	%xmm0, 22116(%r12)
	vmovss	tbuf.3887+336404(%rip), %xmm0
	vmovss	%xmm0, 22120(%r12)
	vmovss	tbuf.3887+336408(%rip), %xmm0
	vmovss	%xmm0, 22124(%r12)
	vmovss	tbuf.3887+336412(%rip), %xmm0
	vmovss	%xmm0, 22128(%r12)
	.p2align 4,,10
	.p2align 3
.L165:
	vmovaps	tbuf.3887+336416(%rax), %ymm0
	vmovups	%xmm0, 22132(%r12,%rax)
	vextractf128	$0x1, %ymm0, 22148(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L165
	vmovss	tbuf.3887+339520(%rip), %xmm0
	vmovss	%xmm0, 25236(%r12)
	vmovss	tbuf.3887+339524(%rip), %xmm0
	vmovss	%xmm0, 25240(%r12)
	vmovss	tbuf.3887+339528(%rip), %xmm0
	vmovss	%xmm0, 25244(%r12)
.L166:
	leaq	25248(%r12), %rax
	cmpq	$tbuf.3887+342704, %rax
	jnb	.L334
	leaq	25280(%r12), %rax
	cmpq	$tbuf.3887+342672, %rax
	ja	.L168
.L334:
	vmovss	tbuf.3887+342672(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 25248(%r12)
	vmovss	tbuf.3887+342676(%rip), %xmm0
	vmovss	%xmm0, 25252(%r12)
	vmovss	tbuf.3887+342680(%rip), %xmm0
	vmovss	%xmm0, 25256(%r12)
	vmovss	tbuf.3887+342684(%rip), %xmm0
	vmovss	%xmm0, 25260(%r12)
	.p2align 4,,10
	.p2align 3
.L170:
	vmovaps	tbuf.3887+342688(%rax), %ymm0
	vmovups	%xmm0, 25264(%r12,%rax)
	vextractf128	$0x1, %ymm0, 25280(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L170
	vmovss	tbuf.3887+345792(%rip), %xmm0
	vmovss	%xmm0, 28368(%r12)
	vmovss	tbuf.3887+345796(%rip), %xmm0
	vmovss	%xmm0, 28372(%r12)
	vmovss	tbuf.3887+345800(%rip), %xmm0
	vmovss	%xmm0, 28376(%r12)
	vmovss	tbuf.3887+345804(%rip), %xmm0
	vmovss	%xmm0, 28380(%r12)
.L171:
	leaq	28384(%r12), %rax
	cmpq	$tbuf.3887+348980, %rax
	jnb	.L335
	leaq	28416(%r12), %rax
	cmpq	$tbuf.3887+348948, %rax
	ja	.L173
.L335:
	vmovss	tbuf.3887+348948(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 28384(%r12)
	vmovss	tbuf.3887+348952(%rip), %xmm0
	vmovss	%xmm0, 28388(%r12)
	vmovss	tbuf.3887+348956(%rip), %xmm0
	vmovss	%xmm0, 28392(%r12)
	.p2align 4,,10
	.p2align 3
.L175:
	vmovaps	tbuf.3887+348960(%rax), %ymm0
	vmovups	%xmm0, 28396(%r12,%rax)
	vextractf128	$0x1, %ymm0, 28412(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L175
	vmovss	tbuf.3887+352064(%rip), %xmm0
	vmovss	%xmm0, 31500(%r12)
	vmovss	tbuf.3887+352068(%rip), %xmm0
	vmovss	%xmm0, 31504(%r12)
	vmovss	tbuf.3887+352072(%rip), %xmm0
	vmovss	%xmm0, 31508(%r12)
	vmovss	tbuf.3887+352076(%rip), %xmm0
	vmovss	%xmm0, 31512(%r12)
	vmovss	tbuf.3887+352080(%rip), %xmm0
	vmovss	%xmm0, 31516(%r12)
.L176:
	leaq	31520(%r12), %rax
	cmpq	$tbuf.3887+355256, %rax
	jnb	.L336
	leaq	31552(%r12), %rax
	cmpq	$tbuf.3887+355224, %rax
	ja	.L178
.L336:
	vmovss	tbuf.3887+355224(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 31520(%r12)
	vmovss	tbuf.3887+355228(%rip), %xmm0
	vmovss	%xmm0, 31524(%r12)
	.p2align 4,,10
	.p2align 3
.L180:
	vmovaps	tbuf.3887+355232(%rax), %ymm0
	vmovups	%xmm0, 31528(%r12,%rax)
	vextractf128	$0x1, %ymm0, 31544(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L180
	vmovss	tbuf.3887+358336(%rip), %xmm0
	vmovss	%xmm0, 34632(%r12)
	vmovss	tbuf.3887+358340(%rip), %xmm0
	vmovss	%xmm0, 34636(%r12)
	vmovss	tbuf.3887+358344(%rip), %xmm0
	vmovss	%xmm0, 34640(%r12)
	vmovss	tbuf.3887+358348(%rip), %xmm0
	vmovss	%xmm0, 34644(%r12)
	vmovss	tbuf.3887+358352(%rip), %xmm0
	vmovss	%xmm0, 34648(%r12)
	vmovss	tbuf.3887+358356(%rip), %xmm0
	vmovss	%xmm0, 34652(%r12)
.L181:
	leaq	34656(%r12), %rax
	cmpq	$tbuf.3887+361532, %rax
	jnb	.L337
	leaq	34688(%r12), %rax
	cmpq	$tbuf.3887+361500, %rax
	ja	.L183
.L337:
	vmovss	tbuf.3887+361500(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 34656(%r12)
	.p2align 4,,10
	.p2align 3
.L185:
	vmovaps	tbuf.3887+361504(%rax), %ymm0
	vmovups	%xmm0, 34660(%r12,%rax)
	vextractf128	$0x1, %ymm0, 34676(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L185
	vmovss	tbuf.3887+364608(%rip), %xmm0
	vmovss	%xmm0, 37764(%r12)
	vmovss	tbuf.3887+364612(%rip), %xmm0
	vmovss	%xmm0, 37768(%r12)
	vmovss	tbuf.3887+364616(%rip), %xmm0
	vmovss	%xmm0, 37772(%r12)
	vmovss	tbuf.3887+364620(%rip), %xmm0
	vmovss	%xmm0, 37776(%r12)
	vmovss	tbuf.3887+364624(%rip), %xmm0
	vmovss	%xmm0, 37780(%r12)
	vmovss	tbuf.3887+364628(%rip), %xmm0
	vmovss	%xmm0, 37784(%r12)
	vmovss	tbuf.3887+364632(%rip), %xmm0
	vmovss	%xmm0, 37788(%r12)
.L186:
	leaq	37824(%r12), %rax
	cmpq	$tbuf.3887+367776, %rax
	jbe	.L338
	leaq	37792(%r12), %rax
	cmpq	$tbuf.3887+367808, %rax
	jb	.L188
.L338:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L190:
	vmovaps	tbuf.3887+367776(%rax), %ymm0
	vmovups	%xmm0, 37792(%r12,%rax)
	vextractf128	$0x1, %ymm0, 37808(%r12,%rax)
	addq	$32, %rax
	cmpq	$3136, %rax
	jne	.L190
.L191:
	leaq	40960(%r12), %rax
	cmpq	$tbuf.3887+374052, %rax
	jbe	.L339
	leaq	40928(%r12), %rax
	cmpq	$tbuf.3887+374084, %rax
	jb	.L193
.L339:
	vmovss	tbuf.3887+374052(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 40928(%r12)
	vmovss	tbuf.3887+374056(%rip), %xmm0
	vmovss	%xmm0, 40932(%r12)
	vmovss	tbuf.3887+374060(%rip), %xmm0
	vmovss	%xmm0, 40936(%r12)
	vmovss	tbuf.3887+374064(%rip), %xmm0
	vmovss	%xmm0, 40940(%r12)
	vmovss	tbuf.3887+374068(%rip), %xmm0
	vmovss	%xmm0, 40944(%r12)
	vmovss	tbuf.3887+374072(%rip), %xmm0
	vmovss	%xmm0, 40948(%r12)
	vmovss	tbuf.3887+374076(%rip), %xmm0
	vmovss	%xmm0, 40952(%r12)
	.p2align 4,,10
	.p2align 3
.L195:
	vmovaps	tbuf.3887+374080(%rax), %ymm0
	vmovups	%xmm0, 40956(%r12,%rax)
	vextractf128	$0x1, %ymm0, 40972(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L195
	vmovss	tbuf.3887+377184(%rip), %xmm0
	vmovss	%xmm0, 44060(%r12)
.L196:
	leaq	44096(%r12), %rax
	cmpq	$tbuf.3887+380328, %rax
	jbe	.L340
	leaq	44064(%r12), %rax
	cmpq	$tbuf.3887+380360, %rax
	jb	.L198
.L340:
	vmovss	tbuf.3887+380328(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 44064(%r12)
	vmovss	tbuf.3887+380332(%rip), %xmm0
	vmovss	%xmm0, 44068(%r12)
	vmovss	tbuf.3887+380336(%rip), %xmm0
	vmovss	%xmm0, 44072(%r12)
	vmovss	tbuf.3887+380340(%rip), %xmm0
	vmovss	%xmm0, 44076(%r12)
	vmovss	tbuf.3887+380344(%rip), %xmm0
	vmovss	%xmm0, 44080(%r12)
	vmovss	tbuf.3887+380348(%rip), %xmm0
	vmovss	%xmm0, 44084(%r12)
	.p2align 4,,10
	.p2align 3
.L200:
	vmovaps	tbuf.3887+380352(%rax), %ymm0
	vmovups	%xmm0, 44088(%r12,%rax)
	vextractf128	$0x1, %ymm0, 44104(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L200
	vmovss	tbuf.3887+383456(%rip), %xmm0
	vmovss	%xmm0, 47192(%r12)
	vmovss	tbuf.3887+383460(%rip), %xmm0
	vmovss	%xmm0, 47196(%r12)
.L201:
	leaq	47232(%r12), %rax
	cmpq	$tbuf.3887+386604, %rax
	jbe	.L341
	leaq	47200(%r12), %rax
	cmpq	$tbuf.3887+386636, %rax
	jb	.L203
.L341:
	vmovss	tbuf.3887+386604(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 47200(%r12)
	vmovss	tbuf.3887+386608(%rip), %xmm0
	vmovss	%xmm0, 47204(%r12)
	vmovss	tbuf.3887+386612(%rip), %xmm0
	vmovss	%xmm0, 47208(%r12)
	vmovss	tbuf.3887+386616(%rip), %xmm0
	vmovss	%xmm0, 47212(%r12)
	vmovss	tbuf.3887+386620(%rip), %xmm0
	vmovss	%xmm0, 47216(%r12)
	.p2align 4,,10
	.p2align 3
.L205:
	vmovaps	tbuf.3887+386624(%rax), %ymm0
	vmovups	%xmm0, 47220(%r12,%rax)
	vextractf128	$0x1, %ymm0, 47236(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L205
	vmovss	tbuf.3887+389728(%rip), %xmm0
	vmovss	%xmm0, 50324(%r12)
	vmovss	tbuf.3887+389732(%rip), %xmm0
	vmovss	%xmm0, 50328(%r12)
	vmovss	tbuf.3887+389736(%rip), %xmm0
	vmovss	%xmm0, 50332(%r12)
.L206:
	leaq	50368(%r12), %rax
	cmpq	$tbuf.3887+392880, %rax
	jbe	.L342
	leaq	50336(%r12), %rax
	cmpq	$tbuf.3887+392912, %rax
	jb	.L208
.L342:
	vmovss	tbuf.3887+392880(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 50336(%r12)
	vmovss	tbuf.3887+392884(%rip), %xmm0
	vmovss	%xmm0, 50340(%r12)
	vmovss	tbuf.3887+392888(%rip), %xmm0
	vmovss	%xmm0, 50344(%r12)
	vmovss	tbuf.3887+392892(%rip), %xmm0
	vmovss	%xmm0, 50348(%r12)
	.p2align 4,,10
	.p2align 3
.L210:
	vmovaps	tbuf.3887+392896(%rax), %ymm0
	vmovups	%xmm0, 50352(%r12,%rax)
	vextractf128	$0x1, %ymm0, 50368(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L210
	vmovss	tbuf.3887+396000(%rip), %xmm0
	vmovss	%xmm0, 53456(%r12)
	vmovss	tbuf.3887+396004(%rip), %xmm0
	vmovss	%xmm0, 53460(%r12)
	vmovss	tbuf.3887+396008(%rip), %xmm0
	vmovss	%xmm0, 53464(%r12)
	vmovss	tbuf.3887+396012(%rip), %xmm0
	vmovss	%xmm0, 53468(%r12)
.L211:
	leaq	53504(%r12), %rax
	cmpq	$tbuf.3887+399156, %rax
	jbe	.L343
	leaq	53472(%r12), %rax
	cmpq	$tbuf.3887+399188, %rax
	jb	.L213
.L343:
	vmovss	tbuf.3887+399156(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 53472(%r12)
	vmovss	tbuf.3887+399160(%rip), %xmm0
	vmovss	%xmm0, 53476(%r12)
	vmovss	tbuf.3887+399164(%rip), %xmm0
	vmovss	%xmm0, 53480(%r12)
	.p2align 4,,10
	.p2align 3
.L215:
	vmovaps	tbuf.3887+399168(%rax), %ymm0
	vmovups	%xmm0, 53484(%r12,%rax)
	vextractf128	$0x1, %ymm0, 53500(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L215
	vmovss	tbuf.3887+402272(%rip), %xmm0
	vmovss	%xmm0, 56588(%r12)
	vmovss	tbuf.3887+402276(%rip), %xmm0
	vmovss	%xmm0, 56592(%r12)
	vmovss	tbuf.3887+402280(%rip), %xmm0
	vmovss	%xmm0, 56596(%r12)
	vmovss	tbuf.3887+402284(%rip), %xmm0
	vmovss	%xmm0, 56600(%r12)
	vmovss	tbuf.3887+402288(%rip), %xmm0
	vmovss	%xmm0, 56604(%r12)
.L216:
	leaq	56640(%r12), %rax
	cmpq	$tbuf.3887+405432, %rax
	jbe	.L344
	leaq	56608(%r12), %rax
	cmpq	$tbuf.3887+405464, %rax
	jb	.L218
.L344:
	vmovss	tbuf.3887+405432(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 56608(%r12)
	vmovss	tbuf.3887+405436(%rip), %xmm0
	vmovss	%xmm0, 56612(%r12)
	.p2align 4,,10
	.p2align 3
.L220:
	vmovaps	tbuf.3887+405440(%rax), %ymm0
	vmovups	%xmm0, 56616(%r12,%rax)
	vextractf128	$0x1, %ymm0, 56632(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L220
	vmovss	tbuf.3887+408544(%rip), %xmm0
	vmovss	%xmm0, 59720(%r12)
	vmovss	tbuf.3887+408548(%rip), %xmm0
	vmovss	%xmm0, 59724(%r12)
	vmovss	tbuf.3887+408552(%rip), %xmm0
	vmovss	%xmm0, 59728(%r12)
	vmovss	tbuf.3887+408556(%rip), %xmm0
	vmovss	%xmm0, 59732(%r12)
	vmovss	tbuf.3887+408560(%rip), %xmm0
	vmovss	%xmm0, 59736(%r12)
	vmovss	tbuf.3887+408564(%rip), %xmm0
	vmovss	%xmm0, 59740(%r12)
.L221:
	leaq	59776(%r12), %rax
	cmpq	$tbuf.3887+411708, %rax
	jbe	.L345
	leaq	59744(%r12), %rax
	cmpq	$tbuf.3887+411740, %rax
	jb	.L223
.L345:
	vmovss	tbuf.3887+411708(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 59744(%r12)
	.p2align 4,,10
	.p2align 3
.L225:
	vmovaps	tbuf.3887+411712(%rax), %ymm0
	vmovups	%xmm0, 59748(%r12,%rax)
	vextractf128	$0x1, %ymm0, 59764(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L225
	vmovss	tbuf.3887+414816(%rip), %xmm0
	vmovss	%xmm0, 62852(%r12)
	vmovss	tbuf.3887+414820(%rip), %xmm0
	vmovss	%xmm0, 62856(%r12)
	vmovss	tbuf.3887+414824(%rip), %xmm0
	vmovss	%xmm0, 62860(%r12)
	vmovss	tbuf.3887+414828(%rip), %xmm0
	vmovss	%xmm0, 62864(%r12)
	vmovss	tbuf.3887+414832(%rip), %xmm0
	vmovss	%xmm0, 62868(%r12)
	vmovss	tbuf.3887+414836(%rip), %xmm0
	vmovss	%xmm0, 62872(%r12)
	vmovss	tbuf.3887+414840(%rip), %xmm0
	vmovss	%xmm0, 62876(%r12)
.L226:
	leaq	62912(%r12), %rax
	cmpq	$tbuf.3887+417984, %rax
	jbe	.L346
	leaq	62880(%r12), %rax
	cmpq	$tbuf.3887+418016, %rax
	jb	.L228
.L346:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L230:
	vmovaps	tbuf.3887+417984(%rax), %ymm0
	vmovups	%xmm0, 62880(%r12,%rax)
	vextractf128	$0x1, %ymm0, 62896(%r12,%rax)
	addq	$32, %rax
	cmpq	$3136, %rax
	jne	.L230
.L231:
	leaq	66048(%r12), %rax
	cmpq	$tbuf.3887+424260, %rax
	jbe	.L347
	leaq	66016(%r12), %rax
	cmpq	$tbuf.3887+424292, %rax
	jb	.L233
.L347:
	vmovss	tbuf.3887+424260(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 66016(%r12)
	vmovss	tbuf.3887+424264(%rip), %xmm0
	vmovss	%xmm0, 66020(%r12)
	vmovss	tbuf.3887+424268(%rip), %xmm0
	vmovss	%xmm0, 66024(%r12)
	vmovss	tbuf.3887+424272(%rip), %xmm0
	vmovss	%xmm0, 66028(%r12)
	vmovss	tbuf.3887+424276(%rip), %xmm0
	vmovss	%xmm0, 66032(%r12)
	vmovss	tbuf.3887+424280(%rip), %xmm0
	vmovss	%xmm0, 66036(%r12)
	vmovss	tbuf.3887+424284(%rip), %xmm0
	vmovss	%xmm0, 66040(%r12)
	.p2align 4,,10
	.p2align 3
.L235:
	vmovaps	tbuf.3887+424288(%rax), %ymm0
	vmovups	%xmm0, 66044(%r12,%rax)
	vextractf128	$0x1, %ymm0, 66060(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L235
	vmovss	tbuf.3887+427392(%rip), %xmm0
	vmovss	%xmm0, 69148(%r12)
.L236:
	leaq	69184(%r12), %rax
	cmpq	$tbuf.3887+430536, %rax
	jbe	.L348
	leaq	69152(%r12), %rax
	cmpq	$tbuf.3887+430568, %rax
	jb	.L238
.L348:
	vmovss	tbuf.3887+430536(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 69152(%r12)
	vmovss	tbuf.3887+430540(%rip), %xmm0
	vmovss	%xmm0, 69156(%r12)
	vmovss	tbuf.3887+430544(%rip), %xmm0
	vmovss	%xmm0, 69160(%r12)
	vmovss	tbuf.3887+430548(%rip), %xmm0
	vmovss	%xmm0, 69164(%r12)
	vmovss	tbuf.3887+430552(%rip), %xmm0
	vmovss	%xmm0, 69168(%r12)
	vmovss	tbuf.3887+430556(%rip), %xmm0
	vmovss	%xmm0, 69172(%r12)
	.p2align 4,,10
	.p2align 3
.L240:
	vmovaps	tbuf.3887+430560(%rax), %ymm0
	vmovups	%xmm0, 69176(%r12,%rax)
	vextractf128	$0x1, %ymm0, 69192(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L240
	vmovss	tbuf.3887+433664(%rip), %xmm0
	vmovss	%xmm0, 72280(%r12)
	vmovss	tbuf.3887+433668(%rip), %xmm0
	vmovss	%xmm0, 72284(%r12)
.L241:
	leaq	72320(%r12), %rax
	cmpq	$tbuf.3887+436812, %rax
	jbe	.L349
	leaq	72288(%r12), %rax
	cmpq	$tbuf.3887+436844, %rax
	jb	.L243
.L349:
	vmovss	tbuf.3887+436812(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 72288(%r12)
	vmovss	tbuf.3887+436816(%rip), %xmm0
	vmovss	%xmm0, 72292(%r12)
	vmovss	tbuf.3887+436820(%rip), %xmm0
	vmovss	%xmm0, 72296(%r12)
	vmovss	tbuf.3887+436824(%rip), %xmm0
	vmovss	%xmm0, 72300(%r12)
	vmovss	tbuf.3887+436828(%rip), %xmm0
	vmovss	%xmm0, 72304(%r12)
	.p2align 4,,10
	.p2align 3
.L245:
	vmovaps	tbuf.3887+436832(%rax), %ymm0
	vmovups	%xmm0, 72308(%r12,%rax)
	vextractf128	$0x1, %ymm0, 72324(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L245
	vmovss	tbuf.3887+439936(%rip), %xmm0
	vmovss	%xmm0, 75412(%r12)
	vmovss	tbuf.3887+439940(%rip), %xmm0
	vmovss	%xmm0, 75416(%r12)
	vmovss	tbuf.3887+439944(%rip), %xmm0
	vmovss	%xmm0, 75420(%r12)
.L246:
	leaq	75456(%r12), %rax
	cmpq	$tbuf.3887+443088, %rax
	jbe	.L350
	leaq	75424(%r12), %rax
	cmpq	$tbuf.3887+443120, %rax
	jb	.L248
.L350:
	vmovss	tbuf.3887+443088(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 75424(%r12)
	vmovss	tbuf.3887+443092(%rip), %xmm0
	vmovss	%xmm0, 75428(%r12)
	vmovss	tbuf.3887+443096(%rip), %xmm0
	vmovss	%xmm0, 75432(%r12)
	vmovss	tbuf.3887+443100(%rip), %xmm0
	vmovss	%xmm0, 75436(%r12)
	.p2align 4,,10
	.p2align 3
.L250:
	vmovaps	tbuf.3887+443104(%rax), %ymm0
	vmovups	%xmm0, 75440(%r12,%rax)
	vextractf128	$0x1, %ymm0, 75456(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L250
	vmovss	tbuf.3887+446208(%rip), %xmm0
	vmovss	%xmm0, 78544(%r12)
	vmovss	tbuf.3887+446212(%rip), %xmm0
	vmovss	%xmm0, 78548(%r12)
	vmovss	tbuf.3887+446216(%rip), %xmm0
	vmovss	%xmm0, 78552(%r12)
	vmovss	tbuf.3887+446220(%rip), %xmm0
	vmovss	%xmm0, 78556(%r12)
.L251:
	leaq	78592(%r12), %rax
	cmpq	$tbuf.3887+449364, %rax
	jbe	.L351
	leaq	78560(%r12), %rax
	cmpq	$tbuf.3887+449396, %rax
	jb	.L253
.L351:
	vmovss	tbuf.3887+449364(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 78560(%r12)
	vmovss	tbuf.3887+449368(%rip), %xmm0
	vmovss	%xmm0, 78564(%r12)
	vmovss	tbuf.3887+449372(%rip), %xmm0
	vmovss	%xmm0, 78568(%r12)
	.p2align 4,,10
	.p2align 3
.L255:
	vmovaps	tbuf.3887+449376(%rax), %ymm0
	vmovups	%xmm0, 78572(%r12,%rax)
	vextractf128	$0x1, %ymm0, 78588(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L255
	vmovss	tbuf.3887+452480(%rip), %xmm0
	vmovss	%xmm0, 81676(%r12)
	vmovss	tbuf.3887+452484(%rip), %xmm0
	vmovss	%xmm0, 81680(%r12)
	vmovss	tbuf.3887+452488(%rip), %xmm0
	vmovss	%xmm0, 81684(%r12)
	vmovss	tbuf.3887+452492(%rip), %xmm0
	vmovss	%xmm0, 81688(%r12)
	vmovss	tbuf.3887+452496(%rip), %xmm0
	vmovss	%xmm0, 81692(%r12)
.L256:
	leaq	81728(%r12), %rax
	cmpq	$tbuf.3887+455640, %rax
	jbe	.L352
	leaq	81696(%r12), %rax
	cmpq	$tbuf.3887+455672, %rax
	jb	.L258
.L352:
	vmovss	tbuf.3887+455640(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 81696(%r12)
	vmovss	tbuf.3887+455644(%rip), %xmm0
	vmovss	%xmm0, 81700(%r12)
	.p2align 4,,10
	.p2align 3
.L260:
	vmovaps	tbuf.3887+455648(%rax), %ymm0
	vmovups	%xmm0, 81704(%r12,%rax)
	vextractf128	$0x1, %ymm0, 81720(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L260
	vmovss	tbuf.3887+458752(%rip), %xmm0
	vmovss	%xmm0, 84808(%r12)
	vmovss	tbuf.3887+458756(%rip), %xmm0
	vmovss	%xmm0, 84812(%r12)
	vmovss	tbuf.3887+458760(%rip), %xmm0
	vmovss	%xmm0, 84816(%r12)
	vmovss	tbuf.3887+458764(%rip), %xmm0
	vmovss	%xmm0, 84820(%r12)
	vmovss	tbuf.3887+458768(%rip), %xmm0
	vmovss	%xmm0, 84824(%r12)
	vmovss	tbuf.3887+458772(%rip), %xmm0
	vmovss	%xmm0, 84828(%r12)
.L261:
	leaq	84864(%r12), %rax
	cmpq	$tbuf.3887+461916, %rax
	jbe	.L353
	leaq	84832(%r12), %rax
	cmpq	$tbuf.3887+461948, %rax
	jb	.L263
.L353:
	vmovss	tbuf.3887+461916(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 84832(%r12)
	.p2align 4,,10
	.p2align 3
.L265:
	vmovaps	tbuf.3887+461920(%rax), %ymm0
	vmovups	%xmm0, 84836(%r12,%rax)
	vextractf128	$0x1, %ymm0, 84852(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L265
	vmovss	tbuf.3887+465024(%rip), %xmm0
	vmovss	%xmm0, 87940(%r12)
	vmovss	tbuf.3887+465028(%rip), %xmm0
	vmovss	%xmm0, 87944(%r12)
	vmovss	tbuf.3887+465032(%rip), %xmm0
	vmovss	%xmm0, 87948(%r12)
	vmovss	tbuf.3887+465036(%rip), %xmm0
	vmovss	%xmm0, 87952(%r12)
	vmovss	tbuf.3887+465040(%rip), %xmm0
	vmovss	%xmm0, 87956(%r12)
	vmovss	tbuf.3887+465044(%rip), %xmm0
	vmovss	%xmm0, 87960(%r12)
	vmovss	tbuf.3887+465048(%rip), %xmm0
	vmovss	%xmm0, 87964(%r12)
.L266:
	leaq	88000(%r12), %rax
	cmpq	$tbuf.3887+468192, %rax
	jbe	.L354
	leaq	87968(%r12), %rax
	cmpq	$tbuf.3887+468224, %rax
	jb	.L268
.L354:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L270:
	vmovaps	tbuf.3887+468192(%rax), %ymm0
	vmovups	%xmm0, 87968(%r12,%rax)
	vextractf128	$0x1, %ymm0, 87984(%r12,%rax)
	addq	$32, %rax
	cmpq	$3136, %rax
	jne	.L270
.L271:
	leaq	91136(%r12), %rax
	cmpq	$tbuf.3887+474468, %rax
	jbe	.L355
	leaq	91104(%r12), %rax
	cmpq	$tbuf.3887+474500, %rax
	jb	.L273
.L355:
	vmovss	tbuf.3887+474468(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 91104(%r12)
	vmovss	tbuf.3887+474472(%rip), %xmm0
	vmovss	%xmm0, 91108(%r12)
	vmovss	tbuf.3887+474476(%rip), %xmm0
	vmovss	%xmm0, 91112(%r12)
	vmovss	tbuf.3887+474480(%rip), %xmm0
	vmovss	%xmm0, 91116(%r12)
	vmovss	tbuf.3887+474484(%rip), %xmm0
	vmovss	%xmm0, 91120(%r12)
	vmovss	tbuf.3887+474488(%rip), %xmm0
	vmovss	%xmm0, 91124(%r12)
	vmovss	tbuf.3887+474492(%rip), %xmm0
	vmovss	%xmm0, 91128(%r12)
	.p2align 4,,10
	.p2align 3
.L275:
	vmovaps	tbuf.3887+474496(%rax), %ymm0
	vmovups	%xmm0, 91132(%r12,%rax)
	vextractf128	$0x1, %ymm0, 91148(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L275
	vmovss	tbuf.3887+477600(%rip), %xmm0
	vmovss	%xmm0, 94236(%r12)
.L276:
	leaq	94272(%r12), %rax
	cmpq	$tbuf.3887+480744, %rax
	jbe	.L356
	leaq	94240(%r12), %rax
	cmpq	$tbuf.3887+480776, %rax
	jb	.L278
.L356:
	vmovss	tbuf.3887+480744(%rip), %xmm0
	xorl	%eax, %eax
	vmovss	%xmm0, 94240(%r12)
	vmovss	tbuf.3887+480748(%rip), %xmm0
	vmovss	%xmm0, 94244(%r12)
	vmovss	tbuf.3887+480752(%rip), %xmm0
	vmovss	%xmm0, 94248(%r12)
	vmovss	tbuf.3887+480756(%rip), %xmm0
	vmovss	%xmm0, 94252(%r12)
	vmovss	tbuf.3887+480760(%rip), %xmm0
	vmovss	%xmm0, 94256(%r12)
	vmovss	tbuf.3887+480764(%rip), %xmm0
	vmovss	%xmm0, 94260(%r12)
	.p2align 4,,10
	.p2align 3
.L280:
	vmovaps	tbuf.3887+480768(%rax), %ymm0
	vmovups	%xmm0, 94264(%r12,%rax)
	vextractf128	$0x1, %ymm0, 94280(%r12,%rax)
	addq	$32, %rax
	cmpq	$3104, %rax
	jne	.L280
	vmovss	tbuf.3887+483872(%rip), %xmm0
	vmovss	%xmm0, 97368(%r12)
	vmovss	tbuf.3887+483876(%rip), %xmm0
	vmovss	%xmm0, 97372(%r12)
.L281:
	leaq	97408(%r12), %rax
	cmpq	$tbuf.3887+293204, %rax
	jbe	.L357
	leaq	97376(%r12), %rax
	cmpq	$tbuf.3887+293236, %rax
	jb	.L283
.L357:
	vmovss	tbuf.3887+293204(%rip), %xmm0
	vmovss	%xmm0, 97376(%r12)
	vmovss	tbuf.3887+293208(%rip), %xmm0
	vmovss	%xmm0, 97380(%r12)
	vmovss	tbuf.3887+293212(%rip), %xmm0
	vmovss	%xmm0, 97384(%r12)
	vmovaps	tbuf.3887+293216(%rip), %ymm0
	vmovups	%xmm0, 97388(%r12)
	vextractf128	$0x1, %ymm0, 97404(%r12)
	vmovaps	tbuf.3887+293248(%rip), %ymm0
	vmovups	%xmm0, 97420(%r12)
	vextractf128	$0x1, %ymm0, 97436(%r12)
	vmovaps	tbuf.3887+293280(%rip), %ymm0
	vmovups	%xmm0, 97452(%r12)
	vextractf128	$0x1, %ymm0, 97468(%r12)
	vmovss	tbuf.3887+293312(%rip), %xmm0
	vmovss	%xmm0, 97484(%r12)
	vmovss	tbuf.3887+293316(%rip), %xmm0
	vmovss	%xmm0, 97488(%r12)
	vmovss	tbuf.3887+293320(%rip), %xmm0
	vmovss	%xmm0, 97492(%r12)
.L285:
	leaq	97528(%r12), %rax
	cmpq	$tbuf.3887+293448, %rax
	jbe	.L358
	leaq	97496(%r12), %rax
	cmpq	$tbuf.3887+293480, %rax
	jb	.L287
.L358:
	vmovss	tbuf.3887+293448(%rip), %xmm0
	vmovss	%xmm0, 97496(%r12)
	vmovss	tbuf.3887+293452(%rip), %xmm0
	vmovss	%xmm0, 97500(%r12)
	vmovss	tbuf.3887+293456(%rip), %xmm0
	vmovss	%xmm0, 97504(%r12)
	vmovss	tbuf.3887+293460(%rip), %xmm0
	vmovss	%xmm0, 97508(%r12)
	vmovss	tbuf.3887+293464(%rip), %xmm0
	vmovss	%xmm0, 97512(%r12)
	vmovss	tbuf.3887+293468(%rip), %xmm0
	vmovss	%xmm0, 97516(%r12)
	vmovaps	tbuf.3887+293472(%rip), %ymm0
	vmovups	%xmm0, 97520(%r12)
	vextractf128	$0x1, %ymm0, 97536(%r12)
	vmovaps	tbuf.3887+293504(%rip), %ymm0
	vmovups	%xmm0, 97552(%r12)
	vextractf128	$0x1, %ymm0, 97568(%r12)
	vmovaps	tbuf.3887+293536(%rip), %ymm0
	vmovups	%xmm0, 97584(%r12)
	vextractf128	$0x1, %ymm0, 97600(%r12)
.L289:
	leaq	97648(%r12), %rax
	cmpq	$tbuf.3887+293692, %rax
	jbe	.L359
	leaq	97616(%r12), %rax
	cmpq	$tbuf.3887+293724, %rax
	jb	.L291
.L359:
	vmovss	tbuf.3887+293692(%rip), %xmm0
	vmovss	%xmm0, 97616(%r12)
	vmovaps	tbuf.3887+293696(%rip), %ymm0
	vmovups	%xmm0, 97620(%r12)
	vextractf128	$0x1, %ymm0, 97636(%r12)
	vmovaps	tbuf.3887+293728(%rip), %ymm0
	vmovups	%xmm0, 97652(%r12)
	vextractf128	$0x1, %ymm0, 97668(%r12)
	vmovaps	tbuf.3887+293760(%rip), %ymm0
	vmovups	%xmm0, 97684(%r12)
	vextractf128	$0x1, %ymm0, 97700(%r12)
	vmovss	tbuf.3887+293792(%rip), %xmm0
	vmovss	%xmm0, 97716(%r12)
	vmovss	tbuf.3887+293796(%rip), %xmm0
	vmovss	%xmm0, 97720(%r12)
	vmovss	tbuf.3887+293800(%rip), %xmm0
	vmovss	%xmm0, 97724(%r12)
	vmovss	tbuf.3887+293804(%rip), %xmm0
	vmovss	%xmm0, 97728(%r12)
	vmovss	tbuf.3887+293808(%rip), %xmm0
	vmovss	%xmm0, 97732(%r12)
.L293:
	leaq	97768(%r12), %rax
	cmpq	$tbuf.3887+293936, %rax
	jbe	.L360
	leaq	97736(%r12), %rax
	cmpq	$tbuf.3887+293968, %rax
	jb	.L295
.L360:
	vmovss	tbuf.3887+293936(%rip), %xmm0
	vmovss	%xmm0, 97736(%r12)
	vmovss	tbuf.3887+293940(%rip), %xmm0
	vmovss	%xmm0, 97740(%r12)
	vmovss	tbuf.3887+293944(%rip), %xmm0
	vmovss	%xmm0, 97744(%r12)
	vmovss	tbuf.3887+293948(%rip), %xmm0
	vmovss	%xmm0, 97748(%r12)
	vmovaps	tbuf.3887+293952(%rip), %ymm0
	vmovups	%xmm0, 97752(%r12)
	vextractf128	$0x1, %ymm0, 97768(%r12)
	vmovaps	tbuf.3887+293984(%rip), %ymm0
	vmovups	%xmm0, 97784(%r12)
	vextractf128	$0x1, %ymm0, 97800(%r12)
	vmovaps	tbuf.3887+294016(%rip), %ymm0
	vmovups	%xmm0, 97816(%r12)
	vextractf128	$0x1, %ymm0, 97832(%r12)
	vmovss	tbuf.3887+294048(%rip), %xmm0
	vmovss	%xmm0, 97848(%r12)
	vmovss	tbuf.3887+294052(%rip), %xmm0
	vmovss	%xmm0, 97852(%r12)
.L297:
	leaq	97888(%r12), %rax
	cmpq	$tbuf.3887+294180, %rax
	jbe	.L361
	leaq	97856(%r12), %rax
	cmpq	$tbuf.3887+294212, %rax
	jb	.L299
.L361:
	vmovss	tbuf.3887+294180(%rip), %xmm0
	vmovss	%xmm0, 97856(%r12)
	vmovss	tbuf.3887+294184(%rip), %xmm0
	vmovss	%xmm0, 97860(%r12)
	vmovss	tbuf.3887+294188(%rip), %xmm0
	vmovss	%xmm0, 97864(%r12)
	vmovss	tbuf.3887+294192(%rip), %xmm0
	vmovss	%xmm0, 97868(%r12)
	vmovss	tbuf.3887+294196(%rip), %xmm0
	vmovss	%xmm0, 97872(%r12)
	vmovss	tbuf.3887+294200(%rip), %xmm0
	vmovss	%xmm0, 97876(%r12)
	vmovss	tbuf.3887+294204(%rip), %xmm0
	vmovss	%xmm0, 97880(%r12)
	vmovaps	tbuf.3887+294208(%rip), %ymm0
	vmovups	%xmm0, 97884(%r12)
	vextractf128	$0x1, %ymm0, 97900(%r12)
	vmovaps	tbuf.3887+294240(%rip), %ymm0
	vmovups	%xmm0, 97916(%r12)
	vextractf128	$0x1, %ymm0, 97932(%r12)
	vmovss	tbuf.3887+294272(%rip), %xmm0
	vmovss	%xmm0, 97948(%r12)
	vmovss	tbuf.3887+294276(%rip), %xmm0
	vmovss	%xmm0, 97952(%r12)
	vmovss	tbuf.3887+294280(%rip), %xmm0
	vmovss	%xmm0, 97956(%r12)
	vmovss	tbuf.3887+294284(%rip), %xmm0
	vmovss	%xmm0, 97960(%r12)
	vmovss	tbuf.3887+294288(%rip), %xmm0
	vmovss	%xmm0, 97964(%r12)
	vmovss	tbuf.3887+294292(%rip), %xmm0
	vmovss	%xmm0, 97968(%r12)
	vmovss	tbuf.3887+294296(%rip), %xmm0
	vmovss	%xmm0, 97972(%r12)
.L301:
	leaq	98008(%r12), %rax
	cmpq	$tbuf.3887+294424, %rax
	jbe	.L362
	leaq	97976(%r12), %rax
	cmpq	$tbuf.3887+294456, %rax
	jb	.L303
.L362:
	vmovss	tbuf.3887+294424(%rip), %xmm0
	vmovss	%xmm0, 97976(%r12)
	vmovss	tbuf.3887+294428(%rip), %xmm0
	vmovss	%xmm0, 97980(%r12)
	vmovaps	tbuf.3887+294432(%rip), %ymm0
	vmovups	%xmm0, 97984(%r12)
	vextractf128	$0x1, %ymm0, 98000(%r12)
	vmovaps	tbuf.3887+294464(%rip), %ymm0
	vmovups	%xmm0, 98016(%r12)
	vextractf128	$0x1, %ymm0, 98032(%r12)
	vmovaps	tbuf.3887+294496(%rip), %ymm0
	vmovups	%xmm0, 98048(%r12)
	vextractf128	$0x1, %ymm0, 98064(%r12)
	vmovss	tbuf.3887+294528(%rip), %xmm0
	vmovss	%xmm0, 98080(%r12)
	vmovss	tbuf.3887+294532(%rip), %xmm0
	vmovss	%xmm0, 98084(%r12)
	vmovss	tbuf.3887+294536(%rip), %xmm0
	vmovss	%xmm0, 98088(%r12)
	vmovss	tbuf.3887+294540(%rip), %xmm0
	vmovss	%xmm0, 98092(%r12)
.L305:
	leaq	98128(%r12), %rax
	cmpq	$tbuf.3887+294668, %rax
	jbe	.L363
	leaq	98096(%r12), %rax
	cmpq	$tbuf.3887+294700, %rax
	jb	.L307
.L363:
	vmovss	tbuf.3887+294668(%rip), %xmm0
	vmovss	%xmm0, 98096(%r12)
	vmovss	tbuf.3887+294672(%rip), %xmm0
	vmovss	%xmm0, 98100(%r12)
	vmovss	tbuf.3887+294676(%rip), %xmm0
	vmovss	%xmm0, 98104(%r12)
	vmovss	tbuf.3887+294680(%rip), %xmm0
	vmovss	%xmm0, 98108(%r12)
	vmovss	tbuf.3887+294684(%rip), %xmm0
	vmovss	%xmm0, 98112(%r12)
	vmovaps	tbuf.3887+294688(%rip), %ymm0
	vmovups	%xmm0, 98116(%r12)
	vextractf128	$0x1, %ymm0, 98132(%r12)
	vmovaps	tbuf.3887+294720(%rip), %ymm0
	vmovups	%xmm0, 98148(%r12)
	vextractf128	$0x1, %ymm0, 98164(%r12)
	vmovaps	tbuf.3887+294752(%rip), %ymm0
	vmovups	%xmm0, 98180(%r12)
	vextractf128	$0x1, %ymm0, 98196(%r12)
	vmovss	tbuf.3887+294784(%rip), %xmm0
	vmovss	%xmm0, 98212(%r12)
.L309:
	leaq	98248(%r12), %rax
	cmpq	$tbuf.3887+294912, %rax
	jbe	.L364
	leaq	98216(%r12), %rax
	cmpq	$tbuf.3887+294944, %rax
	jb	.L311
.L364:
	vmovaps	tbuf.3887+294912(%rip), %ymm0
	vmovups	%xmm0, 98216(%r12)
	vextractf128	$0x1, %ymm0, 98232(%r12)
	vmovaps	tbuf.3887+294944(%rip), %ymm0
	vmovups	%xmm0, 98248(%r12)
	vextractf128	$0x1, %ymm0, 98264(%r12)
	vmovaps	tbuf.3887+294976(%rip), %ymm0
	vmovups	%xmm0, 98280(%r12)
	vextractf128	$0x1, %ymm0, 98296(%r12)
	vmovss	tbuf.3887+295008(%rip), %xmm0
	vmovss	%xmm0, 98312(%r12)
	vmovss	tbuf.3887+295012(%rip), %xmm0
	vmovss	%xmm0, 98316(%r12)
	vmovss	tbuf.3887+295016(%rip), %xmm0
	vmovss	%xmm0, 98320(%r12)
	vmovss	tbuf.3887+295020(%rip), %xmm0
	vmovss	%xmm0, 98324(%r12)
	vmovss	tbuf.3887+295024(%rip), %xmm0
	vmovss	%xmm0, 98328(%r12)
	vmovss	tbuf.3887+295028(%rip), %xmm0
	vmovss	%xmm0, 98332(%r12)
.L313:
	leaq	98368(%r12), %rax
	cmpq	$tbuf.3887+295156, %rax
	jbe	.L365
	leaq	98336(%r12), %rax
	cmpq	$tbuf.3887+295188, %rax
	jb	.L315
.L365:
	vmovss	tbuf.3887+295156(%rip), %xmm0
	vmovss	%xmm0, 98336(%r12)
	vmovss	tbuf.3887+295160(%rip), %xmm0
	vmovss	%xmm0, 98340(%r12)
	vmovss	tbuf.3887+295164(%rip), %xmm0
	vmovss	%xmm0, 98344(%r12)
	vmovaps	tbuf.3887+295168(%rip), %ymm0
	vmovups	%xmm0, 98348(%r12)
	vextractf128	$0x1, %ymm0, 98364(%r12)
	vmovaps	tbuf.3887+295200(%rip), %ymm0
	vmovups	%xmm0, 98380(%r12)
	vextractf128	$0x1, %ymm0, 98396(%r12)
	vmovaps	tbuf.3887+295232(%rip), %ymm0
	vmovups	%xmm0, 98412(%r12)
	vextractf128	$0x1, %ymm0, 98428(%r12)
	vmovss	tbuf.3887+295264(%rip), %xmm0
	vmovss	%xmm0, 98444(%r12)
	vmovss	tbuf.3887+295268(%rip), %xmm0
	vmovss	%xmm0, 98448(%r12)
	vmovss	tbuf.3887+295272(%rip), %xmm0
	vmovss	%xmm0, 98452(%r12)
.L317:
	leaq	98456(%r12), %rax
	cmpq	$tbuf.3887+295432, %rax
	jnb	.L366
	leaq	98488(%r12), %rax
	cmpq	$tbuf.3887+295400, %rax
	ja	.L319
.L366:
	vmovss	tbuf.3887+295400(%rip), %xmm0
	vmovss	%xmm0, 98456(%r12)
	vmovss	tbuf.3887+295404(%rip), %xmm0
	vmovss	%xmm0, 98460(%r12)
	vmovss	tbuf.3887+295408(%rip), %xmm0
	vmovss	%xmm0, 98464(%r12)
	vmovss	tbuf.3887+295412(%rip), %xmm0
	vmovss	%xmm0, 98468(%r12)
	vmovss	tbuf.3887+295416(%rip), %xmm0
	vmovss	%xmm0, 98472(%r12)
	vmovss	tbuf.3887+295420(%rip), %xmm0
	vmovss	%xmm0, 98476(%r12)
	vmovaps	tbuf.3887+295424(%rip), %ymm0
	vmovups	%xmm0, 98480(%r12)
	vextractf128	$0x1, %ymm0, 98496(%r12)
	vmovaps	tbuf.3887+295456(%rip), %ymm0
	vmovups	%xmm0, 98512(%r12)
	vextractf128	$0x1, %ymm0, 98528(%r12)
	vmovss	tbuf.3887+295488(%rip), %xmm0
	vmovss	%xmm0, 98544(%r12)
	vmovss	tbuf.3887+295492(%rip), %xmm0
	vmovss	%xmm0, 98548(%r12)
	vmovss	tbuf.3887+295496(%rip), %xmm0
	vmovss	%xmm0, 98552(%r12)
	vmovss	tbuf.3887+295500(%rip), %xmm0
	vmovss	%xmm0, 98556(%r12)
	vmovss	tbuf.3887+295504(%rip), %xmm0
	vmovss	%xmm0, 98560(%r12)
	vmovss	tbuf.3887+295508(%rip), %xmm0
	vmovss	%xmm0, 98564(%r12)
	vmovss	tbuf.3887+295512(%rip), %xmm0
	vmovss	%xmm0, 98568(%r12)
.L321:
	vmovss	tbuf.3887+295516(%rip), %xmm0
	vmovss	%xmm0, 98572(%r12)
	vzeroupper
	addq	$64, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L2:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	vmovss	3136(%r12,%rax,4), %xmm0
	vmovss	%xmm0, tbuf.3887+3176(,%rax,4)
	addq	$1, %rax
	cmpq	$23860, %rax
	jne	.L6
	jmp	.L5
.L148:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L152:
	vmovss	tbuf.3887+317568(,%rax,4), %xmm0
	vmovss	%xmm0, 12704(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L152
	jmp	.L151
.L188:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L192:
	vmovss	tbuf.3887+367776(,%rax,4), %xmm0
	vmovss	%xmm0, 37792(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L192
	jmp	.L191
.L228:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L232:
	vmovss	tbuf.3887+417984(,%rax,4), %xmm0
	vmovss	%xmm0, 62880(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L232
	jmp	.L231
.L268:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L272:
	vmovss	tbuf.3887+468192(,%rax,4), %xmm0
	vmovss	%xmm0, 87968(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L272
	jmp	.L271
.L51:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L54:
	vmovss	293492(%rbx,%rax,4), %xmm0
	vmovss	%xmm0, tbuf.3887+290196(,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L54
	jmp	.L53
.L126:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L129:
	vmovss	tbuf.3887+484000(,%rax,4), %xmm0
	vmovss	%xmm0, 3136(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L129
	jmp	.L128
.L130:
	vmovss	tbuf.3887+295560(%rip), %xmm0
	vmovss	%xmm0, 3256(%r12)
	vmovss	tbuf.3887+295564(%rip), %xmm0
	vmovss	%xmm0, 3260(%r12)
	vmovss	tbuf.3887+295568(%rip), %xmm0
	vmovss	%xmm0, 3264(%r12)
	vmovss	tbuf.3887+295572(%rip), %xmm0
	vmovss	%xmm0, 3268(%r12)
	vmovss	tbuf.3887+295576(%rip), %xmm0
	vmovss	%xmm0, 3272(%r12)
	vmovss	tbuf.3887+295580(%rip), %xmm0
	vmovss	%xmm0, 3276(%r12)
	vmovss	tbuf.3887+295584(%rip), %xmm0
	vmovss	%xmm0, 3280(%r12)
	vmovss	tbuf.3887+295588(%rip), %xmm0
	vmovss	%xmm0, 3284(%r12)
	vmovss	tbuf.3887+295592(%rip), %xmm0
	vmovss	%xmm0, 3288(%r12)
	vmovss	tbuf.3887+295596(%rip), %xmm0
	vmovss	%xmm0, 3292(%r12)
	jmp	.L132
.L133:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L137:
	vmovss	tbuf.3887+298740(,%rax,4), %xmm0
	vmovss	%xmm0, 3296(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L137
	jmp	.L136
.L138:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L142:
	vmovss	tbuf.3887+305016(,%rax,4), %xmm0
	vmovss	%xmm0, 6432(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L142
	jmp	.L141
.L143:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L147:
	vmovss	tbuf.3887+311292(,%rax,4), %xmm0
	vmovss	%xmm0, 9568(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L147
	jmp	.L146
.L153:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L157:
	vmovss	tbuf.3887+323844(,%rax,4), %xmm0
	vmovss	%xmm0, 15840(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L157
	jmp	.L156
.L291:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L294:
	vmovss	tbuf.3887+293692(,%rax,4), %xmm0
	vmovss	%xmm0, 97616(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L294
	jmp	.L293
.L295:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L298:
	vmovss	tbuf.3887+293936(,%rax,4), %xmm0
	vmovss	%xmm0, 97736(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L298
	jmp	.L297
.L299:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L302:
	vmovss	tbuf.3887+294180(,%rax,4), %xmm0
	vmovss	%xmm0, 97856(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L302
	jmp	.L301
.L303:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L306:
	vmovss	tbuf.3887+294424(,%rax,4), %xmm0
	vmovss	%xmm0, 97976(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L306
	jmp	.L305
.L307:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L310:
	vmovss	tbuf.3887+294668(,%rax,4), %xmm0
	vmovss	%xmm0, 98096(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L310
	jmp	.L309
.L311:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L314:
	vmovss	tbuf.3887+294912(,%rax,4), %xmm0
	vmovss	%xmm0, 98216(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L314
	jmp	.L313
.L315:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L318:
	vmovss	tbuf.3887+295156(,%rax,4), %xmm0
	vmovss	%xmm0, 98336(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L318
	jmp	.L317
.L319:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L322:
	vmovss	tbuf.3887+295400(,%rax,4), %xmm0
	vmovss	%xmm0, 98456(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$29, %rax
	jne	.L322
	jmp	.L321
.L158:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L162:
	vmovss	tbuf.3887+330120(,%rax,4), %xmm0
	vmovss	%xmm0, 18976(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L162
	jmp	.L161
.L163:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L167:
	vmovss	tbuf.3887+336396(,%rax,4), %xmm0
	vmovss	%xmm0, 22112(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L167
	jmp	.L166
.L168:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L172:
	vmovss	tbuf.3887+342672(,%rax,4), %xmm0
	vmovss	%xmm0, 25248(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L172
	jmp	.L171
.L173:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L177:
	vmovss	tbuf.3887+348948(,%rax,4), %xmm0
	vmovss	%xmm0, 28384(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L177
	jmp	.L176
.L178:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L182:
	vmovss	tbuf.3887+355224(,%rax,4), %xmm0
	vmovss	%xmm0, 31520(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L182
	jmp	.L181
.L183:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L187:
	vmovss	tbuf.3887+361500(,%rax,4), %xmm0
	vmovss	%xmm0, 34656(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L187
	jmp	.L186
.L193:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L197:
	vmovss	tbuf.3887+374052(,%rax,4), %xmm0
	vmovss	%xmm0, 40928(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L197
	jmp	.L196
.L198:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L202:
	vmovss	tbuf.3887+380328(,%rax,4), %xmm0
	vmovss	%xmm0, 44064(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L202
	jmp	.L201
.L203:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L207:
	vmovss	tbuf.3887+386604(,%rax,4), %xmm0
	vmovss	%xmm0, 47200(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L207
	jmp	.L206
.L208:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L212:
	vmovss	tbuf.3887+392880(,%rax,4), %xmm0
	vmovss	%xmm0, 50336(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L212
	jmp	.L211
.L213:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L217:
	vmovss	tbuf.3887+399156(,%rax,4), %xmm0
	vmovss	%xmm0, 53472(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L217
	jmp	.L216
.L218:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L222:
	vmovss	tbuf.3887+405432(,%rax,4), %xmm0
	vmovss	%xmm0, 56608(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L222
	jmp	.L221
.L223:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L227:
	vmovss	tbuf.3887+411708(,%rax,4), %xmm0
	vmovss	%xmm0, 59744(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L227
	jmp	.L226
.L233:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L237:
	vmovss	tbuf.3887+424260(,%rax,4), %xmm0
	vmovss	%xmm0, 66016(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L237
	jmp	.L236
.L238:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L242:
	vmovss	tbuf.3887+430536(,%rax,4), %xmm0
	vmovss	%xmm0, 69152(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L242
	jmp	.L241
.L243:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L247:
	vmovss	tbuf.3887+436812(,%rax,4), %xmm0
	vmovss	%xmm0, 72288(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L247
	jmp	.L246
.L248:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L252:
	vmovss	tbuf.3887+443088(,%rax,4), %xmm0
	vmovss	%xmm0, 75424(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L252
	jmp	.L251
.L253:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L257:
	vmovss	tbuf.3887+449364(,%rax,4), %xmm0
	vmovss	%xmm0, 78560(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L257
	jmp	.L256
.L258:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L262:
	vmovss	tbuf.3887+455640(,%rax,4), %xmm0
	vmovss	%xmm0, 81696(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L262
	jmp	.L261
.L263:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L267:
	vmovss	tbuf.3887+461916(,%rax,4), %xmm0
	vmovss	%xmm0, 84832(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L267
	jmp	.L266
.L273:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L277:
	vmovss	tbuf.3887+474468(,%rax,4), %xmm0
	vmovss	%xmm0, 91104(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L277
	jmp	.L276
.L278:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L282:
	vmovss	tbuf.3887+480744(,%rax,4), %xmm0
	vmovss	%xmm0, 94240(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$784, %rax
	jne	.L282
	jmp	.L281
.L283:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L286:
	vmovss	tbuf.3887+293204(,%rax,4), %xmm0
	vmovss	%xmm0, 97376(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L286
	jmp	.L285
.L287:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L290:
	vmovss	tbuf.3887+293448(,%rax,4), %xmm0
	vmovss	%xmm0, 97496(%r12,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L290
	jmp	.L289
	.cfi_endproc
.LFE14:
	.size	kern0, .-kern0
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	kern1
	.type	kern1, @function
kern1:
.LFB15:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rdi, %r8
	movq	%rsi, %rax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rcx, %rbx
	movl	$392, %ecx
	subq	$32, %rsp
	movq	%rdx, -64(%rbp)
	movl	$tbuf.5050, %edx
	movq	%rdx, %rdi
	leaq	3136(%r8), %rdx
	rep movsq
	cmpq	$tbuf.5050+3168, %rdx
	jnb	.L730
	leaq	3168(%r8), %rdx
	cmpq	$tbuf.5050+3136, %rdx
	ja	.L559
.L730:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L561:
	vmovups	3136(%r8,%rdx), %xmm0
	vinsertf128	$0x1, 3152(%r8,%rdx), %ymm0, %ymm0
	addq	$32, %rdx
	vmovaps	%ymm0, tbuf.5050+3104(%rdx)
	cmpq	$95424, %rdx
	jne	.L561
	vmovss	98560(%r8), %xmm0
	vmovss	%xmm0, tbuf.5050+98560(%rip)
	vmovss	98564(%r8), %xmm0
	vmovss	%xmm0, tbuf.5050+98564(%rip)
	vmovss	98568(%r8), %xmm0
	vmovss	%xmm0, tbuf.5050+98568(%rip)
	vmovss	98572(%r8), %xmm0
	vmovss	%xmm0, tbuf.5050+98572(%rip)
	vzeroupper
.L562:
	vmovss	98576(%rbx), %xmm0
	movl	$tbuf.5050+3304, %edx
	vmovss	%xmm0, tbuf.5050+98576(%rip)
	vmovss	(%rax), %xmm0
	movl	$tbuf.5050+98636, %eax
	vshufps	$0, %xmm0, %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+98580(%rip)
	vmovss	%xmm0, tbuf.5050+98584(%rip)
	vmovss	%xmm0, tbuf.5050+98588(%rip)
	vmovaps	%xmm1, tbuf.5050+98592(%rip)
	vmovss	%xmm0, tbuf.5050+98608(%rip)
	vmovss	%xmm0, tbuf.5050+98612(%rip)
	vmovss	tbuf.5050+3296(%rip), %xmm1
	vmulss	tbuf.5050(%rip), %xmm1, %xmm1
	vmovss	%xmm0, tbuf.5050+98616(%rip)
	vmovss	101876(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+98620(%rip)
	vmovss	%xmm1, tbuf.5050+98624(%rip)
	vaddss	%xmm1, %xmm0, %xmm1
	vmovss	tbuf.5050+3300(%rip), %xmm0
	vmulss	tbuf.5050+4(%rip), %xmm0, %xmm0
	vmovss	%xmm1, tbuf.5050+98628(%rip)
	vmovss	%xmm0, tbuf.5050+98632(%rip)
.L564:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-3300(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+104892, %rax
	jne	.L564
	vmovss	tbuf.5050+104884(%rip), %xmm0
	movl	$tbuf.5050+104904, %eax
	vaddss	tbuf.5050+104888(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+6436, %edx
	movl	$tbuf.5050+111168, %ecx
	vmovss	%xmm0, tbuf.5050+104892(%rip)
	vmovss	tbuf.5050+6432(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	108152(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+104896(%rip)
	vmovss	%xmm0, tbuf.5050+104900(%rip)
.L565:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-6436(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+111168, %rax
	jne	.L565
	vmovss	tbuf.5050+111160(%rip), %xmm0
	movl	$tbuf.5050+9572, %r15d
	vaddss	tbuf.5050+111164(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+111180, %eax
	movl	$tbuf.5050+117444, %edi
	movq	%r15, %rsi
	vmovss	%xmm0, tbuf.5050+111168(%rip)
	vmovss	tbuf.5050+9568(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	114428(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+111172(%rip)
	vmovss	%xmm0, tbuf.5050+111176(%rip)
.L566:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-9572(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L566
	vmovss	tbuf.5050+117436(%rip), %xmm0
	movl	$tbuf.5050+117456, %eax
	vaddss	tbuf.5050+117440(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+12708, %esi
	movl	$tbuf.5050+123720, %edi
	vmovss	%xmm0, tbuf.5050+117444(%rip)
	vmovss	tbuf.5050+12704(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	120704(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+117448(%rip)
	vmovss	%xmm0, tbuf.5050+117452(%rip)
.L567:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-12708(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L567
	vmovss	tbuf.5050+123712(%rip), %xmm0
	movl	$tbuf.5050+123732, %eax
	vaddss	tbuf.5050+123716(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+15844, %esi
	movl	$tbuf.5050+129996, %edi
	vmovss	%xmm0, tbuf.5050+123720(%rip)
	vmovss	tbuf.5050+15840(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	126980(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+123724(%rip)
	vmovss	%xmm0, tbuf.5050+123728(%rip)
.L568:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-15844(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L568
	vmovss	tbuf.5050+129988(%rip), %xmm0
	movl	$tbuf.5050+130008, %eax
	vaddss	tbuf.5050+129992(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+18980, %esi
	movl	$tbuf.5050+136272, %edi
	vmovss	%xmm0, tbuf.5050+129996(%rip)
	vmovss	tbuf.5050+18976(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	133256(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+130000(%rip)
	vmovss	%xmm0, tbuf.5050+130004(%rip)
.L569:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-18980(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L569
	vmovss	tbuf.5050+136264(%rip), %xmm0
	movl	$tbuf.5050+136284, %eax
	vaddss	tbuf.5050+136268(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+22116, %esi
	movl	$tbuf.5050+142548, %edi
	vmovss	%xmm0, tbuf.5050+136272(%rip)
	vmovss	tbuf.5050+22112(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	139532(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+136276(%rip)
	vmovss	%xmm0, tbuf.5050+136280(%rip)
.L570:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-22116(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L570
	vmovss	tbuf.5050+142540(%rip), %xmm0
	movl	$tbuf.5050+142560, %eax
	vaddss	tbuf.5050+142544(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+25252, %esi
	movl	$tbuf.5050+148824, %edi
	vmovss	%xmm0, tbuf.5050+142548(%rip)
	vmovss	tbuf.5050+25248(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	145808(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+142552(%rip)
	vmovss	%xmm0, tbuf.5050+142556(%rip)
.L571:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-25252(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L571
	vmovss	tbuf.5050+148816(%rip), %xmm0
	movl	$tbuf.5050+148836, %eax
	vaddss	tbuf.5050+148820(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+28388, %esi
	vmovss	%xmm0, tbuf.5050+148824(%rip)
	vmovss	tbuf.5050+28384(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	152084(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+148828(%rip)
	vmovss	%xmm0, tbuf.5050+148832(%rip)
.L572:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-28388(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+155100, %rax
	jne	.L572
	vmovss	tbuf.5050+155092(%rip), %xmm0
	movl	$tbuf.5050+155112, %eax
	vaddss	tbuf.5050+155096(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+31524, %esi
	vmovss	%xmm0, tbuf.5050+155100(%rip)
	vmovss	tbuf.5050+31520(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	158360(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+155104(%rip)
	vmovss	%xmm0, tbuf.5050+155108(%rip)
.L573:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-31524(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+161376, %rax
	jne	.L573
	vmovss	tbuf.5050+161368(%rip), %xmm0
	movl	$tbuf.5050+34660, %r14d
	vaddss	tbuf.5050+161372(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+161388, %eax
	movl	$tbuf.5050+167652, %edi
	movq	%r14, %rsi
	vmovss	%xmm0, tbuf.5050+161376(%rip)
	vmovss	tbuf.5050+34656(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	164636(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+161380(%rip)
	vmovss	%xmm0, tbuf.5050+161384(%rip)
.L574:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-34660(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L574
	vmovss	tbuf.5050+167644(%rip), %xmm0
	movl	$tbuf.5050+167664, %eax
	vaddss	tbuf.5050+167648(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+37796, %esi
	movl	$tbuf.5050+173928, %edi
	vmovss	%xmm0, tbuf.5050+167652(%rip)
	vmovss	tbuf.5050+37792(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	170912(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+167656(%rip)
	vmovss	%xmm0, tbuf.5050+167660(%rip)
.L575:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-37796(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L575
	vmovss	tbuf.5050+173920(%rip), %xmm0
	movl	$tbuf.5050+173940, %eax
	vaddss	tbuf.5050+173924(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+40932, %esi
	movl	$tbuf.5050+180204, %edi
	vmovss	%xmm0, tbuf.5050+173928(%rip)
	vmovss	tbuf.5050+40928(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	177188(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+173932(%rip)
	vmovss	%xmm0, tbuf.5050+173936(%rip)
.L576:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-40932(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L576
	vmovss	tbuf.5050+180196(%rip), %xmm0
	movl	$tbuf.5050+180216, %eax
	vaddss	tbuf.5050+180200(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+44068, %esi
	vmovss	%xmm0, tbuf.5050+180204(%rip)
	vmovss	tbuf.5050+44064(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	183464(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+180208(%rip)
	vmovss	%xmm0, tbuf.5050+180212(%rip)
.L577:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-44068(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+186480, %rax
	jne	.L577
	vmovss	tbuf.5050+186472(%rip), %xmm0
	movl	$tbuf.5050+186492, %eax
	vaddss	tbuf.5050+186476(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+47204, %esi
	vmovss	%xmm0, tbuf.5050+186480(%rip)
	vmovss	tbuf.5050+47200(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	189740(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+186484(%rip)
	vmovss	%xmm0, tbuf.5050+186488(%rip)
.L578:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-47204(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+192756, %rax
	jne	.L578
	vmovss	tbuf.5050+192748(%rip), %xmm0
	movl	$tbuf.5050+192768, %eax
	vaddss	tbuf.5050+192752(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+50340, %esi
	vmovss	%xmm0, tbuf.5050+192756(%rip)
	vmovss	tbuf.5050+50336(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	196016(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+192760(%rip)
	vmovss	%xmm0, tbuf.5050+192764(%rip)
.L579:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-50340(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+199032, %rax
	jne	.L579
	vmovss	tbuf.5050+199024(%rip), %xmm0
	movl	$tbuf.5050+199044, %eax
	vaddss	tbuf.5050+199028(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+53476, %esi
	vmovss	%xmm0, tbuf.5050+199032(%rip)
	vmovss	tbuf.5050+53472(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	202292(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+199036(%rip)
	vmovss	%xmm0, tbuf.5050+199040(%rip)
.L580:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-53476(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+205308, %rax
	jne	.L580
	vmovss	tbuf.5050+205300(%rip), %xmm0
	movl	$tbuf.5050+205320, %eax
	vaddss	tbuf.5050+205304(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+56612, %esi
	movl	$tbuf.5050+211584, %edi
	vmovss	%xmm0, tbuf.5050+205308(%rip)
	vmovss	tbuf.5050+56608(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	208568(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+205312(%rip)
	vmovss	%xmm0, tbuf.5050+205316(%rip)
.L581:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-56612(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L581
	vmovss	tbuf.5050+211576(%rip), %xmm0
	movl	$tbuf.5050+59748, %r13d
	vaddss	tbuf.5050+211580(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+211596, %eax
	movl	$tbuf.5050+217860, %edi
	movq	%r13, %rsi
	vmovss	%xmm0, tbuf.5050+211584(%rip)
	vmovss	tbuf.5050+59744(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	214844(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+211588(%rip)
	vmovss	%xmm0, tbuf.5050+211592(%rip)
.L582:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-59748(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L582
	vmovss	tbuf.5050+217852(%rip), %xmm0
	movl	$tbuf.5050+217872, %eax
	vaddss	tbuf.5050+217856(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+62884, %esi
	movl	$tbuf.5050+224136, %edi
	vmovss	%xmm0, tbuf.5050+217860(%rip)
	vmovss	tbuf.5050+62880(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	221120(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+217864(%rip)
	vmovss	%xmm0, tbuf.5050+217868(%rip)
.L583:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-62884(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L583
	vmovss	tbuf.5050+224128(%rip), %xmm0
	movl	$tbuf.5050+224148, %eax
	vaddss	tbuf.5050+224132(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+66020, %esi
	vmovss	%xmm0, tbuf.5050+224136(%rip)
	vmovss	tbuf.5050+66016(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	227396(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+224140(%rip)
	vmovss	%xmm0, tbuf.5050+224144(%rip)
.L584:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-66020(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+230412, %rax
	jne	.L584
	vmovss	tbuf.5050+230404(%rip), %xmm0
	movl	$tbuf.5050+230424, %eax
	vaddss	tbuf.5050+230408(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+69156, %esi
	vmovss	%xmm0, tbuf.5050+230412(%rip)
	vmovss	tbuf.5050+69152(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	233672(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+230416(%rip)
	vmovss	%xmm0, tbuf.5050+230420(%rip)
.L585:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-69156(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+236688, %rax
	jne	.L585
	vmovss	tbuf.5050+236680(%rip), %xmm0
	movl	$tbuf.5050+236700, %eax
	vaddss	tbuf.5050+236684(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+72292, %esi
	vmovss	%xmm0, tbuf.5050+236688(%rip)
	vmovss	tbuf.5050+72288(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	239948(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+236692(%rip)
	vmovss	%xmm0, tbuf.5050+236696(%rip)
.L586:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-72292(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+242964, %rax
	jne	.L586
	vmovss	tbuf.5050+242956(%rip), %xmm0
	movl	$tbuf.5050+242976, %eax
	vaddss	tbuf.5050+242960(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+75428, %esi
	vmovss	%xmm0, tbuf.5050+242964(%rip)
	vmovss	tbuf.5050+75424(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	246224(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+242968(%rip)
	vmovss	%xmm0, tbuf.5050+242972(%rip)
.L587:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-75428(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+249240, %rax
	jne	.L587
	vmovss	tbuf.5050+249232(%rip), %xmm0
	movl	$tbuf.5050+249252, %eax
	vaddss	tbuf.5050+249236(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+78564, %esi
	vmovss	%xmm0, tbuf.5050+249240(%rip)
	vmovss	tbuf.5050+78560(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	252500(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+249244(%rip)
	vmovss	%xmm0, tbuf.5050+249248(%rip)
.L588:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-78564(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+255516, %rax
	jne	.L588
	vmovss	tbuf.5050+255508(%rip), %xmm0
	movl	$tbuf.5050+255528, %eax
	vaddss	tbuf.5050+255512(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+81700, %esi
	vmovss	%xmm0, tbuf.5050+255516(%rip)
	vmovss	tbuf.5050+81696(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	258776(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+255520(%rip)
	vmovss	%xmm0, tbuf.5050+255524(%rip)
.L589:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rsi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rsi), %xmm0
	vmulss	-81700(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+261792, %rax
	jne	.L589
	vmovss	tbuf.5050+261784(%rip), %xmm0
	movl	$tbuf.5050+84836, %r12d
	vaddss	tbuf.5050+261788(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+261804, %eax
	movl	$tbuf.5050+268068, %r8d
	movq	%r12, %rdi
	vmovss	%xmm0, tbuf.5050+261792(%rip)
	vmovss	tbuf.5050+84832(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	265052(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+261796(%rip)
	vmovss	%xmm0, tbuf.5050+261800(%rip)
.L590:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdi), %xmm0
	vmulss	-84836(%rdi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r8
	jne	.L590
	vmovss	tbuf.5050+268060(%rip), %xmm0
	movl	$tbuf.5050+268080, %eax
	vaddss	tbuf.5050+268064(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+87972, %edi
	movl	$tbuf.5050+274344, %r8d
	vmovss	%xmm0, tbuf.5050+268068(%rip)
	vmovss	tbuf.5050+87968(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	271328(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+268072(%rip)
	vmovss	%xmm0, tbuf.5050+268076(%rip)
.L591:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdi), %xmm0
	vmulss	-87972(%rdi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r8
	jne	.L591
	vmovss	tbuf.5050+274336(%rip), %xmm0
	movl	$tbuf.5050+274356, %eax
	vaddss	tbuf.5050+274340(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+91108, %edi
	movl	$tbuf.5050+280620, %r8d
	vmovss	%xmm0, tbuf.5050+274344(%rip)
	vmovss	tbuf.5050+91104(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	277604(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+274348(%rip)
	vmovss	%xmm0, tbuf.5050+274352(%rip)
.L592:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdi), %xmm0
	vmulss	-91108(%rdi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %r8
	jne	.L592
	vmovss	tbuf.5050+280612(%rip), %xmm0
	movl	$tbuf.5050+280632, %eax
	vaddss	tbuf.5050+280616(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+94244, %edi
	vmovss	%xmm0, tbuf.5050+280620(%rip)
	vmovss	tbuf.5050+94240(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	283880(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+280624(%rip)
	vmovss	%xmm0, tbuf.5050+280628(%rip)
.L593:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdi
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdi), %xmm0
	vmulss	-94244(%rdi), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+286896, %rax
	jne	.L593
	vmovss	tbuf.5050+286888(%rip), %xmm0
	movl	$tbuf.5050+3140, %eax
	vaddss	tbuf.5050+286892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+286896(%rip)
	vmovss	tbuf.5050+3136(%rip), %xmm0
	vaddss	tbuf.5050+104892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+286900(%rip)
	.p2align 4,,10
	.p2align 3
.L594:
	vmovss	(%rax), %xmm0
	addq	$6276, %rcx
	addq	$4, %rax
	vaddss	-6276(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, 283760(%rax)
	cmpq	$tbuf.5050+293172, %rcx
	jne	.L594
	vmovss	290276(%rbx), %xmm0
	movl	$tbuf.5050+286900, %eax
	vmovss	%xmm0, tbuf.5050+287020(%rip)
	movl	$tbuf.5050+287020, %ecx
	vmovss	290280(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+287024(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L595:
	vsubss	(%rax), %xmm0, %xmm0
	addq	$4, %rax
	vmovss	%xmm0, 124(%rax)
	cmpq	%rax, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L595
	movl	$tbuf.5050+287028, %eax
	.p2align 4,,10
	.p2align 3
.L596:
	vmovss	(%rax), %xmm0
	movq	%rax, -56(%rbp)
	call	expf
	movq	-56(%rbp), %rax
	movl	$tbuf.5050+287148, %edi
	vmovss	%xmm0, 120(%rax)
	addq	$4, %rax
	cmpq	%rax, %rdi
	jne	.L596
	vmovss	tbuf.5050+287020(%rip), %xmm0
	movl	$tbuf.5050+287524, %eax
	vaddss	tbuf.5050+287152(%rip), %xmm0, %xmm1
	movl	$tbuf.5050+97384, %ecx
	vaddss	tbuf.5050+287148(%rip), %xmm0, %xmm2
	vaddss	tbuf.5050+287264(%rip), %xmm0, %xmm4
	vmovss	%xmm1, tbuf.5050+287272(%rip)
	vaddss	tbuf.5050+287156(%rip), %xmm0, %xmm1
	vmovss	%xmm2, tbuf.5050+287268(%rip)
	vdivss	%xmm2, %xmm0, %xmm2
	vmovss	%xmm4, tbuf.5050+287384(%rip)
	vmovss	%xmm1, tbuf.5050+287276(%rip)
	vaddss	tbuf.5050+287160(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+287280(%rip)
	vaddss	tbuf.5050+287164(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+287284(%rip)
	vbroadcastss	%xmm0, %ymm1
	vaddps	tbuf.5050+287168(%rip), %ymm1, %ymm3
	vmovss	%xmm2, tbuf.5050+287388(%rip)
	vmovups	%xmm3, tbuf.5050+287288(%rip)
	vextractf128	$0x1, %ymm3, tbuf.5050+287304(%rip)
	vaddps	tbuf.5050+287200(%rip), %ymm1, %ymm3
	vmovups	%xmm3, tbuf.5050+287320(%rip)
	vextractf128	$0x1, %ymm3, tbuf.5050+287336(%rip)
	vaddps	tbuf.5050+287232(%rip), %ymm1, %ymm3
	vmovups	%xmm3, tbuf.5050+287352(%rip)
	vextractf128	$0x1, %ymm3, tbuf.5050+287368(%rip)
	vmovups	tbuf.5050+287272(%rip), %xmm3
	vinsertf128	$0x1, tbuf.5050+287288(%rip), %ymm3, %ymm3
	vdivps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, tbuf.5050+287392(%rip)
	vmovups	tbuf.5050+287304(%rip), %xmm3
	vinsertf128	$0x1, tbuf.5050+287320(%rip), %ymm3, %ymm3
	vdivps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, tbuf.5050+287424(%rip)
	vmovups	tbuf.5050+287336(%rip), %xmm3
	vinsertf128	$0x1, tbuf.5050+287352(%rip), %ymm3, %ymm3
	vdivps	%ymm3, %ymm1, %ymm1
	vmovaps	%ymm1, tbuf.5050+287456(%rip)
	vdivss	tbuf.5050+287368(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+287488(%rip)
	vdivss	tbuf.5050+287372(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+287492(%rip)
	vdivss	tbuf.5050+287376(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+287496(%rip)
	vdivss	tbuf.5050+287380(%rip), %xmm0, %xmm1
	vdivss	%xmm4, %xmm0, %xmm0
	vmovss	%xmm1, tbuf.5050+287500(%rip)
	vmovss	%xmm0, tbuf.5050+287504(%rip)
	vmulss	tbuf.5050+97376(%rip), %xmm2, %xmm0
	vmovss	290804(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+287508(%rip)
	vmovss	%xmm0, tbuf.5050+287512(%rip)
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	tbuf.5050+97380(%rip), %xmm1
	vmulss	tbuf.5050+287392(%rip), %xmm1, %xmm1
	vmovss	%xmm0, tbuf.5050+287516(%rip)
	vmovss	%xmm1, tbuf.5050+287520(%rip)
.L597:
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm0, -8(%rax)
	vmovss	-4(%rcx), %xmm1
	vmulss	190008(%rcx), %xmm1, %xmm1
	vmovss	%xmm1, -4(%rax)
	cmpq	$tbuf.5050+287748, %rax
	jne	.L597
	vmovss	tbuf.5050+287740(%rip), %xmm0
	movl	$tbuf.5050+287760, %eax
	vaddss	tbuf.5050+287744(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+97500, %ecx
	vmovss	%xmm0, tbuf.5050+287748(%rip)
	vmovss	tbuf.5050+97496(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	291048(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+287752(%rip)
	vmovss	%xmm0, tbuf.5050+287756(%rip)
.L598:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189888(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+287992, %rax
	jne	.L598
	vmovss	tbuf.5050+287984(%rip), %xmm0
	movl	$tbuf.5050+288004, %eax
	vaddss	tbuf.5050+287988(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+97620, %ecx
	vmovss	%xmm0, tbuf.5050+287992(%rip)
	vmovss	tbuf.5050+97616(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	291292(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+287996(%rip)
	vmovss	%xmm0, tbuf.5050+288000(%rip)
.L599:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189768(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+288236, %rax
	jne	.L599
	vmovss	tbuf.5050+288228(%rip), %xmm0
	movl	$tbuf.5050+288248, %eax
	vaddss	tbuf.5050+288232(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+97740, %ecx
	vmovss	%xmm0, tbuf.5050+288236(%rip)
	vmovss	tbuf.5050+97736(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	291536(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+288240(%rip)
	vmovss	%xmm0, tbuf.5050+288244(%rip)
.L600:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189648(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+288480, %rax
	jne	.L600
	vmovss	tbuf.5050+288472(%rip), %xmm0
	movl	$tbuf.5050+288492, %eax
	vaddss	tbuf.5050+288476(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+97860, %ecx
	vmovss	%xmm0, tbuf.5050+288480(%rip)
	vmovss	tbuf.5050+97856(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	291780(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+288484(%rip)
	vmovss	%xmm0, tbuf.5050+288488(%rip)
.L601:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189528(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+288724, %rax
	jne	.L601
	vmovss	tbuf.5050+288716(%rip), %xmm0
	movl	$tbuf.5050+288736, %eax
	vaddss	tbuf.5050+288720(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+97980, %ecx
	vmovss	%xmm0, tbuf.5050+288724(%rip)
	vmovss	tbuf.5050+97976(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	292024(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+288728(%rip)
	vmovss	%xmm0, tbuf.5050+288732(%rip)
.L602:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189408(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+288968, %rax
	jne	.L602
	vmovss	tbuf.5050+288960(%rip), %xmm0
	movl	$tbuf.5050+288980, %eax
	vaddss	tbuf.5050+288964(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+98100, %ecx
	vmovss	%xmm0, tbuf.5050+288968(%rip)
	vmovss	tbuf.5050+98096(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	292268(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+288972(%rip)
	vmovss	%xmm0, tbuf.5050+288976(%rip)
.L603:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189288(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+289212, %rax
	jne	.L603
	vmovss	tbuf.5050+289204(%rip), %xmm0
	movl	$tbuf.5050+289224, %eax
	vaddss	tbuf.5050+289208(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+98220, %ecx
	vmovss	%xmm0, tbuf.5050+289212(%rip)
	vmovss	tbuf.5050+98216(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	292512(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+289216(%rip)
	vmovss	%xmm0, tbuf.5050+289220(%rip)
.L604:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189168(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+289456, %rax
	jne	.L604
	vmovss	tbuf.5050+289448(%rip), %xmm0
	movl	$tbuf.5050+289468, %eax
	vaddss	tbuf.5050+289452(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+98340, %ecx
	vmovss	%xmm0, tbuf.5050+289456(%rip)
	vmovss	tbuf.5050+98336(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	292756(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+289460(%rip)
	vmovss	%xmm0, tbuf.5050+289464(%rip)
.L605:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	189048(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+289700, %rax
	jne	.L605
	vmovss	tbuf.5050+289692(%rip), %xmm0
	movl	$tbuf.5050+289712, %eax
	vaddss	tbuf.5050+289696(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+98460, %ecx
	vmovss	%xmm0, tbuf.5050+289700(%rip)
	vmovss	tbuf.5050+98456(%rip), %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm0
	vmovss	293000(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+289704(%rip)
	vmovss	%xmm0, tbuf.5050+289708(%rip)
.L606:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	188928(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+289944, %rax
	jne	.L606
	vmovss	tbuf.5050+289936(%rip), %xmm0
	movl	$tbuf.5050+289996, %eax
	vaddss	tbuf.5050+289940(%rip), %xmm0, %xmm0
	vmovss	tbuf.5050+3256(%rip), %xmm6
	vmovss	tbuf.5050+3260(%rip), %xmm5
	vaddss	tbuf.5050+287748(%rip), %xmm6, %xmm6
	vmovss	tbuf.5050+3264(%rip), %xmm4
	vaddss	tbuf.5050+287992(%rip), %xmm5, %xmm5
	vmovss	tbuf.5050+3268(%rip), %xmm3
	vaddss	tbuf.5050+288236(%rip), %xmm4, %xmm4
	vmovss	tbuf.5050+3272(%rip), %xmm2
	vaddss	tbuf.5050+288480(%rip), %xmm3, %xmm3
	vmovss	tbuf.5050+3276(%rip), %xmm10
	vaddss	tbuf.5050+288724(%rip), %xmm2, %xmm2
	vmovss	tbuf.5050+3280(%rip), %xmm9
	vaddss	tbuf.5050+3292(%rip), %xmm0, %xmm1
	vmovss	tbuf.5050+3284(%rip), %xmm8
	vaddss	tbuf.5050+288968(%rip), %xmm10, %xmm10
	vmovss	tbuf.5050+3288(%rip), %xmm7
	vaddss	tbuf.5050+289212(%rip), %xmm9, %xmm9
	vaddss	tbuf.5050+289456(%rip), %xmm8, %xmm8
	vmovss	%xmm6, tbuf.5050+289948(%rip)
	vaddss	tbuf.5050+289700(%rip), %xmm7, %xmm7
	vmovss	%xmm5, tbuf.5050+289952(%rip)
	vmovss	%xmm4, tbuf.5050+289956(%rip)
	vmovss	%xmm3, tbuf.5050+289960(%rip)
	vmovss	%xmm2, tbuf.5050+289964(%rip)
	vmovss	%xmm10, tbuf.5050+289968(%rip)
	vmovss	%xmm9, tbuf.5050+289972(%rip)
	vmovss	%xmm8, tbuf.5050+289976(%rip)
	vmovss	%xmm7, tbuf.5050+289980(%rip)
	vmovss	%xmm1, tbuf.5050+289984(%rip)
	vmovss	%xmm0, tbuf.5050+289944(%rip)
	vmovss	293284(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+289988(%rip)
	vmovss	293288(%rbx), %xmm0
	vsubss	%xmm6, %xmm0, %xmm6
	vmovss	%xmm0, tbuf.5050+289992(%rip)
	vsubss	%xmm5, %xmm0, %xmm5
	vsubss	%xmm4, %xmm0, %xmm4
	vsubss	%xmm3, %xmm0, %xmm3
	vsubss	%xmm2, %xmm0, %xmm2
	vmovss	%xmm6, tbuf.5050+289996(%rip)
	vsubss	%xmm10, %xmm0, %xmm10
	vmovss	%xmm5, tbuf.5050+290000(%rip)
	vsubss	%xmm9, %xmm0, %xmm9
	vmovss	%xmm4, tbuf.5050+290004(%rip)
	vsubss	%xmm8, %xmm0, %xmm8
	vmovss	%xmm3, tbuf.5050+290008(%rip)
	vsubss	%xmm7, %xmm0, %xmm7
	vmovss	%xmm2, tbuf.5050+290012(%rip)
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm10, tbuf.5050+290016(%rip)
	vmovss	%xmm9, tbuf.5050+290020(%rip)
	vmovss	%xmm8, tbuf.5050+290024(%rip)
	vmovss	%xmm7, tbuf.5050+290028(%rip)
	vmovss	%xmm0, tbuf.5050+290032(%rip)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L607:
	vmovss	(%rax), %xmm0
	movq	%rax, -56(%rbp)
	call	expf
	movq	-56(%rbp), %rax
	movl	$tbuf.5050+290036, %edi
	vmovss	%xmm0, 40(%rax)
	addq	$4, %rax
	cmpq	%rax, %rdi
	jne	.L607
	vmovss	tbuf.5050+289988(%rip), %xmm0
	leaq	293492(%rbx), %rax
	vaddss	tbuf.5050+290036(%rip), %xmm0, %xmm1
	vmovups	tbuf.5050+290040(%rip), %xmm2
	cmpq	$tbuf.5050+290228, %rax
	vaddss	tbuf.5050+290072(%rip), %xmm0, %xmm3
	vinsertf128	$0x1, tbuf.5050+290056(%rip), %ymm2, %ymm2
	vmovss	%xmm1, tbuf.5050+290076(%rip)
	vbroadcastss	%xmm0, %ymm1
	vaddps	%ymm1, %ymm2, %ymm2
	vmovss	%xmm3, tbuf.5050+290112(%rip)
	vmovaps	%ymm2, tbuf.5050+290080(%rip)
	vmovups	tbuf.5050+290076(%rip), %xmm2
	vinsertf128	$0x1, tbuf.5050+290092(%rip), %ymm2, %ymm2
	vdivps	%ymm2, %ymm1, %ymm1
	vdivss	tbuf.5050+290108(%rip), %xmm0, %xmm2
	vmovups	%xmm1, tbuf.5050+290116(%rip)
	vdivss	%xmm3, %xmm0, %xmm0
	vmovups	tbuf.5050+98580(%rip), %xmm3
	vmovss	%xmm2, tbuf.5050+290148(%rip)
	vsubss	tbuf.5050+98612(%rip), %xmm2, %xmm2
	vmovss	%xmm2, tbuf.5050+290188(%rip)
	vinsertf128	$0x1, tbuf.5050+98596(%rip), %ymm3, %ymm3
	vextractf128	$0x1, %ymm1, tbuf.5050+290132(%rip)
	vmovss	%xmm0, tbuf.5050+290152(%rip)
	vsubss	tbuf.5050+98616(%rip), %xmm0, %xmm0
	vsubps	%ymm3, %ymm1, %ymm1
	vmovss	%xmm0, tbuf.5050+290192(%rip)
	vmovups	%xmm1, tbuf.5050+290156(%rip)
	vextractf128	$0x1, %ymm1, tbuf.5050+290172(%rip)
	jnb	.L731
	leaq	293524(%rbx), %rax
	cmpq	$tbuf.5050+290196, %rax
	ja	.L608
.L731:
	vmovss	293492(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+290196(%rip)
	vmovss	293496(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+290200(%rip)
	vmovss	293500(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+290204(%rip)
	vmovups	293504(%rbx), %xmm0
	vinsertf128	$0x1, 293520(%rbx), %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+290208(%rip)
	vmovups	293536(%rbx), %xmm0
	vinsertf128	$0x1, 293552(%rbx), %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+290240(%rip)
	vmovups	293568(%rbx), %xmm0
	vinsertf128	$0x1, 293584(%rbx), %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+290272(%rip)
	vmovss	293600(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+290304(%rip)
	vmovss	293604(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+290308(%rip)
	vmovss	293608(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+290312(%rip)
.L610:
	vmovss	tbuf.5050+290156(%rip), %xmm0
	movl	$tbuf.5050+287400, %eax
	vmulss	tbuf.5050+97388(%rip), %xmm0, %xmm1
	vbroadcastss	%xmm0, %ymm4
	vmovups	tbuf.5050+97396(%rip), %xmm2
	vmulss	tbuf.5050+97384(%rip), %xmm0, %xmm5
	vinsertf128	$0x1, tbuf.5050+97412(%rip), %ymm2, %ymm2
	vmulss	tbuf.5050+97380(%rip), %xmm0, %xmm6
	vmovss	%xmm1, tbuf.5050+290328(%rip)
	vmulss	tbuf.5050+97392(%rip), %xmm0, %xmm1
	vmulss	tbuf.5050+97376(%rip), %xmm0, %xmm3
	vmulps	%ymm4, %ymm2, %ymm2
	vmovss	%xmm5, tbuf.5050+290324(%rip)
	vmulss	tbuf.5050+97492(%rip), %xmm0, %xmm0
	vmovss	%xmm6, tbuf.5050+290320(%rip)
	vmovss	%xmm1, tbuf.5050+290332(%rip)
	vmovaps	%ymm2, tbuf.5050+290336(%rip)
	vmovss	%xmm3, tbuf.5050+290316(%rip)
	vaddss	tbuf.5050+290196(%rip), %xmm3, %xmm3
	vmovss	%xmm0, tbuf.5050+290432(%rip)
	vmovups	tbuf.5050+97460(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+97476(%rip), %ymm1, %ymm1
	vmovups	tbuf.5050+97428(%rip), %xmm2
	vinsertf128	$0x1, tbuf.5050+97444(%rip), %ymm2, %ymm2
	vmovss	%xmm3, tbuf.5050+290436(%rip)
	vmulps	%ymm4, %ymm1, %ymm1
	vmulps	%ymm4, %ymm2, %ymm2
	vmovaps	%ymm1, tbuf.5050+290400(%rip)
	vaddss	tbuf.5050+290204(%rip), %xmm5, %xmm1
	vmovaps	%ymm2, tbuf.5050+290368(%rip)
	vaddss	tbuf.5050+290200(%rip), %xmm6, %xmm2
	vmovss	%xmm1, tbuf.5050+290444(%rip)
	vmovups	tbuf.5050+290328(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+290344(%rip), %ymm1, %ymm1
	vmovss	%xmm2, tbuf.5050+290440(%rip)
	vaddps	tbuf.5050+290208(%rip), %ymm1, %ymm1
	vmovaps	%xmm1, tbuf.5050+290448(%rip)
	vextractf128	$0x1, %ymm1, tbuf.5050+290464(%rip)
	vmovups	tbuf.5050+290360(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+290376(%rip), %ymm1, %ymm1
	vmovups	tbuf.5050+97500(%rip), %xmm4
	vinsertf128	$0x1, tbuf.5050+97516(%rip), %ymm4, %ymm4
	vmovss	tbuf.5050+290304(%rip), %xmm5
	vaddps	tbuf.5050+290240(%rip), %ymm1, %ymm1
	vmovss	tbuf.5050+290308(%rip), %xmm2
	vaddss	tbuf.5050+290424(%rip), %xmm5, %xmm5
	vaddss	tbuf.5050+290428(%rip), %xmm2, %xmm2
	vmovaps	%xmm1, tbuf.5050+290480(%rip)
	vextractf128	$0x1, %ymm1, tbuf.5050+290496(%rip)
	vmovss	%xmm5, tbuf.5050+290544(%rip)
	vmovss	%xmm2, tbuf.5050+290548(%rip)
	vmovups	tbuf.5050+290392(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+290408(%rip), %ymm1, %ymm1
	vaddps	tbuf.5050+290272(%rip), %ymm1, %ymm1
	vmovaps	%xmm1, tbuf.5050+290512(%rip)
	vextractf128	$0x1, %ymm1, tbuf.5050+290528(%rip)
	vaddss	tbuf.5050+290312(%rip), %xmm0, %xmm1
	vmovss	tbuf.5050+290160(%rip), %xmm0
	vbroadcastss	%xmm0, %ymm7
	vmulss	tbuf.5050+97496(%rip), %xmm0, %xmm13
	vmulss	tbuf.5050+97596(%rip), %xmm0, %xmm8
	vmulps	%ymm7, %ymm4, %ymm12
	vmovups	tbuf.5050+97532(%rip), %xmm4
	vinsertf128	$0x1, tbuf.5050+97548(%rip), %ymm4, %ymm4
	vmovss	%xmm1, tbuf.5050+290552(%rip)
	vmovss	%xmm13, tbuf.5050+290556(%rip)
	vaddss	%xmm3, %xmm13, %xmm3
	vmovaps	%ymm12, tbuf.5050+290560(%rip)
	vmovss	%xmm8, tbuf.5050+290656(%rip)
	vmulps	%ymm7, %ymm4, %ymm11
	vmovups	tbuf.5050+97564(%rip), %xmm4
	vinsertf128	$0x1, tbuf.5050+97580(%rip), %ymm4, %ymm4
	vmovaps	%ymm11, tbuf.5050+290592(%rip)
	vmulps	%ymm7, %ymm4, %ymm6
	vmovaps	%ymm6, tbuf.5050+290624(%rip)
	vmulss	tbuf.5050+97600(%rip), %xmm0, %xmm7
	vaddss	tbuf.5050+290536(%rip), %xmm8, %xmm8
	vmovups	tbuf.5050+290440(%rip), %xmm4
	vmulss	tbuf.5050+97604(%rip), %xmm0, %xmm10
	vinsertf128	$0x1, tbuf.5050+290456(%rip), %ymm4, %ymm4
	vmovss	%xmm3, tbuf.5050+290676(%rip)
	vmulss	tbuf.5050+97608(%rip), %xmm0, %xmm9
	vmulss	tbuf.5050+97612(%rip), %xmm0, %xmm0
	vmovss	%xmm7, tbuf.5050+290660(%rip)
	vaddss	tbuf.5050+290540(%rip), %xmm7, %xmm7
	vmovss	%xmm8, tbuf.5050+290776(%rip)
	vaddps	%ymm12, %ymm4, %ymm4
	vmovss	%xmm10, tbuf.5050+290664(%rip)
	vaddss	%xmm5, %xmm10, %xmm5
	vaddss	%xmm9, %xmm2, %xmm2
	vmovss	%xmm9, tbuf.5050+290668(%rip)
	vmovss	%xmm0, tbuf.5050+290672(%rip)
	vaddss	%xmm0, %xmm1, %xmm0
	vmovups	%xmm4, tbuf.5050+290680(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+290696(%rip)
	vmovss	%xmm7, tbuf.5050+290780(%rip)
	vmovss	%xmm5, tbuf.5050+290784(%rip)
	vmovss	tbuf.5050+290164(%rip), %xmm1
	vmulss	tbuf.5050+97616(%rip), %xmm1, %xmm8
	vmovss	%xmm2, tbuf.5050+290788(%rip)
	vmovups	tbuf.5050+290472(%rip), %xmm4
	vmulss	tbuf.5050+97620(%rip), %xmm1, %xmm7
	vinsertf128	$0x1, tbuf.5050+290488(%rip), %ymm4, %ymm4
	vmovss	%xmm0, tbuf.5050+290792(%rip)
	vmovss	%xmm8, tbuf.5050+290796(%rip)
	vaddss	%xmm8, %xmm3, %xmm3
	vaddps	%ymm11, %ymm4, %ymm4
	vmovups	%xmm4, tbuf.5050+290712(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+290728(%rip)
	vmovups	tbuf.5050+290504(%rip), %xmm4
	vinsertf128	$0x1, tbuf.5050+290520(%rip), %ymm4, %ymm4
	vaddps	%ymm6, %ymm4, %ymm4
	vmovups	%xmm4, tbuf.5050+290744(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+290760(%rip)
	vmovss	%xmm7, tbuf.5050+290800(%rip)
	vmovss	%xmm3, tbuf.5050+290916(%rip)
	vmulss	tbuf.5050+97628(%rip), %xmm1, %xmm4
	vmulss	tbuf.5050+97624(%rip), %xmm1, %xmm9
	vaddss	tbuf.5050+290680(%rip), %xmm7, %xmm7
	vmovss	%xmm4, tbuf.5050+290808(%rip)
	vbroadcastss	%xmm1, %ymm4
	vmovss	%xmm9, tbuf.5050+290804(%rip)
	vmovss	%xmm7, tbuf.5050+290920(%rip)
	vmulps	tbuf.5050+97632(%rip), %ymm4, %ymm6
	vmovups	%xmm6, tbuf.5050+290812(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+290828(%rip)
	vmulps	tbuf.5050+97664(%rip), %ymm4, %ymm6
	vmulps	tbuf.5050+97696(%rip), %ymm4, %ymm4
	vmovups	%xmm6, tbuf.5050+290844(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+290860(%rip)
	vmovups	%xmm4, tbuf.5050+290876(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+290892(%rip)
	vaddss	tbuf.5050+290684(%rip), %xmm9, %xmm4
	vmulss	tbuf.5050+97728(%rip), %xmm1, %xmm6
	vmulss	tbuf.5050+97732(%rip), %xmm1, %xmm1
	vmovss	%xmm4, tbuf.5050+290924(%rip)
	vaddss	%xmm6, %xmm2, %xmm2
	vmovups	tbuf.5050+290808(%rip), %xmm4
	vinsertf128	$0x1, tbuf.5050+290824(%rip), %ymm4, %ymm4
	vmovss	%xmm6, tbuf.5050+290908(%rip)
	vmovss	%xmm1, tbuf.5050+290912(%rip)
	vaddss	%xmm1, %xmm0, %xmm1
	vaddps	tbuf.5050+290688(%rip), %ymm4, %ymm4
	vmovaps	%xmm4, tbuf.5050+290928(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+290944(%rip)
	vmovups	tbuf.5050+290840(%rip), %xmm4
	vinsertf128	$0x1, tbuf.5050+290856(%rip), %ymm4, %ymm4
	vaddps	tbuf.5050+290720(%rip), %ymm4, %ymm4
	vmovaps	%xmm4, tbuf.5050+290960(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+290976(%rip)
	vmovups	tbuf.5050+290872(%rip), %xmm4
	vaddss	tbuf.5050+290904(%rip), %xmm5, %xmm5
	vinsertf128	$0x1, tbuf.5050+290888(%rip), %ymm4, %ymm4
	vmovss	%xmm2, tbuf.5050+291028(%rip)
	vmovups	tbuf.5050+97772(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+97788(%rip), %ymm6, %ymm6
	vmovss	%xmm1, tbuf.5050+291032(%rip)
	vmovss	tbuf.5050+290168(%rip), %xmm0
	vbroadcastss	%xmm0, %ymm8
	vmulss	tbuf.5050+97844(%rip), %xmm0, %xmm11
	vmovss	%xmm5, tbuf.5050+291024(%rip)
	vaddps	tbuf.5050+290752(%rip), %ymm4, %ymm4
	vmulss	tbuf.5050+97848(%rip), %xmm0, %xmm10
	vmulps	%ymm8, %ymm6, %ymm12
	vmovups	tbuf.5050+97740(%rip), %xmm13
	vmovups	tbuf.5050+97804(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+97756(%rip), %ymm13, %ymm13
	vaddss	%xmm5, %xmm11, %xmm5
	vmovss	%xmm11, tbuf.5050+291144(%rip)
	vinsertf128	$0x1, tbuf.5050+97820(%rip), %ymm6, %ymm6
	vmovaps	%ymm12, tbuf.5050+291072(%rip)
	vaddss	%xmm10, %xmm2, %xmm2
	vmovaps	%xmm4, tbuf.5050+290992(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+291008(%rip)
	vmulps	%ymm8, %ymm13, %ymm13
	vmovss	%xmm10, tbuf.5050+291148(%rip)
	vmulss	tbuf.5050+97736(%rip), %xmm0, %xmm4
	vmulps	%ymm8, %ymm6, %ymm7
	vmulss	tbuf.5050+97836(%rip), %xmm0, %xmm9
	vmovaps	%ymm13, tbuf.5050+291040(%rip)
	vmulss	tbuf.5050+97840(%rip), %xmm0, %xmm8
	vmulss	tbuf.5050+97852(%rip), %xmm0, %xmm0
	vmovss	%xmm4, tbuf.5050+291036(%rip)
	vaddss	%xmm3, %xmm4, %xmm4
	vmovaps	%ymm7, tbuf.5050+291104(%rip)
	vmovss	%xmm9, tbuf.5050+291136(%rip)
	vmovss	%xmm8, tbuf.5050+291140(%rip)
	vmovss	%xmm0, tbuf.5050+291152(%rip)
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm4, tbuf.5050+291156(%rip)
	vmovups	tbuf.5050+290920(%rip), %xmm3
	vaddss	tbuf.5050+291016(%rip), %xmm9, %xmm9
	vmovups	tbuf.5050+290952(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+290936(%rip), %ymm3, %ymm3
	vmovss	tbuf.5050+290172(%rip), %xmm1
	vaddss	tbuf.5050+291020(%rip), %xmm8, %xmm8
	vinsertf128	$0x1, tbuf.5050+290968(%rip), %ymm6, %ymm6
	vmovss	%xmm5, tbuf.5050+291264(%rip)
	vmovss	%xmm2, tbuf.5050+291268(%rip)
	vmovss	%xmm9, tbuf.5050+291256(%rip)
	vaddps	%ymm13, %ymm3, %ymm3
	vmovss	%xmm0, tbuf.5050+291272(%rip)
	vaddps	%ymm12, %ymm6, %ymm6
	vmovss	%xmm8, tbuf.5050+291260(%rip)
	vmovups	%xmm3, tbuf.5050+291160(%rip)
	vextractf128	$0x1, %ymm3, tbuf.5050+291176(%rip)
	vmovups	%xmm6, tbuf.5050+291192(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291208(%rip)
	vmovups	tbuf.5050+290984(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291000(%rip), %ymm6, %ymm6
	vaddps	%ymm7, %ymm6, %ymm6
	vmovups	%xmm6, tbuf.5050+291224(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291240(%rip)
	vbroadcastss	%xmm1, %ymm6
	vmulps	tbuf.5050+97856(%rip), %ymm6, %ymm3
	vmovups	%xmm3, tbuf.5050+291276(%rip)
	vextractf128	$0x1, %ymm3, tbuf.5050+291292(%rip)
	vmulps	tbuf.5050+97888(%rip), %ymm6, %ymm3
	vmulps	tbuf.5050+97920(%rip), %ymm6, %ymm6
	vmovups	%xmm3, tbuf.5050+291308(%rip)
	vextractf128	$0x1, %ymm3, tbuf.5050+291324(%rip)
	vmovups	%xmm6, tbuf.5050+291340(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291356(%rip)
	vmulss	tbuf.5050+97952(%rip), %xmm1, %xmm3
	vmovss	%xmm3, tbuf.5050+291372(%rip)
	vmulss	tbuf.5050+97956(%rip), %xmm1, %xmm3
	vmovss	%xmm3, tbuf.5050+291376(%rip)
	vmulss	tbuf.5050+97960(%rip), %xmm1, %xmm3
	vaddss	tbuf.5050+291276(%rip), %xmm4, %xmm4
	vmovss	tbuf.5050+291160(%rip), %xmm6
	vmulss	tbuf.5050+97968(%rip), %xmm1, %xmm7
	vaddss	tbuf.5050+291280(%rip), %xmm6, %xmm6
	vmovss	%xmm3, tbuf.5050+291380(%rip)
	vmulss	tbuf.5050+97964(%rip), %xmm1, %xmm3
	vmulss	tbuf.5050+97972(%rip), %xmm1, %xmm1
	vaddss	%xmm7, %xmm2, %xmm2
	vmovss	%xmm7, tbuf.5050+291388(%rip)
	vmovss	%xmm6, tbuf.5050+291400(%rip)
	vmovss	tbuf.5050+291164(%rip), %xmm6
	vaddss	tbuf.5050+291284(%rip), %xmm6, %xmm6
	vmovss	%xmm4, tbuf.5050+291396(%rip)
	vaddss	%xmm5, %xmm3, %xmm5
	vmovss	%xmm3, tbuf.5050+291384(%rip)
	vmovss	%xmm1, tbuf.5050+291392(%rip)
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm6, tbuf.5050+291404(%rip)
	vmovups	tbuf.5050+291288(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291304(%rip), %ymm6, %ymm6
	vmovss	%xmm5, tbuf.5050+291504(%rip)
	vaddps	tbuf.5050+291168(%rip), %ymm6, %ymm6
	vmovaps	%xmm6, tbuf.5050+291408(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291424(%rip)
	vmovups	tbuf.5050+291320(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291336(%rip), %ymm6, %ymm6
	vaddps	tbuf.5050+291200(%rip), %ymm6, %ymm6
	vmovaps	%xmm6, tbuf.5050+291440(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291456(%rip)
	vmovups	tbuf.5050+291352(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291368(%rip), %ymm6, %ymm6
	vaddps	tbuf.5050+291232(%rip), %ymm6, %ymm6
	vmovaps	%xmm6, tbuf.5050+291472(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291488(%rip)
	vmovss	%xmm2, tbuf.5050+291508(%rip)
	vmovss	%xmm0, tbuf.5050+291512(%rip)
	vmovss	tbuf.5050+290176(%rip), %xmm1
	vbroadcastss	%xmm1, %ymm8
	vmulss	tbuf.5050+97976(%rip), %xmm1, %xmm13
	vmovups	tbuf.5050+97980(%rip), %xmm6
	vmulss	tbuf.5050+98088(%rip), %xmm1, %xmm10
	vinsertf128	$0x1, tbuf.5050+97996(%rip), %ymm6, %ymm6
	vmulss	tbuf.5050+98076(%rip), %xmm1, %xmm9
	vmulss	tbuf.5050+98084(%rip), %xmm1, %xmm3
	vaddss	%xmm4, %xmm13, %xmm4
	vmovss	%xmm13, tbuf.5050+291516(%rip)
	vmulps	%ymm8, %ymm6, %ymm12
	vmovss	%xmm10, tbuf.5050+291628(%rip)
	vmovups	tbuf.5050+98012(%rip), %xmm6
	vaddss	%xmm10, %xmm2, %xmm2
	vinsertf128	$0x1, tbuf.5050+98028(%rip), %ymm6, %ymm6
	vmovss	%xmm9, tbuf.5050+291616(%rip)
	vmovss	%xmm3, tbuf.5050+291624(%rip)
	vaddss	%xmm5, %xmm3, %xmm3
	vmovaps	%ymm12, tbuf.5050+291520(%rip)
	vmovss	%xmm4, tbuf.5050+291636(%rip)
	vmulps	%ymm8, %ymm6, %ymm11
	vmovups	tbuf.5050+98044(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+98060(%rip), %ymm6, %ymm6
	vmovaps	%ymm11, tbuf.5050+291552(%rip)
	vmulps	%ymm8, %ymm6, %ymm7
	vmovups	tbuf.5050+291400(%rip), %xmm6
	vmulss	tbuf.5050+98080(%rip), %xmm1, %xmm8
	vinsertf128	$0x1, tbuf.5050+291416(%rip), %ymm6, %ymm6
	vmulss	tbuf.5050+98092(%rip), %xmm1, %xmm1
	vmovaps	%ymm7, tbuf.5050+291584(%rip)
	vaddps	%ymm12, %ymm6, %ymm6
	vmovss	%xmm8, tbuf.5050+291620(%rip)
	vmovss	%xmm1, tbuf.5050+291632(%rip)
	vaddss	%xmm1, %xmm0, %xmm1
	vmovups	%xmm6, tbuf.5050+291640(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291656(%rip)
	vmovups	tbuf.5050+291432(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291448(%rip), %ymm6, %ymm6
	vaddps	%ymm11, %ymm6, %ymm6
	vmovups	%xmm6, tbuf.5050+291672(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291688(%rip)
	vmovups	tbuf.5050+291464(%rip), %xmm6
	vaddss	tbuf.5050+291496(%rip), %xmm9, %xmm9
	vmovss	tbuf.5050+290180(%rip), %xmm0
	vaddss	tbuf.5050+291500(%rip), %xmm8, %xmm8
	vmulss	tbuf.5050+98108(%rip), %xmm0, %xmm5
	vmovss	%xmm3, tbuf.5050+291744(%rip)
	vinsertf128	$0x1, tbuf.5050+291480(%rip), %ymm6, %ymm6
	vmovss	%xmm2, tbuf.5050+291748(%rip)
	vmovss	%xmm1, tbuf.5050+291752(%rip)
	vmovss	%xmm9, tbuf.5050+291736(%rip)
	vmovss	%xmm8, tbuf.5050+291740(%rip)
	vmulss	tbuf.5050+98096(%rip), %xmm0, %xmm8
	vmovss	%xmm5, tbuf.5050+291768(%rip)
	vbroadcastss	%xmm0, %ymm5
	vaddps	%ymm7, %ymm6, %ymm6
	vmulss	tbuf.5050+98100(%rip), %xmm0, %xmm7
	vmulps	tbuf.5050+98112(%rip), %ymm5, %ymm9
	vmovss	%xmm8, tbuf.5050+291756(%rip)
	vaddss	%xmm8, %xmm4, %xmm4
	vmovups	%xmm6, tbuf.5050+291704(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291720(%rip)
	vmovss	%xmm7, tbuf.5050+291760(%rip)
	vmovups	%xmm9, tbuf.5050+291772(%rip)
	vextractf128	$0x1, %ymm9, tbuf.5050+291788(%rip)
	vmulps	tbuf.5050+98144(%rip), %ymm5, %ymm9
	vmulps	tbuf.5050+98176(%rip), %ymm5, %ymm5
	vmulss	tbuf.5050+98104(%rip), %xmm0, %xmm6
	vmovups	%xmm9, tbuf.5050+291804(%rip)
	vextractf128	$0x1, %ymm9, tbuf.5050+291820(%rip)
	vmovups	%xmm5, tbuf.5050+291836(%rip)
	vextractf128	$0x1, %ymm5, tbuf.5050+291852(%rip)
	vmovss	%xmm6, tbuf.5050+291764(%rip)
	vmulss	tbuf.5050+98208(%rip), %xmm0, %xmm5
	vmulss	tbuf.5050+98212(%rip), %xmm0, %xmm0
	vmovss	%xmm5, tbuf.5050+291868(%rip)
	vaddss	%xmm5, %xmm2, %xmm2
	vmovss	%xmm0, tbuf.5050+291872(%rip)
	vaddss	tbuf.5050+291644(%rip), %xmm6, %xmm6
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	tbuf.5050+290184(%rip), %xmm0
	vmulss	tbuf.5050+98216(%rip), %xmm0, %xmm5
	vmovss	%xmm4, tbuf.5050+291876(%rip)
	vaddss	tbuf.5050+291640(%rip), %xmm7, %xmm7
	vmovss	%xmm2, tbuf.5050+291988(%rip)
	vaddss	tbuf.5050+291864(%rip), %xmm3, %xmm3
	vmovss	%xmm1, tbuf.5050+291992(%rip)
	vmovss	%xmm6, tbuf.5050+291884(%rip)
	vmovss	%xmm5, tbuf.5050+291996(%rip)
	vaddss	%xmm4, %xmm5, %xmm4
	vmovups	tbuf.5050+291768(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291784(%rip), %ymm6, %ymm6
	vmovss	%xmm7, tbuf.5050+291880(%rip)
	vmovss	%xmm3, tbuf.5050+291984(%rip)
	vaddps	tbuf.5050+291648(%rip), %ymm6, %ymm6
	vmovaps	%xmm6, tbuf.5050+291888(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291904(%rip)
	vmovups	tbuf.5050+291800(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291816(%rip), %ymm6, %ymm6
	vaddps	tbuf.5050+291680(%rip), %ymm6, %ymm6
	vmovaps	%xmm6, tbuf.5050+291920(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291936(%rip)
	vmovups	tbuf.5050+291832(%rip), %xmm6
	vinsertf128	$0x1, tbuf.5050+291848(%rip), %ymm6, %ymm6
	vaddps	tbuf.5050+291712(%rip), %ymm6, %ymm6
	vmovaps	%xmm6, tbuf.5050+291952(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+291968(%rip)
	vmulss	tbuf.5050+98220(%rip), %xmm0, %xmm6
	vmovss	%xmm6, tbuf.5050+292000(%rip)
	vmulss	tbuf.5050+98224(%rip), %xmm0, %xmm6
	vmovss	%xmm6, tbuf.5050+292004(%rip)
	vmulss	tbuf.5050+98228(%rip), %xmm0, %xmm6
	vmovss	%xmm6, tbuf.5050+292008(%rip)
	vmulss	tbuf.5050+98232(%rip), %xmm0, %xmm6
	vmovss	%xmm4, tbuf.5050+292116(%rip)
	vmovss	%xmm6, tbuf.5050+292012(%rip)
	vmulss	tbuf.5050+98236(%rip), %xmm0, %xmm6
	vbroadcastss	%xmm0, %ymm0
	vmovss	%xmm6, tbuf.5050+292016(%rip)
	vmulps	tbuf.5050+98240(%rip), %ymm0, %ymm6
	vmovups	%xmm6, tbuf.5050+292020(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+292036(%rip)
	vmulps	tbuf.5050+98272(%rip), %ymm0, %ymm6
	vmulps	tbuf.5050+98304(%rip), %ymm0, %ymm0
	vmovups	%xmm6, tbuf.5050+292052(%rip)
	vextractf128	$0x1, %ymm6, tbuf.5050+292068(%rip)
	vmovups	%xmm0, tbuf.5050+292084(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+292100(%rip)
	vmovups	tbuf.5050+291880(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+291896(%rip), %ymm0, %ymm0
	vaddps	tbuf.5050+292000(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+292120(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+292136(%rip)
	vmovups	tbuf.5050+291912(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+291928(%rip), %ymm0, %ymm0
	vaddps	tbuf.5050+292032(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+292152(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+292168(%rip)
	vmovups	tbuf.5050+291944(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+291960(%rip), %ymm0, %ymm0
	vaddps	tbuf.5050+292064(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+292184(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+292200(%rip)
	vmovss	tbuf.5050+291976(%rip), %xmm0
	vaddss	tbuf.5050+292096(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+292216(%rip)
	vmovss	tbuf.5050+291980(%rip), %xmm0
	vaddss	tbuf.5050+292112(%rip), %xmm1, %xmm1
	vaddss	tbuf.5050+292100(%rip), %xmm0, %xmm0
	vmovups	tbuf.5050+98356(%rip), %xmm6
	vaddss	tbuf.5050+292104(%rip), %xmm3, %xmm3
	vinsertf128	$0x1, tbuf.5050+98372(%rip), %ymm6, %ymm6
	vaddss	tbuf.5050+292108(%rip), %xmm2, %xmm2
	vmovss	%xmm1, tbuf.5050+292232(%rip)
	vmovss	%xmm0, tbuf.5050+292220(%rip)
	vmovss	tbuf.5050+290188(%rip), %xmm0
	vmulss	tbuf.5050+98348(%rip), %xmm0, %xmm5
	vbroadcastss	%xmm0, %ymm10
	vmovss	%xmm3, tbuf.5050+292224(%rip)
	vmulss	tbuf.5050+98336(%rip), %xmm0, %xmm9
	vmulps	%ymm10, %ymm6, %ymm6
	vmovss	%xmm2, tbuf.5050+292228(%rip)
	vmulss	tbuf.5050+98344(%rip), %xmm0, %xmm7
	vmulss	tbuf.5050+98340(%rip), %xmm0, %xmm8
	vmovss	%xmm5, tbuf.5050+292248(%rip)
	vmulss	tbuf.5050+98352(%rip), %xmm0, %xmm5
	vmovaps	%ymm6, tbuf.5050+292256(%rip)
	vmulss	tbuf.5050+98452(%rip), %xmm0, %xmm0
	vaddss	%xmm9, %xmm4, %xmm4
	vmovss	%xmm9, tbuf.5050+292236(%rip)
	vmovss	%xmm7, tbuf.5050+292244(%rip)
	vmovups	tbuf.5050+98388(%rip), %xmm6
	vmovss	%xmm5, tbuf.5050+292252(%rip)
	vinsertf128	$0x1, tbuf.5050+98404(%rip), %ymm6, %ymm6
	vmovups	tbuf.5050+98420(%rip), %xmm5
	vinsertf128	$0x1, tbuf.5050+98436(%rip), %ymm5, %ymm5
	vmovss	%xmm0, tbuf.5050+292352(%rip)
	vmovss	%xmm4, tbuf.5050+292356(%rip)
	vaddss	%xmm0, %xmm1, %xmm0
	vmulps	%ymm10, %ymm6, %ymm6
	vmovss	%xmm8, tbuf.5050+292240(%rip)
	vmulps	%ymm10, %ymm5, %ymm5
	vmovaps	%ymm6, tbuf.5050+292288(%rip)
	vmovaps	%ymm5, tbuf.5050+292320(%rip)
	vaddss	tbuf.5050+292120(%rip), %xmm8, %xmm8
	vmovups	tbuf.5050+292248(%rip), %xmm5
	vaddss	tbuf.5050+292124(%rip), %xmm7, %xmm7
	vinsertf128	$0x1, tbuf.5050+292264(%rip), %ymm5, %ymm5
	vmovss	%xmm0, tbuf.5050+292472(%rip)
	vmovups	tbuf.5050+98460(%rip), %xmm10
	vaddss	tbuf.5050+292344(%rip), %xmm3, %xmm3
	vinsertf128	$0x1, tbuf.5050+98476(%rip), %ymm10, %ymm10
	vmovss	%xmm8, tbuf.5050+292360(%rip)
	vmovss	tbuf.5050+290192(%rip), %xmm1
	vaddss	tbuf.5050+292348(%rip), %xmm2, %xmm2
	vmovss	tbuf.5050+98456(%rip), %xmm13
	vbroadcastss	%xmm1, %ymm6
	vaddps	tbuf.5050+292128(%rip), %ymm5, %ymm5
	vmovss	%xmm7, tbuf.5050+292364(%rip)
	vmulss	tbuf.5050+290192(%rip), %xmm13, %xmm13
	vmulps	%ymm6, %ymm10, %ymm12
	vmovss	%xmm3, tbuf.5050+292464(%rip)
	vmovups	tbuf.5050+98492(%rip), %xmm11
	vmovss	%xmm2, tbuf.5050+292468(%rip)
	vmovaps	%xmm5, tbuf.5050+292368(%rip)
	vextractf128	$0x1, %ymm5, tbuf.5050+292384(%rip)
	vaddss	%xmm4, %xmm13, %xmm4
	vmovss	%xmm13, tbuf.5050+292476(%rip)
	vmovaps	%ymm12, tbuf.5050+292480(%rip)
	vmovups	tbuf.5050+292280(%rip), %xmm5
	vinsertf128	$0x1, tbuf.5050+292296(%rip), %ymm5, %ymm5
	vaddps	tbuf.5050+292160(%rip), %ymm5, %ymm5
	vmovaps	%xmm5, tbuf.5050+292400(%rip)
	vextractf128	$0x1, %ymm5, tbuf.5050+292416(%rip)
	vmovups	tbuf.5050+292312(%rip), %xmm5
	vinsertf128	$0x1, tbuf.5050+292328(%rip), %ymm5, %ymm5
	vaddps	tbuf.5050+292192(%rip), %ymm5, %ymm5
	vmovaps	%xmm5, tbuf.5050+292432(%rip)
	vextractf128	$0x1, %ymm5, tbuf.5050+292448(%rip)
	vinsertf128	$0x1, tbuf.5050+98508(%rip), %ymm11, %ymm11
	vmovss	%xmm4, tbuf.5050+292596(%rip)
	vmovups	tbuf.5050+292392(%rip), %xmm4
	vmulss	tbuf.5050+98556(%rip), %xmm1, %xmm8
	vinsertf128	$0x1, tbuf.5050+292408(%rip), %ymm4, %ymm4
	vmovups	tbuf.5050+98524(%rip), %xmm5
	vmulps	%ymm6, %ymm11, %ymm11
	vmovups	tbuf.5050+292360(%rip), %xmm10
	vinsertf128	$0x1, tbuf.5050+98540(%rip), %ymm5, %ymm5
	vmovss	%xmm8, tbuf.5050+292576(%rip)
	vaddss	tbuf.5050+292456(%rip), %xmm8, %xmm8
	vmulss	tbuf.5050+98560(%rip), %xmm1, %xmm7
	vaddps	%ymm11, %ymm4, %ymm4
	vmulss	tbuf.5050+98568(%rip), %xmm1, %xmm9
	vmovaps	%ymm11, tbuf.5050+292512(%rip)
	vinsertf128	$0x1, tbuf.5050+292376(%rip), %ymm10, %ymm10
	vmulps	%ymm6, %ymm5, %ymm5
	vmovss	%xmm8, tbuf.5050+292696(%rip)
	vmovups	%xmm4, tbuf.5050+292632(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+292648(%rip)
	vaddss	%xmm9, %xmm2, %xmm2
	vmovss	%xmm7, tbuf.5050+292580(%rip)
	vaddps	%ymm12, %ymm10, %ymm10
	vmovaps	%ymm5, tbuf.5050+292544(%rip)
	vmulss	tbuf.5050+98564(%rip), %xmm1, %xmm6
	vmovss	%xmm9, tbuf.5050+292588(%rip)
	vmulss	tbuf.5050+98572(%rip), %xmm1, %xmm1
	vaddss	tbuf.5050+292460(%rip), %xmm7, %xmm7
	vmovups	tbuf.5050+292424(%rip), %xmm4
	vextractf128	$0x1, %ymm10, tbuf.5050+292616(%rip)
	vinsertf128	$0x1, tbuf.5050+292440(%rip), %ymm4, %ymm4
	vaddss	%xmm3, %xmm6, %xmm3
	vmovss	%xmm6, tbuf.5050+292584(%rip)
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm1, tbuf.5050+292592(%rip)
	vmovups	%xmm10, tbuf.5050+292600(%rip)
	vaddps	%ymm5, %ymm4, %ymm4
	vmovss	%xmm7, tbuf.5050+292700(%rip)
	vmovups	%xmm4, tbuf.5050+292664(%rip)
	vextractf128	$0x1, %ymm4, tbuf.5050+292680(%rip)
	vmovss	%xmm3, tbuf.5050+292704(%rip)
	vmovss	%xmm2, tbuf.5050+292708(%rip)
	vmovss	%xmm0, tbuf.5050+292712(%rip)
	vmovss	296012(%rbx), %xmm0
	vsubss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+292716(%rip)
	vmovss	%xmm1, tbuf.5050+292720(%rip)
	vsubss	tbuf.5050+287392(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+292724(%rip)
	vsubss	tbuf.5050+287396(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+292728(%rip)
	vmovaps	%xmm0, %xmm1
.L612:
	vsubss	(%rax), %xmm0, %xmm0
	addq	$4, %rax
	vmovss	%xmm0, 5328(%rax)
	cmpq	$tbuf.5050+287508, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L612
	vmovss	tbuf.5050+287388(%rip), %xmm1
	movl	$tbuf.5050+287392, %eax
	vmulss	tbuf.5050+292720(%rip), %xmm1, %xmm0
	vmovss	tbuf.5050+287488(%rip), %xmm6
	vmovss	tbuf.5050+287492(%rip), %xmm5
	vmulss	tbuf.5050+292820(%rip), %xmm6, %xmm6
	vmovss	tbuf.5050+287496(%rip), %xmm4
	vmulss	tbuf.5050+292824(%rip), %xmm5, %xmm5
	vmovss	tbuf.5050+287500(%rip), %xmm3
	vmulss	tbuf.5050+292828(%rip), %xmm4, %xmm4
	vmovss	tbuf.5050+287504(%rip), %xmm2
	vmulss	tbuf.5050+292832(%rip), %xmm3, %xmm3
	vmulss	tbuf.5050+292836(%rip), %xmm2, %xmm2
	movq	%rax, %rcx
	vmovss	%xmm0, tbuf.5050+292840(%rip)
	vmovups	tbuf.5050+292724(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+292740(%rip), %ymm0, %ymm0
	vmovss	%xmm6, tbuf.5050+292940(%rip)
	vmovss	%xmm5, tbuf.5050+292944(%rip)
	vmovss	%xmm4, tbuf.5050+292948(%rip)
	vmovss	%xmm3, tbuf.5050+292952(%rip)
	vmulps	tbuf.5050+287392(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+292844(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+292860(%rip)
	vmovups	tbuf.5050+292756(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+292772(%rip), %ymm0, %ymm0
	vmulps	tbuf.5050+287424(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+292876(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+292892(%rip)
	vmovups	tbuf.5050+292788(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+292804(%rip), %ymm0, %ymm0
	vmulps	tbuf.5050+287456(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+292908(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+292924(%rip)
	vmovss	%xmm2, tbuf.5050+292956(%rip)
	vmulss	tbuf.5050+292696(%rip), %xmm6, %xmm6
	vmovups	tbuf.5050+292596(%rip), %xmm0
	vmulss	tbuf.5050+292700(%rip), %xmm5, %xmm5
	vmovups	tbuf.5050+292840(%rip), %xmm7
	vinsertf128	$0x1, tbuf.5050+292612(%rip), %ymm0, %ymm0
	vinsertf128	$0x1, tbuf.5050+292856(%rip), %ymm7, %ymm7
	vmovss	%xmm6, tbuf.5050+293060(%rip)
	vmulss	tbuf.5050+292704(%rip), %xmm4, %xmm4
	vmovss	%xmm5, tbuf.5050+293064(%rip)
	vmulss	tbuf.5050+292708(%rip), %xmm3, %xmm3
	vmulss	tbuf.5050+292712(%rip), %xmm2, %xmm2
	vmulps	%ymm7, %ymm0, %ymm0
	vmovups	tbuf.5050+292872(%rip), %xmm7
	vinsertf128	$0x1, tbuf.5050+292888(%rip), %ymm7, %ymm7
	vmovss	%xmm4, tbuf.5050+293068(%rip)
	vmovss	%xmm3, tbuf.5050+293072(%rip)
	vmovaps	%ymm0, tbuf.5050+292960(%rip)
	vmovss	%xmm2, tbuf.5050+293076(%rip)
	vmovups	tbuf.5050+292628(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+292644(%rip), %ymm0, %ymm0
	vmulps	%ymm7, %ymm0, %ymm0
	vmovups	tbuf.5050+292660(%rip), %xmm7
	vinsertf128	$0x1, tbuf.5050+292676(%rip), %ymm7, %ymm7
	vmovaps	%ymm0, tbuf.5050+292992(%rip)
	vmovups	tbuf.5050+292904(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+292920(%rip), %ymm0, %ymm0
	vmulps	%ymm7, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+293024(%rip)
	vmovss	tbuf.5050+292692(%rip), %xmm0
	vmulss	tbuf.5050+292936(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293056(%rip)
	vmovss	tbuf.5050+290156(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm0, tbuf.5050+293080(%rip)
	vmovss	%xmm1, tbuf.5050+293084(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L613:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 5692(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L613
	vmovups	tbuf.5050+293084(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vinsertf128	$0x1, tbuf.5050+293100(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97376(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+293204(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293220(%rip)
	vmovups	tbuf.5050+293116(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+293132(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97408(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+293236(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293252(%rip)
	vmovups	tbuf.5050+293148(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+293164(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97440(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+293268(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293284(%rip)
	vmovss	tbuf.5050+97472(%rip), %xmm0
	vsubss	tbuf.5050+293180(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293300(%rip)
	vmovss	tbuf.5050+97476(%rip), %xmm0
	vsubss	tbuf.5050+293184(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293304(%rip)
	vmovss	tbuf.5050+97480(%rip), %xmm0
	vsubss	tbuf.5050+293188(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293308(%rip)
	vmovss	tbuf.5050+97484(%rip), %xmm0
	vsubss	tbuf.5050+293192(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293312(%rip)
	vmovss	tbuf.5050+97488(%rip), %xmm0
	vsubss	tbuf.5050+293196(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293316(%rip)
	vmovss	tbuf.5050+97492(%rip), %xmm0
	vsubss	tbuf.5050+293200(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293320(%rip)
	vmovss	tbuf.5050+290160(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+293324(%rip)
	vmovss	%xmm1, tbuf.5050+293328(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L614:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 5936(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L614
	vmovss	tbuf.5050+97496(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vsubss	tbuf.5050+293328(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293448(%rip)
	vmovss	tbuf.5050+97500(%rip), %xmm0
	vsubss	tbuf.5050+293332(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293452(%rip)
	vmovups	tbuf.5050+293336(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+293352(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97504(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.5050+293456(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293472(%rip)
	vmovups	tbuf.5050+293368(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+293384(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97536(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.5050+293488(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293504(%rip)
	vmovups	tbuf.5050+293400(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+293416(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97568(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.5050+293520(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293536(%rip)
	vmovss	tbuf.5050+97600(%rip), %xmm0
	vsubss	tbuf.5050+293432(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293552(%rip)
	vmovss	tbuf.5050+97604(%rip), %xmm0
	vsubss	tbuf.5050+293436(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293556(%rip)
	vmovss	tbuf.5050+97608(%rip), %xmm0
	vsubss	tbuf.5050+293440(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293560(%rip)
	vmovss	tbuf.5050+97612(%rip), %xmm0
	vsubss	tbuf.5050+293444(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293564(%rip)
	vmovss	tbuf.5050+290164(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+293568(%rip)
	vmovss	%xmm1, tbuf.5050+293572(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L615:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 6180(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L615
	vmovss	tbuf.5050+97616(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vsubss	tbuf.5050+293572(%rip), %xmm0, %xmm0
	vmovups	tbuf.5050+293576(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+293592(%rip), %ymm1, %ymm1
	vmovss	%xmm0, tbuf.5050+293692(%rip)
	vmovups	tbuf.5050+97620(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+97636(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	tbuf.5050+293608(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+293624(%rip), %ymm1, %ymm1
	vmovaps	%ymm0, tbuf.5050+293696(%rip)
	vmovups	tbuf.5050+97652(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+97668(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	tbuf.5050+293640(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+293656(%rip), %ymm1, %ymm1
	vmovaps	%ymm0, tbuf.5050+293728(%rip)
	vmovups	tbuf.5050+97684(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+97700(%rip), %ymm0, %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+293760(%rip)
	vmovss	tbuf.5050+97716(%rip), %xmm0
	vsubss	tbuf.5050+293672(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293792(%rip)
	vmovss	tbuf.5050+97720(%rip), %xmm0
	vsubss	tbuf.5050+293676(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293796(%rip)
	vmovss	tbuf.5050+97724(%rip), %xmm0
	vsubss	tbuf.5050+293680(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293800(%rip)
	vmovss	tbuf.5050+97728(%rip), %xmm0
	vsubss	tbuf.5050+293684(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293804(%rip)
	vmovss	tbuf.5050+97732(%rip), %xmm0
	vsubss	tbuf.5050+293688(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293808(%rip)
	vmovss	tbuf.5050+290168(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+293812(%rip)
	vmovss	%xmm1, tbuf.5050+293816(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L616:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 6424(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L616
	vmovss	tbuf.5050+97736(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vsubss	tbuf.5050+293816(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293936(%rip)
	vmovss	tbuf.5050+97740(%rip), %xmm0
	vsubss	tbuf.5050+293820(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+293940(%rip)
	vmovaps	tbuf.5050+97744(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+97760(%rip), %ymm0, %ymm0
	vsubps	tbuf.5050+293824(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+293944(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293960(%rip)
	vmovaps	tbuf.5050+97776(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+97792(%rip), %ymm0, %ymm0
	vsubps	tbuf.5050+293856(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+293976(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+293992(%rip)
	vmovaps	tbuf.5050+97808(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+97824(%rip), %ymm0, %ymm0
	vsubps	tbuf.5050+293888(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294008(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294024(%rip)
	vmovss	tbuf.5050+97840(%rip), %xmm0
	vsubss	tbuf.5050+293920(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294040(%rip)
	vmovss	tbuf.5050+97844(%rip), %xmm0
	vsubss	tbuf.5050+293924(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294044(%rip)
	vmovss	tbuf.5050+97848(%rip), %xmm0
	vsubss	tbuf.5050+293928(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294048(%rip)
	vmovss	tbuf.5050+97852(%rip), %xmm0
	vsubss	tbuf.5050+293932(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294052(%rip)
	vmovss	tbuf.5050+290172(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+294056(%rip)
	vmovss	%xmm1, tbuf.5050+294060(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L617:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 6668(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L617
	vmovups	tbuf.5050+294060(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vinsertf128	$0x1, tbuf.5050+294076(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97856(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294180(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294196(%rip)
	vmovups	tbuf.5050+294092(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+294108(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97888(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294212(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294228(%rip)
	vmovups	tbuf.5050+294124(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+294140(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97920(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294244(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294260(%rip)
	vmovss	tbuf.5050+97952(%rip), %xmm0
	vsubss	tbuf.5050+294156(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294276(%rip)
	vmovss	tbuf.5050+97956(%rip), %xmm0
	vsubss	tbuf.5050+294160(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294280(%rip)
	vmovss	tbuf.5050+97960(%rip), %xmm0
	vsubss	tbuf.5050+294164(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294284(%rip)
	vmovss	tbuf.5050+97964(%rip), %xmm0
	vsubss	tbuf.5050+294168(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294288(%rip)
	vmovss	tbuf.5050+97968(%rip), %xmm0
	vsubss	tbuf.5050+294172(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294292(%rip)
	vmovss	tbuf.5050+97972(%rip), %xmm0
	vsubss	tbuf.5050+294176(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294296(%rip)
	vmovss	tbuf.5050+290176(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+294300(%rip)
	vmovss	%xmm1, tbuf.5050+294304(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L618:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 6912(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L618
	vmovss	tbuf.5050+97976(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vsubss	tbuf.5050+294304(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294424(%rip)
	vmovss	tbuf.5050+97980(%rip), %xmm0
	vsubss	tbuf.5050+294308(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294428(%rip)
	vmovups	tbuf.5050+294312(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+294328(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+97984(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+294432(%rip)
	vmovups	tbuf.5050+294344(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+294360(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98016(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+294464(%rip)
	vmovups	tbuf.5050+294376(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+294392(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98048(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, tbuf.5050+294496(%rip)
	vmovss	tbuf.5050+98080(%rip), %xmm0
	vsubss	tbuf.5050+294408(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294528(%rip)
	vmovss	tbuf.5050+98084(%rip), %xmm0
	vsubss	tbuf.5050+294412(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294532(%rip)
	vmovss	tbuf.5050+98088(%rip), %xmm0
	vsubss	tbuf.5050+294416(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294536(%rip)
	vmovss	tbuf.5050+98092(%rip), %xmm0
	vsubss	tbuf.5050+294420(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294540(%rip)
	vmovss	tbuf.5050+290180(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294544(%rip)
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+294548(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L619:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 7156(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L619
	vmovss	tbuf.5050+98096(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vsubss	tbuf.5050+294548(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294668(%rip)
	vmovss	tbuf.5050+98100(%rip), %xmm0
	vsubss	tbuf.5050+294552(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294672(%rip)
	vmovss	tbuf.5050+98104(%rip), %xmm0
	vsubss	tbuf.5050+294556(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294676(%rip)
	vmovups	tbuf.5050+98108(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+98124(%rip), %ymm0, %ymm0
	vsubps	tbuf.5050+294560(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294680(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294696(%rip)
	vmovups	tbuf.5050+98140(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+98156(%rip), %ymm0, %ymm0
	vsubps	tbuf.5050+294592(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294712(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294728(%rip)
	vmovups	tbuf.5050+98172(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+98188(%rip), %ymm0, %ymm0
	vsubps	tbuf.5050+294624(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294744(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294760(%rip)
	vmovss	tbuf.5050+98204(%rip), %xmm0
	vsubss	tbuf.5050+294656(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294776(%rip)
	vmovss	tbuf.5050+98208(%rip), %xmm0
	vsubss	tbuf.5050+294660(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294780(%rip)
	vmovss	tbuf.5050+98212(%rip), %xmm0
	vsubss	tbuf.5050+294664(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294784(%rip)
	vmovss	tbuf.5050+290184(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+294788(%rip)
	vmovss	%xmm1, tbuf.5050+294792(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L620:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 7400(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L620
	vmovss	tbuf.5050+98216(%rip), %xmm0
	movl	$tbuf.5050+287392, %ecx
	vsubss	tbuf.5050+294792(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294912(%rip)
	vmovss	tbuf.5050+98220(%rip), %xmm0
	vsubss	tbuf.5050+294796(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294916(%rip)
	vmovss	tbuf.5050+98224(%rip), %xmm0
	vsubss	tbuf.5050+294800(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294920(%rip)
	vmovss	tbuf.5050+98228(%rip), %xmm0
	vsubss	tbuf.5050+294804(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294924(%rip)
	vmovss	tbuf.5050+98232(%rip), %xmm0
	vsubss	tbuf.5050+294808(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294928(%rip)
	vmovss	tbuf.5050+98236(%rip), %xmm0
	vsubss	tbuf.5050+294812(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+294932(%rip)
	vmovaps	tbuf.5050+98240(%rip), %ymm0
	vsubps	tbuf.5050+294816(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294936(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294952(%rip)
	vmovaps	tbuf.5050+98272(%rip), %ymm0
	vsubps	tbuf.5050+294848(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+294968(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+294984(%rip)
	vmovaps	tbuf.5050+98304(%rip), %ymm0
	vsubps	tbuf.5050+294880(%rip), %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+295000(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+295016(%rip)
	vmovss	tbuf.5050+290188(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295032(%rip)
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+295036(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L621:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 7644(%rcx)
	cmpq	$tbuf.5050+287508, %rcx
	vmovaps	%xmm1, %xmm0
	jne	.L621
	vmovups	tbuf.5050+295036(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+295052(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98336(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+295156(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+295172(%rip)
	vmovups	tbuf.5050+295068(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+295084(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98368(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+295188(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+295204(%rip)
	vmovups	tbuf.5050+295100(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+295116(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98400(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, tbuf.5050+295220(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+295236(%rip)
	vmovss	tbuf.5050+98432(%rip), %xmm0
	vsubss	tbuf.5050+295132(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295252(%rip)
	vmovss	tbuf.5050+98436(%rip), %xmm0
	vsubss	tbuf.5050+295136(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295256(%rip)
	vmovss	tbuf.5050+98440(%rip), %xmm0
	vsubss	tbuf.5050+295140(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295260(%rip)
	vmovss	tbuf.5050+98444(%rip), %xmm0
	vsubss	tbuf.5050+295144(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295264(%rip)
	vmovss	tbuf.5050+98448(%rip), %xmm0
	vsubss	tbuf.5050+295148(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295268(%rip)
	vmovss	tbuf.5050+98452(%rip), %xmm0
	vsubss	tbuf.5050+295152(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295272(%rip)
	vmovss	tbuf.5050+290192(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050+287388(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+295276(%rip)
	vmovss	%xmm1, tbuf.5050+295280(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L622:
	vmulss	(%rax), %xmm0, %xmm0
	addq	$4, %rax
	vmovss	%xmm0, 7888(%rax)
	cmpq	$tbuf.5050+287508, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L622
	vmovss	tbuf.5050+98456(%rip), %xmm0
	movl	$tbuf.5050+4, %ecx
	vsubss	tbuf.5050+295280(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+3136, %eax
	movq	%rcx, %rdi
	vmovss	%xmm0, tbuf.5050+295400(%rip)
	vmovss	tbuf.5050+98460(%rip), %xmm0
	vsubss	tbuf.5050+295284(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295404(%rip)
	vmovups	tbuf.5050+295288(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+295304(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98464(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.5050+295408(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+295424(%rip)
	vmovups	tbuf.5050+295320(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+295336(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98496(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.5050+295440(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+295456(%rip)
	vmovups	tbuf.5050+295352(%rip), %xmm0
	vinsertf128	$0x1, tbuf.5050+295368(%rip), %ymm0, %ymm1
	vmovaps	tbuf.5050+98528(%rip), %ymm0
	vsubps	%ymm1, %ymm0, %ymm0
	vmovaps	%xmm0, tbuf.5050+295472(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+295488(%rip)
	vmovss	tbuf.5050+98560(%rip), %xmm0
	vsubss	tbuf.5050+295384(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295504(%rip)
	vmovss	tbuf.5050+98564(%rip), %xmm0
	vsubss	tbuf.5050+295388(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295508(%rip)
	vmovss	tbuf.5050+98568(%rip), %xmm0
	vsubss	tbuf.5050+295392(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295512(%rip)
	vmovss	tbuf.5050+98572(%rip), %xmm0
	vsubss	tbuf.5050+295396(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+295516(%rip)
	vmovups	tbuf.5050+290156(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+290172(%rip), %ymm1, %ymm1
	vmovss	tbuf.5050+98576(%rip), %xmm0
	vbroadcastss	%xmm0, %ymm2
	vmulss	tbuf.5050+290192(%rip), %xmm0, %xmm3
	vmulss	tbuf.5050+290188(%rip), %xmm0, %xmm4
	vmulss	tbuf.5050+292960(%rip), %xmm0, %xmm0
	vmulps	%ymm2, %ymm1, %ymm2
	vmovups	tbuf.5050+3256(%rip), %xmm1
	vinsertf128	$0x1, tbuf.5050+3272(%rip), %ymm1, %ymm1
	vmovss	%xmm3, tbuf.5050+295556(%rip)
	vmovss	%xmm4, tbuf.5050+295552(%rip)
	vmovaps	%ymm2, tbuf.5050+295520(%rip)
	vmovss	%xmm0, tbuf.5050+295600(%rip)
	vsubps	%ymm2, %ymm1, %ymm1
	vmovss	tbuf.5050+3288(%rip), %xmm2
	vsubss	%xmm4, %xmm2, %xmm2
	vmovups	%xmm1, tbuf.5050+295560(%rip)
	vextractf128	$0x1, %ymm1, tbuf.5050+295576(%rip)
	vmovss	%xmm2, tbuf.5050+295592(%rip)
	vmovss	tbuf.5050+3292(%rip), %xmm1
	vsubss	%xmm3, %xmm1, %xmm1
	vmovss	%xmm1, tbuf.5050+295596(%rip)
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+295604(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L623:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 295600(%rdi)
	cmpq	%rdi, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L623
	vmovss	tbuf.5050+3296(%rip), %xmm0
	movl	$tbuf.5050+3308, %edi
	vsubss	tbuf.5050+295604(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+298740(%rip)
	vmovss	tbuf.5050+3300(%rip), %xmm0
	vsubss	tbuf.5050+295608(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+298744(%rip)
	vmovss	tbuf.5050+3304(%rip), %xmm0
	vsubss	tbuf.5050+295612(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+298748(%rip)
	.p2align 4,,10
	.p2align 3
.L624:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	292276(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 295412(%rdi)
	cmpq	$tbuf.5050+6412, %rdi
	jne	.L624
	vmovss	tbuf.5050+6412(%rip), %xmm0
	movl	$tbuf.5050+4, %edi
	vsubss	tbuf.5050+298720(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+301856(%rip)
	vmovss	tbuf.5050+6416(%rip), %xmm0
	vsubss	tbuf.5050+298724(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+301860(%rip)
	vmovss	tbuf.5050+6420(%rip), %xmm0
	vsubss	tbuf.5050+298728(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+301864(%rip)
	vmovss	tbuf.5050+6424(%rip), %xmm0
	vsubss	tbuf.5050+298732(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+301868(%rip)
	vmovss	tbuf.5050+6428(%rip), %xmm0
	vsubss	tbuf.5050+298736(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+301872(%rip)
	vmovss	tbuf.5050+292964(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+301876(%rip)
	vmovss	%xmm1, tbuf.5050+301880(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L625:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 301876(%rdi)
	cmpq	%rdi, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L625
	vmovss	tbuf.5050+6432(%rip), %xmm0
	movl	$tbuf.5050+6440, %edi
	vsubss	tbuf.5050+301880(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+9544, %r8d
	vmovss	%xmm0, tbuf.5050+305016(%rip)
	vmovss	tbuf.5050+6436(%rip), %xmm0
	vsubss	tbuf.5050+301884(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+305020(%rip)
	.p2align 4,,10
	.p2align 3
.L626:
	vmovups	(%rdi), %xmm0
	addq	$32, %rdi
	vinsertf128	$0x1, -16(%rdi), %ymm0, %ymm0
	vsubps	295416(%rdi), %ymm0, %ymm0
	vmovaps	%ymm0, 298552(%rdi)
	cmpq	%rdi, %r8
	jne	.L626
	vmovss	tbuf.5050+9544(%rip), %xmm0
	movl	$tbuf.5050+4, %edi
	vsubss	tbuf.5050+304992(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+308128(%rip)
	vmovss	tbuf.5050+9548(%rip), %xmm0
	vsubss	tbuf.5050+304996(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+308132(%rip)
	vmovss	tbuf.5050+9552(%rip), %xmm0
	vsubss	tbuf.5050+305000(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+308136(%rip)
	vmovss	tbuf.5050+9556(%rip), %xmm0
	vsubss	tbuf.5050+305004(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+308140(%rip)
	vmovss	tbuf.5050+9560(%rip), %xmm0
	vsubss	tbuf.5050+305008(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+308144(%rip)
	vmovss	tbuf.5050+9564(%rip), %xmm0
	vsubss	tbuf.5050+305012(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+308148(%rip)
	vmovss	tbuf.5050+292968(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+308152(%rip)
	vmovss	%xmm1, tbuf.5050+308156(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L627:
	vmulss	(%rdi), %xmm0, %xmm0
	addq	$4, %rdi
	vmovss	%xmm0, 308152(%rdi)
	cmpq	%rdi, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L627
	vmovss	tbuf.5050+9568(%rip), %xmm0
	vsubss	tbuf.5050+308156(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+311292(%rip)
	.p2align 4,,10
	.p2align 3
.L628:
	vmovups	(%r15), %xmm0
	addq	$32, %r15
	vinsertf128	$0x1, -16(%r15), %ymm0, %ymm0
	vsubps	298556(%r15), %ymm0, %ymm0
	vmovaps	%ymm0, 301692(%r15)
	cmpq	$tbuf.5050+12676, %r15
	jne	.L628
	vmovss	tbuf.5050+12676(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+311264(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+314400(%rip)
	vmovss	tbuf.5050+12680(%rip), %xmm0
	vsubss	tbuf.5050+311268(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+314404(%rip)
	vmovss	tbuf.5050+12684(%rip), %xmm0
	vsubss	tbuf.5050+311272(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+314408(%rip)
	vmovss	tbuf.5050+12688(%rip), %xmm0
	vsubss	tbuf.5050+311276(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+314412(%rip)
	vmovss	tbuf.5050+12692(%rip), %xmm0
	vsubss	tbuf.5050+311280(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+314416(%rip)
	vmovss	tbuf.5050+12696(%rip), %xmm0
	vsubss	tbuf.5050+311284(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+314420(%rip)
	vmovss	tbuf.5050+12700(%rip), %xmm0
	vsubss	tbuf.5050+311288(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+314424(%rip)
	vmovss	tbuf.5050+292972(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+314428(%rip)
	vmovss	%xmm1, tbuf.5050+314432(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L629:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 314428(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L629
	movl	$tbuf.5050+12704, %edx
	.p2align 4,,10
	.p2align 3
.L630:
	vmovaps	(%rdx), %ymm0
	addq	$32, %rdx
	vsubps	301696(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 304832(%rdx)
	cmpq	$tbuf.5050+15840, %rdx
	jne	.L630
	vmovss	tbuf.5050+292976(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+320704(%rip)
	vmovss	%xmm1, tbuf.5050+320708(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L631:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 320704(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L631
	vmovss	tbuf.5050+15840(%rip), %xmm0
	movl	$tbuf.5050+15868, %edx
	vsubss	tbuf.5050+320708(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+323844(%rip)
	vmovss	tbuf.5050+15844(%rip), %xmm0
	vsubss	tbuf.5050+320712(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+323848(%rip)
	vmovss	tbuf.5050+15848(%rip), %xmm0
	vsubss	tbuf.5050+320716(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+323852(%rip)
	vmovss	tbuf.5050+15852(%rip), %xmm0
	vsubss	tbuf.5050+320720(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+323856(%rip)
	vmovss	tbuf.5050+15856(%rip), %xmm0
	vsubss	tbuf.5050+320724(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+323860(%rip)
	vmovss	tbuf.5050+15860(%rip), %xmm0
	vsubss	tbuf.5050+320728(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+323864(%rip)
	vmovss	tbuf.5050+15864(%rip), %xmm0
	vsubss	tbuf.5050+320732(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+323868(%rip)
	.p2align 4,,10
	.p2align 3
.L632:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	304836(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 307972(%rdx)
	cmpq	$tbuf.5050+18972, %rdx
	jne	.L632
	vmovss	tbuf.5050+18972(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+323840(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+326976(%rip)
	vmovss	tbuf.5050+292980(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+326980(%rip)
	vmovss	%xmm1, tbuf.5050+326984(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L633:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 326980(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L633
	vmovss	tbuf.5050+18976(%rip), %xmm0
	movl	$tbuf.5050+19000, %edx
	vsubss	tbuf.5050+326984(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+330120(%rip)
	vmovss	tbuf.5050+18980(%rip), %xmm0
	vsubss	tbuf.5050+326988(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+330124(%rip)
	vmovss	tbuf.5050+18984(%rip), %xmm0
	vsubss	tbuf.5050+326992(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+330128(%rip)
	vmovss	tbuf.5050+18988(%rip), %xmm0
	vsubss	tbuf.5050+326996(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+330132(%rip)
	vmovss	tbuf.5050+18992(%rip), %xmm0
	vsubss	tbuf.5050+327000(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+330136(%rip)
	vmovss	tbuf.5050+18996(%rip), %xmm0
	vsubss	tbuf.5050+327004(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+330140(%rip)
	.p2align 4,,10
	.p2align 3
.L634:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	307976(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 311112(%rdx)
	cmpq	$tbuf.5050+22104, %rdx
	jne	.L634
	vmovss	tbuf.5050+22104(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+330112(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+333248(%rip)
	vmovss	tbuf.5050+22108(%rip), %xmm0
	vsubss	tbuf.5050+330116(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+333252(%rip)
	vmovss	tbuf.5050+292984(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+333256(%rip)
	vmovss	%xmm1, tbuf.5050+333260(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L635:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 333256(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L635
	vmovss	tbuf.5050+22112(%rip), %xmm0
	movl	$tbuf.5050+22132, %edx
	vsubss	tbuf.5050+333260(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+336396(%rip)
	vmovss	tbuf.5050+22116(%rip), %xmm0
	vsubss	tbuf.5050+333264(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+336400(%rip)
	vmovss	tbuf.5050+22120(%rip), %xmm0
	vsubss	tbuf.5050+333268(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+336404(%rip)
	vmovss	tbuf.5050+22124(%rip), %xmm0
	vsubss	tbuf.5050+333272(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+336408(%rip)
	vmovss	tbuf.5050+22128(%rip), %xmm0
	vsubss	tbuf.5050+333276(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+336412(%rip)
	.p2align 4,,10
	.p2align 3
.L636:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	311116(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 314252(%rdx)
	cmpq	$tbuf.5050+25236, %rdx
	jne	.L636
	vmovss	tbuf.5050+25236(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+336384(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+339520(%rip)
	vmovss	tbuf.5050+25240(%rip), %xmm0
	vsubss	tbuf.5050+336388(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+339524(%rip)
	vmovss	tbuf.5050+25244(%rip), %xmm0
	vsubss	tbuf.5050+336392(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+339528(%rip)
	vmovss	tbuf.5050+292988(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+339532(%rip)
	vmovss	%xmm1, tbuf.5050+339536(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L637:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 339532(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L637
	vmovss	tbuf.5050+25248(%rip), %xmm0
	movl	$tbuf.5050+25264, %edx
	vsubss	tbuf.5050+339536(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+342672(%rip)
	vmovss	tbuf.5050+25252(%rip), %xmm0
	vsubss	tbuf.5050+339540(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+342676(%rip)
	vmovss	tbuf.5050+25256(%rip), %xmm0
	vsubss	tbuf.5050+339544(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+342680(%rip)
	vmovss	tbuf.5050+25260(%rip), %xmm0
	vsubss	tbuf.5050+339548(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+342684(%rip)
	.p2align 4,,10
	.p2align 3
.L638:
	vmovaps	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	314256(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 317392(%rdx)
	cmpq	$tbuf.5050+28368, %rdx
	jne	.L638
	vmovss	tbuf.5050+28368(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+342656(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+345792(%rip)
	vmovss	tbuf.5050+28372(%rip), %xmm0
	vsubss	tbuf.5050+342660(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+345796(%rip)
	vmovss	tbuf.5050+28376(%rip), %xmm0
	vsubss	tbuf.5050+342664(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+345800(%rip)
	vmovss	tbuf.5050+28380(%rip), %xmm0
	vsubss	tbuf.5050+342668(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+345804(%rip)
	vmovss	tbuf.5050+292992(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+345808(%rip)
	vmovss	%xmm1, tbuf.5050+345812(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L639:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 345808(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L639
	vmovss	tbuf.5050+28384(%rip), %xmm0
	movl	$tbuf.5050+28396, %edx
	vsubss	tbuf.5050+345812(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+348948(%rip)
	vmovss	tbuf.5050+28388(%rip), %xmm0
	vsubss	tbuf.5050+345816(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+348952(%rip)
	vmovss	tbuf.5050+28392(%rip), %xmm0
	vsubss	tbuf.5050+345820(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+348956(%rip)
	.p2align 4,,10
	.p2align 3
.L640:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	317396(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 320532(%rdx)
	cmpq	$tbuf.5050+31500, %rdx
	jne	.L640
	vmovss	tbuf.5050+31500(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+348928(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+352064(%rip)
	vmovss	tbuf.5050+31504(%rip), %xmm0
	vsubss	tbuf.5050+348932(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+352068(%rip)
	vmovss	tbuf.5050+31508(%rip), %xmm0
	vsubss	tbuf.5050+348936(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+352072(%rip)
	vmovss	tbuf.5050+31512(%rip), %xmm0
	vsubss	tbuf.5050+348940(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+352076(%rip)
	vmovss	tbuf.5050+31516(%rip), %xmm0
	vsubss	tbuf.5050+348944(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+352080(%rip)
	vmovss	tbuf.5050+292996(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+352084(%rip)
	vmovss	%xmm1, tbuf.5050+352088(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L641:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 352084(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L641
	vmovss	tbuf.5050+31520(%rip), %xmm0
	movl	$tbuf.5050+31528, %edx
	vsubss	tbuf.5050+352088(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+34632, %edi
	vmovss	%xmm0, tbuf.5050+355224(%rip)
	vmovss	tbuf.5050+31524(%rip), %xmm0
	vsubss	tbuf.5050+352092(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+355228(%rip)
	.p2align 4,,10
	.p2align 3
.L642:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	320536(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 323672(%rdx)
	cmpq	%rdx, %rdi
	jne	.L642
	vmovss	tbuf.5050+34632(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+355200(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+358336(%rip)
	vmovss	tbuf.5050+34636(%rip), %xmm0
	vsubss	tbuf.5050+355204(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+358340(%rip)
	vmovss	tbuf.5050+34640(%rip), %xmm0
	vsubss	tbuf.5050+355208(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+358344(%rip)
	vmovss	tbuf.5050+34644(%rip), %xmm0
	vsubss	tbuf.5050+355212(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+358348(%rip)
	vmovss	tbuf.5050+34648(%rip), %xmm0
	vsubss	tbuf.5050+355216(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+358352(%rip)
	vmovss	tbuf.5050+34652(%rip), %xmm0
	vsubss	tbuf.5050+355220(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+358356(%rip)
	vmovss	tbuf.5050+293000(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+358360(%rip)
	vmovss	%xmm1, tbuf.5050+358364(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L643:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 358360(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L643
	vmovss	tbuf.5050+34656(%rip), %xmm0
	vsubss	tbuf.5050+358364(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+361500(%rip)
	.p2align 4,,10
	.p2align 3
.L644:
	vmovups	(%r14), %xmm0
	addq	$32, %r14
	vinsertf128	$0x1, -16(%r14), %ymm0, %ymm0
	vsubps	323676(%r14), %ymm0, %ymm0
	vmovaps	%ymm0, 326812(%r14)
	cmpq	$tbuf.5050+37764, %r14
	jne	.L644
	vmovss	tbuf.5050+37764(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+361472(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+364608(%rip)
	vmovss	tbuf.5050+37768(%rip), %xmm0
	vsubss	tbuf.5050+361476(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+364612(%rip)
	vmovss	tbuf.5050+37772(%rip), %xmm0
	vsubss	tbuf.5050+361480(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+364616(%rip)
	vmovss	tbuf.5050+37776(%rip), %xmm0
	vsubss	tbuf.5050+361484(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+364620(%rip)
	vmovss	tbuf.5050+37780(%rip), %xmm0
	vsubss	tbuf.5050+361488(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+364624(%rip)
	vmovss	tbuf.5050+37784(%rip), %xmm0
	vsubss	tbuf.5050+361492(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+364628(%rip)
	vmovss	tbuf.5050+37788(%rip), %xmm0
	vsubss	tbuf.5050+361496(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+364632(%rip)
	vmovss	tbuf.5050+293004(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+364636(%rip)
	vmovss	%xmm1, tbuf.5050+364640(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L645:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 364636(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L645
	movl	$tbuf.5050+37792, %edx
	.p2align 4,,10
	.p2align 3
.L646:
	vmovaps	(%rdx), %ymm0
	addq	$32, %rdx
	vsubps	326816(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 329952(%rdx)
	cmpq	$tbuf.5050+40928, %rdx
	jne	.L646
	vmovss	tbuf.5050+293008(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+370912(%rip)
	vmovss	%xmm1, tbuf.5050+370916(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L647:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 370912(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L647
	vmovss	tbuf.5050+40928(%rip), %xmm0
	movl	$tbuf.5050+40956, %edx
	vsubss	tbuf.5050+370916(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+374052(%rip)
	vmovss	tbuf.5050+40932(%rip), %xmm0
	vsubss	tbuf.5050+370920(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+374056(%rip)
	vmovss	tbuf.5050+40936(%rip), %xmm0
	vsubss	tbuf.5050+370924(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+374060(%rip)
	vmovss	tbuf.5050+40940(%rip), %xmm0
	vsubss	tbuf.5050+370928(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+374064(%rip)
	vmovss	tbuf.5050+40944(%rip), %xmm0
	vsubss	tbuf.5050+370932(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+374068(%rip)
	vmovss	tbuf.5050+40948(%rip), %xmm0
	vsubss	tbuf.5050+370936(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+374072(%rip)
	vmovss	tbuf.5050+40952(%rip), %xmm0
	vsubss	tbuf.5050+370940(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+374076(%rip)
	.p2align 4,,10
	.p2align 3
.L648:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	329956(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 333092(%rdx)
	cmpq	$tbuf.5050+44060, %rdx
	jne	.L648
	vmovss	tbuf.5050+44060(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+374048(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+377184(%rip)
	vmovss	tbuf.5050+293012(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+377188(%rip)
	vmovss	%xmm1, tbuf.5050+377192(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L649:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 377188(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L649
	vmovss	tbuf.5050+44064(%rip), %xmm0
	movl	$tbuf.5050+44088, %edx
	vsubss	tbuf.5050+377192(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+380328(%rip)
	vmovss	tbuf.5050+44068(%rip), %xmm0
	vsubss	tbuf.5050+377196(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+380332(%rip)
	vmovss	tbuf.5050+44072(%rip), %xmm0
	vsubss	tbuf.5050+377200(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+380336(%rip)
	vmovss	tbuf.5050+44076(%rip), %xmm0
	vsubss	tbuf.5050+377204(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+380340(%rip)
	vmovss	tbuf.5050+44080(%rip), %xmm0
	vsubss	tbuf.5050+377208(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+380344(%rip)
	vmovss	tbuf.5050+44084(%rip), %xmm0
	vsubss	tbuf.5050+377212(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+380348(%rip)
	.p2align 4,,10
	.p2align 3
.L650:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	333096(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 336232(%rdx)
	cmpq	$tbuf.5050+47192, %rdx
	jne	.L650
	vmovss	tbuf.5050+47192(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+380320(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+383456(%rip)
	vmovss	tbuf.5050+47196(%rip), %xmm0
	vsubss	tbuf.5050+380324(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+383460(%rip)
	vmovss	tbuf.5050+293016(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+383464(%rip)
	vmovss	%xmm1, tbuf.5050+383468(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L651:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 383464(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L651
	vmovss	tbuf.5050+47200(%rip), %xmm0
	movl	$tbuf.5050+47220, %edx
	vsubss	tbuf.5050+383468(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+386604(%rip)
	vmovss	tbuf.5050+47204(%rip), %xmm0
	vsubss	tbuf.5050+383472(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+386608(%rip)
	vmovss	tbuf.5050+47208(%rip), %xmm0
	vsubss	tbuf.5050+383476(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+386612(%rip)
	vmovss	tbuf.5050+47212(%rip), %xmm0
	vsubss	tbuf.5050+383480(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+386616(%rip)
	vmovss	tbuf.5050+47216(%rip), %xmm0
	vsubss	tbuf.5050+383484(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+386620(%rip)
	.p2align 4,,10
	.p2align 3
.L652:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	336236(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 339372(%rdx)
	cmpq	$tbuf.5050+50324, %rdx
	jne	.L652
	vmovss	tbuf.5050+50324(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+386592(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+389728(%rip)
	vmovss	tbuf.5050+50328(%rip), %xmm0
	vsubss	tbuf.5050+386596(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+389732(%rip)
	vmovss	tbuf.5050+50332(%rip), %xmm0
	vsubss	tbuf.5050+386600(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+389736(%rip)
	vmovss	tbuf.5050+293020(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+389740(%rip)
	vmovss	%xmm1, tbuf.5050+389744(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L653:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 389740(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L653
	vmovss	tbuf.5050+50336(%rip), %xmm0
	movl	$tbuf.5050+50352, %edx
	vsubss	tbuf.5050+389744(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+392880(%rip)
	vmovss	tbuf.5050+50340(%rip), %xmm0
	vsubss	tbuf.5050+389748(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+392884(%rip)
	vmovss	tbuf.5050+50344(%rip), %xmm0
	vsubss	tbuf.5050+389752(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+392888(%rip)
	vmovss	tbuf.5050+50348(%rip), %xmm0
	vsubss	tbuf.5050+389756(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+392892(%rip)
	.p2align 4,,10
	.p2align 3
.L654:
	vmovaps	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	339376(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 342512(%rdx)
	cmpq	$tbuf.5050+53456, %rdx
	jne	.L654
	vmovss	tbuf.5050+53456(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+392864(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+396000(%rip)
	vmovss	tbuf.5050+53460(%rip), %xmm0
	vsubss	tbuf.5050+392868(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+396004(%rip)
	vmovss	tbuf.5050+53464(%rip), %xmm0
	vsubss	tbuf.5050+392872(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+396008(%rip)
	vmovss	tbuf.5050+53468(%rip), %xmm0
	vsubss	tbuf.5050+392876(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+396012(%rip)
	vmovss	tbuf.5050+293024(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+396016(%rip)
	vmovss	%xmm1, tbuf.5050+396020(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L655:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 396016(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L655
	vmovss	tbuf.5050+53472(%rip), %xmm0
	movl	$tbuf.5050+53484, %edx
	vsubss	tbuf.5050+396020(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+399156(%rip)
	vmovss	tbuf.5050+53476(%rip), %xmm0
	vsubss	tbuf.5050+396024(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+399160(%rip)
	vmovss	tbuf.5050+53480(%rip), %xmm0
	vsubss	tbuf.5050+396028(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+399164(%rip)
	.p2align 4,,10
	.p2align 3
.L656:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	342516(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 345652(%rdx)
	cmpq	$tbuf.5050+56588, %rdx
	jne	.L656
	vmovss	tbuf.5050+56588(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+399136(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+402272(%rip)
	vmovss	tbuf.5050+56592(%rip), %xmm0
	vsubss	tbuf.5050+399140(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+402276(%rip)
	vmovss	tbuf.5050+56596(%rip), %xmm0
	vsubss	tbuf.5050+399144(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+402280(%rip)
	vmovss	tbuf.5050+56600(%rip), %xmm0
	vsubss	tbuf.5050+399148(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+402284(%rip)
	vmovss	tbuf.5050+56604(%rip), %xmm0
	vsubss	tbuf.5050+399152(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+402288(%rip)
	vmovss	tbuf.5050+293028(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+402292(%rip)
	vmovss	%xmm1, tbuf.5050+402296(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L657:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 402292(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L657
	vmovss	tbuf.5050+56608(%rip), %xmm0
	movl	$tbuf.5050+56616, %edx
	vsubss	tbuf.5050+402296(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+405432(%rip)
	vmovss	tbuf.5050+56612(%rip), %xmm0
	vsubss	tbuf.5050+402300(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+405436(%rip)
	.p2align 4,,10
	.p2align 3
.L658:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	345656(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 348792(%rdx)
	cmpq	$tbuf.5050+59720, %rdx
	jne	.L658
	vmovss	tbuf.5050+59720(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+405408(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+408544(%rip)
	vmovss	tbuf.5050+59724(%rip), %xmm0
	vsubss	tbuf.5050+405412(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+408548(%rip)
	vmovss	tbuf.5050+59728(%rip), %xmm0
	vsubss	tbuf.5050+405416(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+408552(%rip)
	vmovss	tbuf.5050+59732(%rip), %xmm0
	vsubss	tbuf.5050+405420(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+408556(%rip)
	vmovss	tbuf.5050+59736(%rip), %xmm0
	vsubss	tbuf.5050+405424(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+408560(%rip)
	vmovss	tbuf.5050+59740(%rip), %xmm0
	vsubss	tbuf.5050+405428(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+408564(%rip)
	vmovss	tbuf.5050+293032(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+408568(%rip)
	vmovss	%xmm1, tbuf.5050+408572(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L659:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 408568(%rdx)
	cmpq	$tbuf.5050+3136, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L659
	vmovss	tbuf.5050+59744(%rip), %xmm0
	vsubss	tbuf.5050+408572(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+411708(%rip)
	.p2align 4,,10
	.p2align 3
.L660:
	vmovups	0(%r13), %xmm0
	addq	$32, %r13
	vinsertf128	$0x1, -16(%r13), %ymm0, %ymm0
	vsubps	348796(%r13), %ymm0, %ymm0
	vmovaps	%ymm0, 351932(%r13)
	cmpq	$tbuf.5050+62852, %r13
	jne	.L660
	vmovss	tbuf.5050+62852(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+411680(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+414816(%rip)
	vmovss	tbuf.5050+62856(%rip), %xmm0
	vsubss	tbuf.5050+411684(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+414820(%rip)
	vmovss	tbuf.5050+62860(%rip), %xmm0
	vsubss	tbuf.5050+411688(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+414824(%rip)
	vmovss	tbuf.5050+62864(%rip), %xmm0
	vsubss	tbuf.5050+411692(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+414828(%rip)
	vmovss	tbuf.5050+62868(%rip), %xmm0
	vsubss	tbuf.5050+411696(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+414832(%rip)
	vmovss	tbuf.5050+62872(%rip), %xmm0
	vsubss	tbuf.5050+411700(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+414836(%rip)
	vmovss	tbuf.5050+62876(%rip), %xmm0
	vsubss	tbuf.5050+411704(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+414840(%rip)
	vmovss	tbuf.5050+293036(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+414844(%rip)
	vmovss	%xmm1, tbuf.5050+414848(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L661:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 414844(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L661
	movl	$tbuf.5050+62880, %edx
	movl	$tbuf.5050+66016, %edi
	.p2align 4,,10
	.p2align 3
.L662:
	vmovaps	(%rdx), %ymm0
	addq	$32, %rdx
	vsubps	351936(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 355072(%rdx)
	cmpq	%rdx, %rdi
	jne	.L662
	vmovss	tbuf.5050+293040(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+421120(%rip)
	vmovss	%xmm1, tbuf.5050+421124(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L663:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 421120(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L663
	vmovss	tbuf.5050+66016(%rip), %xmm0
	movl	$tbuf.5050+66044, %edx
	vsubss	tbuf.5050+421124(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+69148, %edi
	vmovss	%xmm0, tbuf.5050+424260(%rip)
	vmovss	tbuf.5050+66020(%rip), %xmm0
	vsubss	tbuf.5050+421128(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+424264(%rip)
	vmovss	tbuf.5050+66024(%rip), %xmm0
	vsubss	tbuf.5050+421132(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+424268(%rip)
	vmovss	tbuf.5050+66028(%rip), %xmm0
	vsubss	tbuf.5050+421136(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+424272(%rip)
	vmovss	tbuf.5050+66032(%rip), %xmm0
	vsubss	tbuf.5050+421140(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+424276(%rip)
	vmovss	tbuf.5050+66036(%rip), %xmm0
	vsubss	tbuf.5050+421144(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+424280(%rip)
	vmovss	tbuf.5050+66040(%rip), %xmm0
	vsubss	tbuf.5050+421148(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+424284(%rip)
	.p2align 4,,10
	.p2align 3
.L664:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	355076(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 358212(%rdx)
	cmpq	%rdx, %rdi
	jne	.L664
	vmovss	tbuf.5050+69148(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+424256(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+427392(%rip)
	vmovss	tbuf.5050+293044(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+427396(%rip)
	vmovss	%xmm1, tbuf.5050+427400(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L665:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 427396(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L665
	vmovss	tbuf.5050+69152(%rip), %xmm0
	movl	$tbuf.5050+69176, %edx
	vsubss	tbuf.5050+427400(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+430536(%rip)
	vmovss	tbuf.5050+69156(%rip), %xmm0
	vsubss	tbuf.5050+427404(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+430540(%rip)
	vmovss	tbuf.5050+69160(%rip), %xmm0
	vsubss	tbuf.5050+427408(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+430544(%rip)
	vmovss	tbuf.5050+69164(%rip), %xmm0
	vsubss	tbuf.5050+427412(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+430548(%rip)
	vmovss	tbuf.5050+69168(%rip), %xmm0
	vsubss	tbuf.5050+427416(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+430552(%rip)
	vmovss	tbuf.5050+69172(%rip), %xmm0
	vsubss	tbuf.5050+427420(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+430556(%rip)
	.p2align 4,,10
	.p2align 3
.L666:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	358216(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 361352(%rdx)
	cmpq	$tbuf.5050+72280, %rdx
	jne	.L666
	vmovss	tbuf.5050+72280(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+430528(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+433664(%rip)
	vmovss	tbuf.5050+72284(%rip), %xmm0
	vsubss	tbuf.5050+430532(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+433668(%rip)
	vmovss	tbuf.5050+293048(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+433672(%rip)
	vmovss	%xmm1, tbuf.5050+433676(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L667:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 433672(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L667
	vmovss	tbuf.5050+72288(%rip), %xmm0
	movl	$tbuf.5050+72308, %edx
	vsubss	tbuf.5050+433676(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+436812(%rip)
	vmovss	tbuf.5050+72292(%rip), %xmm0
	vsubss	tbuf.5050+433680(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+436816(%rip)
	vmovss	tbuf.5050+72296(%rip), %xmm0
	vsubss	tbuf.5050+433684(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+436820(%rip)
	vmovss	tbuf.5050+72300(%rip), %xmm0
	vsubss	tbuf.5050+433688(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+436824(%rip)
	vmovss	tbuf.5050+72304(%rip), %xmm0
	vsubss	tbuf.5050+433692(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+436828(%rip)
	.p2align 4,,10
	.p2align 3
.L668:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	361356(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 364492(%rdx)
	cmpq	$tbuf.5050+75412, %rdx
	jne	.L668
	vmovss	tbuf.5050+75412(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+436800(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+439936(%rip)
	vmovss	tbuf.5050+75416(%rip), %xmm0
	vsubss	tbuf.5050+436804(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+439940(%rip)
	vmovss	tbuf.5050+75420(%rip), %xmm0
	vsubss	tbuf.5050+436808(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+439944(%rip)
	vmovss	tbuf.5050+293052(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+439948(%rip)
	vmovss	%xmm1, tbuf.5050+439952(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L669:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 439948(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L669
	vmovss	tbuf.5050+75424(%rip), %xmm0
	movl	$tbuf.5050+75440, %edx
	vsubss	tbuf.5050+439952(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+78544, %edi
	vmovss	%xmm0, tbuf.5050+443088(%rip)
	vmovss	tbuf.5050+75428(%rip), %xmm0
	vsubss	tbuf.5050+439956(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+443092(%rip)
	vmovss	tbuf.5050+75432(%rip), %xmm0
	vsubss	tbuf.5050+439960(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+443096(%rip)
	vmovss	tbuf.5050+75436(%rip), %xmm0
	vsubss	tbuf.5050+439964(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+443100(%rip)
	.p2align 4,,10
	.p2align 3
.L670:
	vmovaps	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	364496(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 367632(%rdx)
	cmpq	%rdx, %rdi
	jne	.L670
	vmovss	tbuf.5050+78544(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+443072(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+446208(%rip)
	vmovss	tbuf.5050+78548(%rip), %xmm0
	vsubss	tbuf.5050+443076(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+446212(%rip)
	vmovss	tbuf.5050+78552(%rip), %xmm0
	vsubss	tbuf.5050+443080(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+446216(%rip)
	vmovss	tbuf.5050+78556(%rip), %xmm0
	vsubss	tbuf.5050+443084(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+446220(%rip)
	vmovss	tbuf.5050+293056(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+446224(%rip)
	vmovss	%xmm1, tbuf.5050+446228(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L671:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 446224(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L671
	vmovss	tbuf.5050+78560(%rip), %xmm0
	movl	$tbuf.5050+78572, %edx
	vsubss	tbuf.5050+446228(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+449364(%rip)
	vmovss	tbuf.5050+78564(%rip), %xmm0
	vsubss	tbuf.5050+446232(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+449368(%rip)
	vmovss	tbuf.5050+78568(%rip), %xmm0
	vsubss	tbuf.5050+446236(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+449372(%rip)
	.p2align 4,,10
	.p2align 3
.L672:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	367636(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 370772(%rdx)
	cmpq	$tbuf.5050+81676, %rdx
	jne	.L672
	vmovss	tbuf.5050+81676(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+449344(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+452480(%rip)
	vmovss	tbuf.5050+81680(%rip), %xmm0
	vsubss	tbuf.5050+449348(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+452484(%rip)
	vmovss	tbuf.5050+81684(%rip), %xmm0
	vsubss	tbuf.5050+449352(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+452488(%rip)
	vmovss	tbuf.5050+81688(%rip), %xmm0
	vsubss	tbuf.5050+449356(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+452492(%rip)
	vmovss	tbuf.5050+81692(%rip), %xmm0
	vsubss	tbuf.5050+449360(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+452496(%rip)
	vmovss	tbuf.5050+293060(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+452500(%rip)
	vmovss	%xmm1, tbuf.5050+452504(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L673:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 452500(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L673
	vmovss	tbuf.5050+81696(%rip), %xmm0
	movl	$tbuf.5050+81704, %edx
	vsubss	tbuf.5050+452504(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+84808, %edi
	vmovss	%xmm0, tbuf.5050+455640(%rip)
	vmovss	tbuf.5050+81700(%rip), %xmm0
	vsubss	tbuf.5050+452508(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+455644(%rip)
	.p2align 4,,10
	.p2align 3
.L674:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	370776(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 373912(%rdx)
	cmpq	%rdx, %rdi
	jne	.L674
	vmovss	tbuf.5050+84808(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+455616(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+458752(%rip)
	vmovss	tbuf.5050+84812(%rip), %xmm0
	vsubss	tbuf.5050+455620(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+458756(%rip)
	vmovss	tbuf.5050+84816(%rip), %xmm0
	vsubss	tbuf.5050+455624(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+458760(%rip)
	vmovss	tbuf.5050+84820(%rip), %xmm0
	vsubss	tbuf.5050+455628(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+458764(%rip)
	vmovss	tbuf.5050+84824(%rip), %xmm0
	vsubss	tbuf.5050+455632(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+458768(%rip)
	vmovss	tbuf.5050+84828(%rip), %xmm0
	vsubss	tbuf.5050+455636(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+458772(%rip)
	vmovss	tbuf.5050+293064(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+458776(%rip)
	vmovss	%xmm1, tbuf.5050+458780(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L675:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 458776(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L675
	vmovss	tbuf.5050+84832(%rip), %xmm0
	vsubss	tbuf.5050+458780(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+461916(%rip)
	.p2align 4,,10
	.p2align 3
.L676:
	vmovups	(%r12), %xmm0
	addq	$32, %r12
	vinsertf128	$0x1, -16(%r12), %ymm0, %ymm0
	vsubps	373916(%r12), %ymm0, %ymm0
	vmovaps	%ymm0, 377052(%r12)
	cmpq	$tbuf.5050+87940, %r12
	jne	.L676
	vmovss	tbuf.5050+87940(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vsubss	tbuf.5050+461888(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+465024(%rip)
	vmovss	tbuf.5050+87944(%rip), %xmm0
	vsubss	tbuf.5050+461892(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+465028(%rip)
	vmovss	tbuf.5050+87948(%rip), %xmm0
	vsubss	tbuf.5050+461896(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+465032(%rip)
	vmovss	tbuf.5050+87952(%rip), %xmm0
	vsubss	tbuf.5050+461900(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+465036(%rip)
	vmovss	tbuf.5050+87956(%rip), %xmm0
	vsubss	tbuf.5050+461904(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+465040(%rip)
	vmovss	tbuf.5050+87960(%rip), %xmm0
	vsubss	tbuf.5050+461908(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+465044(%rip)
	vmovss	tbuf.5050+87964(%rip), %xmm0
	vsubss	tbuf.5050+461912(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+465048(%rip)
	vmovss	tbuf.5050+293068(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+465052(%rip)
	vmovss	%xmm1, tbuf.5050+465056(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L677:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 465052(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L677
	movl	$tbuf.5050+87968, %edx
	.p2align 4,,10
	.p2align 3
.L678:
	vmovaps	(%rdx), %ymm0
	addq	$32, %rdx
	vsubps	377056(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 380192(%rdx)
	cmpq	$tbuf.5050+91104, %rdx
	jne	.L678
	vmovss	tbuf.5050+293072(%rip), %xmm0
	movl	$tbuf.5050+4, %edx
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+471328(%rip)
	vmovss	%xmm1, tbuf.5050+471332(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L679:
	vmulss	(%rdx), %xmm0, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, 471328(%rdx)
	cmpq	%rdx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L679
	vmovss	tbuf.5050+91104(%rip), %xmm0
	movl	$tbuf.5050+91132, %edx
	vsubss	tbuf.5050+471332(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+474468(%rip)
	vmovss	tbuf.5050+91108(%rip), %xmm0
	vsubss	tbuf.5050+471336(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+474472(%rip)
	vmovss	tbuf.5050+91112(%rip), %xmm0
	vsubss	tbuf.5050+471340(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+474476(%rip)
	vmovss	tbuf.5050+91116(%rip), %xmm0
	vsubss	tbuf.5050+471344(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+474480(%rip)
	vmovss	tbuf.5050+91120(%rip), %xmm0
	vsubss	tbuf.5050+471348(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+474484(%rip)
	vmovss	tbuf.5050+91124(%rip), %xmm0
	vsubss	tbuf.5050+471352(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+474488(%rip)
	vmovss	tbuf.5050+91128(%rip), %xmm0
	vsubss	tbuf.5050+471356(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+474492(%rip)
	.p2align 4,,10
	.p2align 3
.L680:
	vmovups	(%rdx), %xmm0
	addq	$32, %rdx
	vinsertf128	$0x1, -16(%rdx), %ymm0, %ymm0
	vsubps	380196(%rdx), %ymm0, %ymm0
	vmovaps	%ymm0, 383332(%rdx)
	cmpq	$tbuf.5050+94236, %rdx
	jne	.L680
	vmovss	tbuf.5050+94236(%rip), %xmm0
	vsubss	tbuf.5050+474464(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+477600(%rip)
	vmovss	tbuf.5050+293076(%rip), %xmm0
	vmulss	tbuf.5050+98576(%rip), %xmm0, %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm1
	vmovss	%xmm0, tbuf.5050+477604(%rip)
	vmovss	%xmm1, tbuf.5050+477608(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L681:
	vmulss	(%rcx), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, 477604(%rcx)
	cmpq	%rcx, %rax
	vmovaps	%xmm1, %xmm0
	jne	.L681
	vmovss	tbuf.5050+94240(%rip), %xmm0
	movl	$tbuf.5050+94264, %eax
	vsubss	tbuf.5050+477608(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+480744(%rip)
	vmovss	tbuf.5050+94244(%rip), %xmm0
	vsubss	tbuf.5050+477612(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+480748(%rip)
	vmovss	tbuf.5050+94248(%rip), %xmm0
	vsubss	tbuf.5050+477616(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+480752(%rip)
	vmovss	tbuf.5050+94252(%rip), %xmm0
	vsubss	tbuf.5050+477620(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+480756(%rip)
	vmovss	tbuf.5050+94256(%rip), %xmm0
	vsubss	tbuf.5050+477624(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+480760(%rip)
	vmovss	tbuf.5050+94260(%rip), %xmm0
	vsubss	tbuf.5050+477628(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+480764(%rip)
	.p2align 4,,10
	.p2align 3
.L682:
	vmovups	(%rax), %xmm0
	addq	$32, %rax
	vinsertf128	$0x1, -16(%rax), %ymm0, %ymm0
	vsubps	383336(%rax), %ymm0, %ymm0
	vmovaps	%ymm0, 386472(%rax)
	cmpq	$tbuf.5050+97368, %rax
	jne	.L682
	vmovss	tbuf.5050+97368(%rip), %xmm0
	movl	$tbuf.5050+484136, %eax
	vsubss	tbuf.5050+480736(%rip), %xmm0, %xmm0
	vmovss	tbuf.5050+98576(%rip), %xmm1
	vmovaps	tbuf.5050+3136(%rip), %ymm3
	vmulss	tbuf.5050+293056(%rip), %xmm1, %xmm4
	movl	$tbuf.5050+298748, %edx
	vmovaps	tbuf.5050+3168(%rip), %ymm6
	vmulss	tbuf.5050+293060(%rip), %xmm1, %xmm10
	vmulss	tbuf.5050+293064(%rip), %xmm1, %xmm9
	vmulss	tbuf.5050+293068(%rip), %xmm1, %xmm8
	vmulss	tbuf.5050+293072(%rip), %xmm1, %xmm7
	vmovss	%xmm0, tbuf.5050+483872(%rip)
	vmovss	tbuf.5050+97372(%rip), %xmm0
	vsubss	tbuf.5050+480740(%rip), %xmm0, %xmm0
	vmovss	%xmm4, tbuf.5050+483976(%rip)
	vmovss	%xmm10, tbuf.5050+483980(%rip)
	vmovss	%xmm9, tbuf.5050+483984(%rip)
	vmovss	%xmm8, tbuf.5050+483988(%rip)
	vmovss	%xmm7, tbuf.5050+483992(%rip)
	vmovss	%xmm0, tbuf.5050+483876(%rip)
	vbroadcastss	%xmm1, %ymm0
	vmulss	tbuf.5050+293076(%rip), %xmm1, %xmm1
	vmulps	tbuf.5050+292960(%rip), %ymm0, %ymm5
	vmulps	tbuf.5050+292992(%rip), %ymm0, %ymm2
	vmovss	%xmm1, tbuf.5050+483996(%rip)
	vmulps	tbuf.5050+293024(%rip), %ymm0, %ymm0
	vsubps	%ymm5, %ymm3, %ymm3
	vmovups	%xmm5, tbuf.5050+483880(%rip)
	vsubps	%ymm2, %ymm6, %ymm6
	vextractf128	$0x1, %ymm5, tbuf.5050+483896(%rip)
	vmovups	%xmm2, tbuf.5050+483912(%rip)
	vextractf128	$0x1, %ymm2, tbuf.5050+483928(%rip)
	vmovups	%xmm0, tbuf.5050+483944(%rip)
	vextractf128	$0x1, %ymm0, tbuf.5050+483960(%rip)
	vmovaps	%ymm3, tbuf.5050+484000(%rip)
	vmovaps	%ymm6, tbuf.5050+484032(%rip)
	vmovaps	tbuf.5050+3200(%rip), %ymm6
	vmovss	tbuf.5050+3232(%rip), %xmm5
	vsubps	%ymm0, %ymm6, %ymm0
	vmovss	tbuf.5050+3240(%rip), %xmm3
	vmovss	tbuf.5050+3244(%rip), %xmm2
	vsubss	%xmm4, %xmm5, %xmm5
	vmovss	tbuf.5050+3236(%rip), %xmm4
	vsubss	%xmm10, %xmm4, %xmm4
	vsubss	%xmm9, %xmm3, %xmm3
	vmovaps	%ymm0, tbuf.5050+484064(%rip)
	vsubss	%xmm8, %xmm2, %xmm2
	vmovss	tbuf.5050+3248(%rip), %xmm0
	vsubss	%xmm7, %xmm0, %xmm0
	vmovss	%xmm5, tbuf.5050+484096(%rip)
	vmovss	%xmm4, tbuf.5050+484100(%rip)
	vmovss	%xmm3, tbuf.5050+484104(%rip)
	vmovss	%xmm2, tbuf.5050+484108(%rip)
	vmovss	%xmm0, tbuf.5050+484112(%rip)
	vmovss	tbuf.5050+3252(%rip), %xmm0
	vsubss	%xmm1, %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+484116(%rip)
	vmovss	tbuf.5050+298740(%rip), %xmm1
	vmulss	tbuf.5050(%rip), %xmm1, %xmm1
	vmovss	487536(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+484120(%rip)
	vmovss	%xmm1, tbuf.5050+484124(%rip)
	vaddss	%xmm1, %xmm0, %xmm1
	vmovss	tbuf.5050+298744(%rip), %xmm0
	vmulss	tbuf.5050+4(%rip), %xmm0, %xmm0
	vmovss	%xmm1, tbuf.5050+484128(%rip)
	vmovss	%xmm0, tbuf.5050+484132(%rip)
.L683:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	-298744(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+490392, %rax
	jne	.L683
	vmovss	tbuf.5050+490384(%rip), %xmm0
	movl	$tbuf.5050+490404, %eax
	vaddss	tbuf.5050+490388(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+305020, %ecx
	movl	$tbuf.5050+496668, %edx
	vmovss	%xmm0, tbuf.5050+490392(%rip)
	vmovss	tbuf.5050+305016(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	493812(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+490396(%rip)
	vmovss	%xmm0, tbuf.5050+490400(%rip)
.L684:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-305020(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+496668, %rax
	jne	.L684
	vmovss	tbuf.5050+496660(%rip), %xmm0
	movl	$tbuf.5050+496680, %eax
	vaddss	tbuf.5050+496664(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+311296, %ecx
	vmovss	%xmm0, tbuf.5050+496668(%rip)
	vmovss	tbuf.5050+311292(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	500088(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+496672(%rip)
	vmovss	%xmm0, tbuf.5050+496676(%rip)
.L685:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-311296(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+502944, %rax
	jne	.L685
	vmovss	tbuf.5050+502936(%rip), %xmm0
	movl	$tbuf.5050+502956, %eax
	vaddss	tbuf.5050+502940(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+317572, %ecx
	movl	$tbuf.5050+509220, %esi
	vmovss	%xmm0, tbuf.5050+502944(%rip)
	vmovss	tbuf.5050+317568(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	506364(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+502948(%rip)
	vmovss	%xmm0, tbuf.5050+502952(%rip)
.L686:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-317572(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L686
	vmovss	tbuf.5050+509212(%rip), %xmm0
	movl	$tbuf.5050+509232, %eax
	vaddss	tbuf.5050+509216(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+323848, %ecx
	vmovss	%xmm0, tbuf.5050+509220(%rip)
	vmovss	tbuf.5050+323844(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	512640(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+509224(%rip)
	vmovss	%xmm0, tbuf.5050+509228(%rip)
.L687:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-323848(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+515496, %rax
	jne	.L687
	vmovss	tbuf.5050+515488(%rip), %xmm0
	movl	$tbuf.5050+515508, %eax
	vaddss	tbuf.5050+515492(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+330124, %ecx
	vmovss	%xmm0, tbuf.5050+515496(%rip)
	vmovss	tbuf.5050+330120(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	518916(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+515500(%rip)
	vmovss	%xmm0, tbuf.5050+515504(%rip)
.L688:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-330124(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+521772, %rax
	jne	.L688
	vmovss	tbuf.5050+521764(%rip), %xmm0
	movl	$tbuf.5050+521784, %eax
	vaddss	tbuf.5050+521768(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+336400, %ecx
	movl	$tbuf.5050+528048, %esi
	vmovss	%xmm0, tbuf.5050+521772(%rip)
	vmovss	tbuf.5050+336396(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	525192(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+521776(%rip)
	vmovss	%xmm0, tbuf.5050+521780(%rip)
.L689:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-336400(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L689
	vmovss	tbuf.5050+528040(%rip), %xmm0
	movl	$tbuf.5050+528060, %eax
	vaddss	tbuf.5050+528044(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+342676, %ecx
	movl	$tbuf.5050+534324, %esi
	vmovss	%xmm0, tbuf.5050+528048(%rip)
	vmovss	tbuf.5050+342672(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	531468(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+528052(%rip)
	vmovss	%xmm0, tbuf.5050+528056(%rip)
.L690:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-342676(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L690
	vmovss	tbuf.5050+534316(%rip), %xmm0
	movl	$tbuf.5050+534336, %eax
	vaddss	tbuf.5050+534320(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+348952, %ecx
	movl	$tbuf.5050+540600, %esi
	vmovss	%xmm0, tbuf.5050+534324(%rip)
	vmovss	tbuf.5050+348948(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	537744(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+534328(%rip)
	vmovss	%xmm0, tbuf.5050+534332(%rip)
.L691:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-348952(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L691
	vmovss	tbuf.5050+540592(%rip), %xmm0
	movl	$tbuf.5050+540612, %eax
	vaddss	tbuf.5050+540596(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+355228, %ecx
	vmovss	%xmm0, tbuf.5050+540600(%rip)
	vmovss	tbuf.5050+355224(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	544020(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+540604(%rip)
	vmovss	%xmm0, tbuf.5050+540608(%rip)
.L692:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-355228(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+546876, %rax
	jne	.L692
	vmovss	tbuf.5050+546868(%rip), %xmm0
	movl	$tbuf.5050+546888, %eax
	vaddss	tbuf.5050+546872(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+361504, %ecx
	vmovss	%xmm0, tbuf.5050+546876(%rip)
	vmovss	tbuf.5050+361500(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	550296(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+546880(%rip)
	vmovss	%xmm0, tbuf.5050+546884(%rip)
.L693:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-361504(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+553152, %rax
	jne	.L693
	vmovss	tbuf.5050+553144(%rip), %xmm0
	movl	$tbuf.5050+553164, %eax
	vaddss	tbuf.5050+553148(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+367780, %ecx
	vmovss	%xmm0, tbuf.5050+553152(%rip)
	vmovss	tbuf.5050+367776(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	556572(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+553156(%rip)
	vmovss	%xmm0, tbuf.5050+553160(%rip)
.L694:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-367780(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+559428, %rax
	jne	.L694
	vmovss	tbuf.5050+559420(%rip), %xmm0
	movl	$tbuf.5050+559440, %eax
	vaddss	tbuf.5050+559424(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+374056, %ecx
	vmovss	%xmm0, tbuf.5050+559428(%rip)
	vmovss	tbuf.5050+374052(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	562848(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+559432(%rip)
	vmovss	%xmm0, tbuf.5050+559436(%rip)
.L695:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-374056(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+565704, %rax
	jne	.L695
	vmovss	tbuf.5050+565696(%rip), %xmm0
	movl	$tbuf.5050+565716, %eax
	vaddss	tbuf.5050+565700(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+380332, %ecx
	vmovss	%xmm0, tbuf.5050+565704(%rip)
	vmovss	tbuf.5050+380328(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	569124(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+565708(%rip)
	vmovss	%xmm0, tbuf.5050+565712(%rip)
.L696:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-380332(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+571980, %rax
	jne	.L696
	vmovss	tbuf.5050+571972(%rip), %xmm0
	movl	$tbuf.5050+571992, %eax
	vaddss	tbuf.5050+571976(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+386608, %ecx
	movl	$tbuf.5050+578256, %esi
	vmovss	%xmm0, tbuf.5050+571980(%rip)
	vmovss	tbuf.5050+386604(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	575400(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+571984(%rip)
	vmovss	%xmm0, tbuf.5050+571988(%rip)
.L697:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-386608(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L697
	vmovss	tbuf.5050+578248(%rip), %xmm0
	movl	$tbuf.5050+578268, %eax
	vaddss	tbuf.5050+578252(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+392884, %ecx
	movl	$tbuf.5050+584532, %esi
	vmovss	%xmm0, tbuf.5050+578256(%rip)
	vmovss	tbuf.5050+392880(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	581676(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+578260(%rip)
	vmovss	%xmm0, tbuf.5050+578264(%rip)
.L698:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-392884(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L698
	vmovss	tbuf.5050+584524(%rip), %xmm0
	movl	$tbuf.5050+584544, %eax
	vaddss	tbuf.5050+584528(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+399160, %ecx
	vmovss	%xmm0, tbuf.5050+584532(%rip)
	vmovss	tbuf.5050+399156(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	587952(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+584536(%rip)
	vmovss	%xmm0, tbuf.5050+584540(%rip)
.L699:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-399160(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+590808, %rax
	jne	.L699
	vmovss	tbuf.5050+590800(%rip), %xmm0
	movl	$tbuf.5050+590820, %eax
	vaddss	tbuf.5050+590804(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+405436, %ecx
	vmovss	%xmm0, tbuf.5050+590808(%rip)
	vmovss	tbuf.5050+405432(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	594228(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+590812(%rip)
	vmovss	%xmm0, tbuf.5050+590816(%rip)
.L700:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-405436(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+597084, %rax
	jne	.L700
	vmovss	tbuf.5050+597076(%rip), %xmm0
	movl	$tbuf.5050+597096, %eax
	vaddss	tbuf.5050+597080(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+411712, %ecx
	movl	$tbuf.5050+603360, %esi
	vmovss	%xmm0, tbuf.5050+597084(%rip)
	vmovss	tbuf.5050+411708(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	600504(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+597088(%rip)
	vmovss	%xmm0, tbuf.5050+597092(%rip)
.L701:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-411712(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L701
	vmovss	tbuf.5050+603352(%rip), %xmm0
	movl	$tbuf.5050+603372, %eax
	vaddss	tbuf.5050+603356(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+417988, %ecx
	movl	$tbuf.5050+609636, %esi
	vmovss	%xmm0, tbuf.5050+603360(%rip)
	vmovss	tbuf.5050+417984(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	606780(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+603364(%rip)
	vmovss	%xmm0, tbuf.5050+603368(%rip)
.L702:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-417988(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L702
	vmovss	tbuf.5050+609628(%rip), %xmm0
	movl	$tbuf.5050+609648, %eax
	vaddss	tbuf.5050+609632(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+424264, %ecx
	movl	$tbuf.5050+615912, %esi
	vmovss	%xmm0, tbuf.5050+609636(%rip)
	vmovss	tbuf.5050+424260(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	613056(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+609640(%rip)
	vmovss	%xmm0, tbuf.5050+609644(%rip)
.L703:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-424264(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L703
	vmovss	tbuf.5050+615904(%rip), %xmm0
	movl	$tbuf.5050+615924, %eax
	vaddss	tbuf.5050+615908(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+430540, %ecx
	vmovss	%xmm0, tbuf.5050+615912(%rip)
	vmovss	tbuf.5050+430536(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	619332(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+615916(%rip)
	vmovss	%xmm0, tbuf.5050+615920(%rip)
.L704:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-430540(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+622188, %rax
	jne	.L704
	vmovss	tbuf.5050+622180(%rip), %xmm0
	movl	$tbuf.5050+622200, %eax
	vaddss	tbuf.5050+622184(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+436816, %ecx
	vmovss	%xmm0, tbuf.5050+622188(%rip)
	vmovss	tbuf.5050+436812(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	625608(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+622192(%rip)
	vmovss	%xmm0, tbuf.5050+622196(%rip)
.L705:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-436816(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+628464, %rax
	jne	.L705
	vmovss	tbuf.5050+628456(%rip), %xmm0
	movl	$tbuf.5050+628476, %eax
	vaddss	tbuf.5050+628460(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+443092, %ecx
	vmovss	%xmm0, tbuf.5050+628464(%rip)
	vmovss	tbuf.5050+443088(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	631884(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+628468(%rip)
	vmovss	%xmm0, tbuf.5050+628472(%rip)
.L706:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-443092(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+634740, %rax
	jne	.L706
	vmovss	tbuf.5050+634732(%rip), %xmm0
	movl	$tbuf.5050+634752, %eax
	vaddss	tbuf.5050+634736(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+449368, %ecx
	vmovss	%xmm0, tbuf.5050+634740(%rip)
	vmovss	tbuf.5050+449364(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	638160(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+634744(%rip)
	vmovss	%xmm0, tbuf.5050+634748(%rip)
.L707:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-449368(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+641016, %rax
	jne	.L707
	vmovss	tbuf.5050+641008(%rip), %xmm0
	movl	$tbuf.5050+641028, %eax
	vaddss	tbuf.5050+641012(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+455644, %ecx
	vmovss	%xmm0, tbuf.5050+641016(%rip)
	vmovss	tbuf.5050+455640(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	644436(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+641020(%rip)
	vmovss	%xmm0, tbuf.5050+641024(%rip)
.L708:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-455644(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+647292, %rax
	jne	.L708
	vmovss	tbuf.5050+647284(%rip), %xmm0
	movl	$tbuf.5050+647304, %eax
	vaddss	tbuf.5050+647288(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+461920, %ecx
	movl	$tbuf.5050+653568, %esi
	vmovss	%xmm0, tbuf.5050+647292(%rip)
	vmovss	tbuf.5050+461916(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	650712(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+647296(%rip)
	vmovss	%xmm0, tbuf.5050+647300(%rip)
.L709:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-461920(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L709
	vmovss	tbuf.5050+653560(%rip), %xmm0
	movl	$tbuf.5050+653580, %eax
	vaddss	tbuf.5050+653564(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+468196, %ecx
	movl	$tbuf.5050+659844, %esi
	vmovss	%xmm0, tbuf.5050+653568(%rip)
	vmovss	tbuf.5050+468192(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	656988(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+653572(%rip)
	vmovss	%xmm0, tbuf.5050+653576(%rip)
.L710:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-468196(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rsi
	jne	.L710
	vmovss	tbuf.5050+659836(%rip), %xmm0
	movl	$tbuf.5050+659856, %eax
	vaddss	tbuf.5050+659840(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+474472, %ecx
	vmovss	%xmm0, tbuf.5050+659844(%rip)
	vmovss	tbuf.5050+474468(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	663264(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+659848(%rip)
	vmovss	%xmm0, tbuf.5050+659852(%rip)
.L711:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-474472(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+666120, %rax
	jne	.L711
	vmovss	tbuf.5050+666112(%rip), %xmm0
	movl	$tbuf.5050+666132, %eax
	vaddss	tbuf.5050+666116(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+480748, %ecx
	vmovss	%xmm0, tbuf.5050+666120(%rip)
	vmovss	tbuf.5050+480744(%rip), %xmm0
	vmulss	tbuf.5050(%rip), %xmm0, %xmm0
	vmovss	669540(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+666124(%rip)
	vmovss	%xmm0, tbuf.5050+666128(%rip)
.L712:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rcx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rcx), %xmm0
	vmulss	-480748(%rcx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+672396, %rax
	jne	.L712
	vmovss	tbuf.5050+672388(%rip), %xmm0
	movl	$tbuf.5050+484004, %eax
	vaddss	tbuf.5050+672392(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+672396(%rip)
	vmovss	tbuf.5050+484000(%rip), %xmm0
	vaddss	tbuf.5050+490392(%rip), %xmm0, %xmm0
	vmovss	%xmm0, tbuf.5050+672400(%rip)
	.p2align 4,,10
	.p2align 3
.L713:
	vmovss	(%rax), %xmm0
	addq	$6276, %rdx
	addq	$4, %rax
	vaddss	-6276(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, 188396(%rax)
	cmpq	$tbuf.5050+678672, %rdx
	jne	.L713
	vmovss	675936(%rbx), %xmm0
	movl	$tbuf.5050+672400, %eax
	vmovss	%xmm0, tbuf.5050+672520(%rip)
	movl	$tbuf.5050+672520, %edx
	vmovss	675940(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+672524(%rip)
	vmovaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L714:
	vsubss	(%rax), %xmm0, %xmm0
	addq	$4, %rax
	vmovss	%xmm0, 124(%rax)
	cmpq	%rax, %rdx
	vmovaps	%xmm1, %xmm0
	jne	.L714
	movl	$tbuf.5050+672528, %r13d
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L715:
	vmovss	0(%r13), %xmm0
	addq	$4, %r13
	call	expf
	vmovss	%xmm0, 116(%r13)
	cmpq	$tbuf.5050+672648, %r13
	jne	.L715
	vmovss	tbuf.5050+672520(%rip), %xmm0
	movl	$tbuf.5050+673024, %eax
	vaddss	tbuf.5050+672648(%rip), %xmm0, %xmm1
	movl	$tbuf.5050+293212, %edx
	vmovss	%xmm1, tbuf.5050+672768(%rip)
	vaddss	tbuf.5050+672652(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672772(%rip)
	vaddss	tbuf.5050+672656(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672776(%rip)
	vaddss	tbuf.5050+672660(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672780(%rip)
	vaddss	tbuf.5050+672664(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672784(%rip)
	vaddss	tbuf.5050+672668(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672788(%rip)
	vbroadcastss	%xmm0, %ymm1
	vaddps	tbuf.5050+672672(%rip), %ymm1, %ymm2
	vmovups	%xmm2, tbuf.5050+672792(%rip)
	vextractf128	$0x1, %ymm2, tbuf.5050+672808(%rip)
	vaddps	tbuf.5050+672704(%rip), %ymm1, %ymm2
	vmovups	%xmm2, tbuf.5050+672824(%rip)
	vextractf128	$0x1, %ymm2, tbuf.5050+672840(%rip)
	vaddps	tbuf.5050+672736(%rip), %ymm1, %ymm2
	vmovups	%xmm2, tbuf.5050+672856(%rip)
	vextractf128	$0x1, %ymm2, tbuf.5050+672872(%rip)
	vdivps	tbuf.5050+672768(%rip), %ymm1, %ymm2
	vmovups	%xmm2, tbuf.5050+672888(%rip)
	vextractf128	$0x1, %ymm2, tbuf.5050+672904(%rip)
	vdivps	tbuf.5050+672800(%rip), %ymm1, %ymm2
	vdivps	tbuf.5050+672832(%rip), %ymm1, %ymm1
	vmovups	%xmm2, tbuf.5050+672920(%rip)
	vextractf128	$0x1, %ymm2, tbuf.5050+672936(%rip)
	vmovups	%xmm1, tbuf.5050+672952(%rip)
	vextractf128	$0x1, %ymm1, tbuf.5050+672968(%rip)
	vdivss	tbuf.5050+672864(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672984(%rip)
	vdivss	tbuf.5050+672868(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672988(%rip)
	vdivss	tbuf.5050+672872(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672992(%rip)
	vdivss	tbuf.5050+672876(%rip), %xmm0, %xmm1
	vmovss	%xmm1, tbuf.5050+672996(%rip)
	vdivss	tbuf.5050+672880(%rip), %xmm0, %xmm1
	vdivss	tbuf.5050+672884(%rip), %xmm0, %xmm0
	vmovss	%xmm1, tbuf.5050+673000(%rip)
	vmovss	%xmm0, tbuf.5050+673004(%rip)
	vmovss	tbuf.5050+293204(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	676464(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+673008(%rip)
	vmovss	%xmm0, tbuf.5050+673012(%rip)
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	tbuf.5050+293208(%rip), %xmm1
	vmulss	tbuf.5050+672892(%rip), %xmm1, %xmm1
	vmovss	%xmm0, tbuf.5050+673016(%rip)
	vmovss	%xmm1, tbuf.5050+673020(%rip)
.L716:
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm0, -8(%rax)
	vmovss	-4(%rdx), %xmm1
	vmulss	379680(%rdx), %xmm1, %xmm1
	vmovss	%xmm1, -4(%rax)
	cmpq	$tbuf.5050+673248, %rax
	jne	.L716
	vmovss	tbuf.5050+673240(%rip), %xmm0
	movl	$tbuf.5050+673260, %eax
	vaddss	tbuf.5050+673244(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+293452, %edx
	vmovss	%xmm0, tbuf.5050+673248(%rip)
	vmovss	tbuf.5050+293448(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	676708(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+673252(%rip)
	vmovss	%xmm0, tbuf.5050+673256(%rip)
.L717:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	379436(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+673492, %rax
	jne	.L717
	vmovss	tbuf.5050+673484(%rip), %xmm0
	movl	$tbuf.5050+673504, %eax
	vaddss	tbuf.5050+673488(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+293696, %edx
	vmovss	%xmm0, tbuf.5050+673492(%rip)
	vmovss	tbuf.5050+293692(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	676952(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+673496(%rip)
	vmovss	%xmm0, tbuf.5050+673500(%rip)
.L718:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	379192(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+673736, %rax
	jne	.L718
	vmovss	tbuf.5050+673728(%rip), %xmm0
	movl	$tbuf.5050+673748, %eax
	vaddss	tbuf.5050+673732(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+293940, %edx
	vmovss	%xmm0, tbuf.5050+673736(%rip)
	vmovss	tbuf.5050+293936(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	677196(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+673740(%rip)
	vmovss	%xmm0, tbuf.5050+673744(%rip)
.L719:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	378948(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+673980, %rax
	jne	.L719
	vmovss	tbuf.5050+673972(%rip), %xmm0
	movl	$tbuf.5050+673992, %eax
	vaddss	tbuf.5050+673976(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+294184, %edx
	vmovss	%xmm0, tbuf.5050+673980(%rip)
	vmovss	tbuf.5050+294180(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	677440(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+673984(%rip)
	vmovss	%xmm0, tbuf.5050+673988(%rip)
.L720:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	378704(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+674224, %rax
	jne	.L720
	vmovss	tbuf.5050+674216(%rip), %xmm0
	movl	$tbuf.5050+674236, %eax
	vaddss	tbuf.5050+674220(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+294428, %edx
	vmovss	%xmm0, tbuf.5050+674224(%rip)
	vmovss	tbuf.5050+294424(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	677684(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+674228(%rip)
	vmovss	%xmm0, tbuf.5050+674232(%rip)
.L721:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	378460(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+674468, %rax
	jne	.L721
	vmovss	tbuf.5050+674460(%rip), %xmm0
	movl	$tbuf.5050+674480, %eax
	vaddss	tbuf.5050+674464(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+294672, %edx
	vmovss	%xmm0, tbuf.5050+674468(%rip)
	vmovss	tbuf.5050+294668(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	677928(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+674472(%rip)
	vmovss	%xmm0, tbuf.5050+674476(%rip)
.L722:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	378216(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+674712, %rax
	jne	.L722
	vmovss	tbuf.5050+674704(%rip), %xmm0
	movl	$tbuf.5050+674724, %eax
	vaddss	tbuf.5050+674708(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+294916, %edx
	vmovss	%xmm0, tbuf.5050+674712(%rip)
	vmovss	tbuf.5050+294912(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	678172(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+674716(%rip)
	vmovss	%xmm0, tbuf.5050+674720(%rip)
.L723:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	377972(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+674956, %rax
	jne	.L723
	vmovss	tbuf.5050+674948(%rip), %xmm0
	movl	$tbuf.5050+674968, %eax
	vaddss	tbuf.5050+674952(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+295160, %edx
	vmovss	%xmm0, tbuf.5050+674956(%rip)
	vmovss	tbuf.5050+295156(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	678416(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+674960(%rip)
	vmovss	%xmm0, tbuf.5050+674964(%rip)
.L724:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	377728(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	$tbuf.5050+675200, %rax
	jne	.L724
	vmovss	tbuf.5050+675192(%rip), %xmm0
	movl	$tbuf.5050+675212, %eax
	vaddss	tbuf.5050+675196(%rip), %xmm0, %xmm0
	movl	$tbuf.5050+295404, %edx
	movl	$tbuf.5050+675444, %ecx
	vmovss	%xmm0, tbuf.5050+675200(%rip)
	vmovss	tbuf.5050+295400(%rip), %xmm0
	vmulss	tbuf.5050+672888(%rip), %xmm0, %xmm0
	vmovss	678660(%rbx), %xmm1
	vmovss	%xmm1, tbuf.5050+675204(%rip)
	vmovss	%xmm0, tbuf.5050+675208(%rip)
.L725:
	vaddss	%xmm0, %xmm1, %xmm1
	addq	$8, %rax
	addq	$4, %rdx
	vmovss	%xmm1, -8(%rax)
	vmovss	-4(%rdx), %xmm0
	vmulss	377484(%rdx), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L725
	vmovss	tbuf.5050+675436(%rip), %xmm0
	vaddss	tbuf.5050+675440(%rip), %xmm0, %xmm0
	vmovss	tbuf.5050+295560(%rip), %xmm10
	vmovss	tbuf.5050+673492(%rip), %xmm9
	vaddss	tbuf.5050+673248(%rip), %xmm10, %xmm10
	vmovss	tbuf.5050+673736(%rip), %xmm8
	vaddss	tbuf.5050+295564(%rip), %xmm9, %xmm9
	vmovss	tbuf.5050+295572(%rip), %xmm7
	vaddss	tbuf.5050+295568(%rip), %xmm8, %xmm8
	vmovss	tbuf.5050+295576(%rip), %xmm6
	vaddss	tbuf.5050+673980(%rip), %xmm7, %xmm7
	vmovss	tbuf.5050+295580(%rip), %xmm5
	vaddss	tbuf.5050+674224(%rip), %xmm6, %xmm6
	vmovss	tbuf.5050+295584(%rip), %xmm4
	vaddss	tbuf.5050+295596(%rip), %xmm0, %xmm1
	vmovss	tbuf.5050+295588(%rip), %xmm3
	vaddss	tbuf.5050+674468(%rip), %xmm5, %xmm5
	vmovss	tbuf.5050+295592(%rip), %xmm2
	vaddss	tbuf.5050+674712(%rip), %xmm4, %xmm4
	vaddss	tbuf.5050+674956(%rip), %xmm3, %xmm3
	vmovss	%xmm10, tbuf.5050+675448(%rip)
	vaddss	tbuf.5050+675200(%rip), %xmm2, %xmm2
	vmovss	%xmm9, tbuf.5050+675452(%rip)
	vmovss	%xmm8, tbuf.5050+675456(%rip)
	vmovss	%xmm7, tbuf.5050+675460(%rip)
	vmovss	%xmm6, tbuf.5050+675464(%rip)
	vmovss	%xmm5, tbuf.5050+675468(%rip)
	vmovss	%xmm4, tbuf.5050+675472(%rip)
	vmovss	%xmm3, tbuf.5050+675476(%rip)
	vmovss	%xmm2, tbuf.5050+675480(%rip)
	vmovss	%xmm1, tbuf.5050+675484(%rip)
	vmovss	%xmm0, tbuf.5050+675444(%rip)
	vmovss	678944(%rbx), %xmm0
	vmovss	%xmm0, tbuf.5050+675488(%rip)
	vmovss	678948(%rbx), %xmm0
	movl	$tbuf.5050+675496, %ebx
	vsubss	%xmm10, %xmm0, %xmm10
	vmovss	%xmm0, tbuf.5050+675492(%rip)
	vsubss	%xmm9, %xmm0, %xmm9
	vsubss	%xmm8, %xmm0, %xmm8
	vsubss	%xmm7, %xmm0, %xmm7
	vsubss	%xmm6, %xmm0, %xmm6
	vmovss	%xmm10, tbuf.5050+675496(%rip)
	vsubss	%xmm5, %xmm0, %xmm5
	vmovss	%xmm9, tbuf.5050+675500(%rip)
	vsubss	%xmm4, %xmm0, %xmm4
	vmovss	%xmm8, tbuf.5050+675504(%rip)
	vsubss	%xmm3, %xmm0, %xmm3
	vmovss	%xmm7, tbuf.5050+675508(%rip)
	vsubss	%xmm2, %xmm0, %xmm2
	vmovss	%xmm6, tbuf.5050+675512(%rip)
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm5, tbuf.5050+675516(%rip)
	vmovss	%xmm4, tbuf.5050+675520(%rip)
	vmovss	%xmm3, tbuf.5050+675524(%rip)
	vmovss	%xmm2, tbuf.5050+675528(%rip)
	vmovss	%xmm0, tbuf.5050+675532(%rip)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L726:
	vmovss	(%rbx), %xmm0
	addq	$4, %rbx
	call	expf
	vmovss	%xmm0, 36(%rbx)
	cmpq	$tbuf.5050+675536, %rbx
	jne	.L726
	vmovss	tbuf.5050+675488(%rip), %xmm1
	vaddss	tbuf.5050+675536(%rip), %xmm1, %xmm0
	movq	-64(%rbp), %rdi
	vmovups	tbuf.5050+675544(%rip), %xmm2
	vinsertf128	$0x1, tbuf.5050+675560(%rip), %ymm2, %ymm2
	movq	%rdi, %rax
	addq	$32, %rax
	cmpq	$tbuf.5050+675616, %rax
	vmovss	%xmm0, tbuf.5050+675576(%rip)
	vaddss	tbuf.5050+675540(%rip), %xmm1, %xmm0
	vmovss	%xmm0, tbuf.5050+675580(%rip)
	vbroadcastss	%xmm1, %ymm0
	vaddps	%ymm0, %ymm2, %ymm2
	vmovaps	%ymm2, tbuf.5050+675584(%rip)
	vmovups	tbuf.5050+675576(%rip), %xmm2
	vinsertf128	$0x1, tbuf.5050+675592(%rip), %ymm2, %ymm2
	vdivps	%ymm2, %ymm0, %ymm0
	vdivss	tbuf.5050+675608(%rip), %xmm1, %xmm2
	vmovaps	%ymm0, tbuf.5050+675616(%rip)
	vdivss	tbuf.5050+675612(%rip), %xmm1, %xmm1
	vmovss	%xmm2, tbuf.5050+675648(%rip)
	vmovss	%xmm1, tbuf.5050+675652(%rip)
	jbe	.L732
	cmpq	$tbuf.5050+675648, %rdi
	jb	.L727
.L732:
	movq	-64(%rbp), %rax
	vmovups	%xmm0, (%rax)
	vextractf128	$0x1, %ymm0, 16(%rax)
	vmovss	tbuf.5050+675648(%rip), %xmm0
	vmovss	%xmm0, 32(%rax)
.L729:
	vmovss	tbuf.5050+675652(%rip), %xmm0
	vmovss	%xmm0, 36(%rax)
	vzeroupper
	addq	$32, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L727:
	.cfi_restore_state
	vmovss	tbuf.5050+675616(%rip), %xmm0
	movq	%rdi, %rax
	vmovss	%xmm0, (%rdi)
	vmovss	tbuf.5050+675620(%rip), %xmm0
	vmovss	%xmm0, 4(%rdi)
	vmovss	tbuf.5050+675624(%rip), %xmm0
	vmovss	%xmm0, 8(%rdi)
	vmovss	tbuf.5050+675628(%rip), %xmm0
	vmovss	%xmm0, 12(%rdi)
	vmovss	tbuf.5050+675632(%rip), %xmm0
	vmovss	%xmm0, 16(%rdi)
	vmovss	tbuf.5050+675636(%rip), %xmm0
	vmovss	%xmm0, 20(%rdi)
	vmovss	tbuf.5050+675640(%rip), %xmm0
	vmovss	%xmm0, 24(%rdi)
	vmovss	tbuf.5050+675644(%rip), %xmm0
	vmovss	%xmm0, 28(%rdi)
	vmovss	tbuf.5050+675648(%rip), %xmm0
	vmovss	%xmm0, 32(%rdi)
	jmp	.L729
.L608:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L611:
	vmovss	293492(%rbx,%rax,4), %xmm0
	vmovss	%xmm0, tbuf.5050+290196(,%rax,4)
	addq	$1, %rax
	cmpq	$30, %rax
	jne	.L611
	jmp	.L610
.L559:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L563:
	vmovss	3136(%r8,%rdx,4), %xmm0
	vmovss	%xmm0, tbuf.5050+3136(,%rdx,4)
	addq	$1, %rdx
	cmpq	$23860, %rdx
	jne	.L563
	jmp	.L562
	.cfi_endproc
.LFE15:
	.size	kern1, .-kern1
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.local	tbuf.5050
	.comm	tbuf.5050,675656,32
	.local	tbuf.3887
	.comm	tbuf.3887,484120,32
	.ident	"GCC: (GNU) 5.3.1 20160406 (Red Hat 5.3.1-6)"
	.section	.note.GNU-stack,"",@progbits
