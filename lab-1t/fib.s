	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

@ tail recursive - C code
@int fib(int term, int val=1, int prev=0)
@{
@   if(term == 0) return prev;
@   if(term == 1) return val;
@   return fib(term-1,val+prev,val);
@}

fibonacci:
	push { r4 , lr}
    @r0 = term;
    @r1 = val;
    @r2 = prev;
    cmp r0,#0           @if(term == 0) return prev;
    beq r_prev

    cmp r0,#1           @if(term == 1) return val;
    beq r_val

    sub r0,r0,#1        @term-=1
    mov r4,r1           @r4 is temp,save temp = val
    add r1,r1,r2        @pass val+prev as r1
    mov r2,r4           @pass val as r2

    bl fibonacci        @recursive

exit:

    mov r0,r1
    pop { r4 , pc}

       
r_prev:                                    @return 0
    mov r0,#0
    pop { r4 , pc}

r_val:                                     @return 1
    mov r0,#1
    pop { r4, pc}



    .size fibonacci, .-fibonacci
    .end

