	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func
	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	@r0 is the passed value
	push {r3,r4,r5,r6,lr}
	mov r3,#-1		@r3==previous
	mov r4,#1		@r4==result
	mov r5,#0		@r5==sum
	mov r6,#0		@r6==i (in for loop)
for_loop:
	add r5,r4,r3	@sum = result + previous
	mov r3,r4		@previous = result
	mov r4,r5		@result = sum
	add r6,r6,#1	@i=i+1

	CMP r0,r6		@x-i>0  means i<x 
	it ge			@if i<=x
	bge for_loop	@next cycle
	
	mov r0,r5		@r0 is the return value
	pop {r3,r4,r5,r6,pc}
	
	.size fibonacci, .-fibonacci
	.end

