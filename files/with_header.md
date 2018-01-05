#### Method 2:  Adding a header file to C code

[Stackoverflow](http://stackoverflow.com/questions/439662) on **#import** v. **#include**.  

**add.h**

```c
int f1(int);
int f2(int);

```

**add1.c**

```c
#import <stdio.h>

int f1(int x) {
    printf( "f1: %d; ", x );
    return x+1;
}

```

**add2.c**

```c
#import <stdio.h>

int f2(int x) {
    printf( "f2: %d; ", x );
    return x+2;
}

```

**useadd.c**

```c
#import <stdio.h>
#import "add.h"

int main(int argc, char** argv){
    printf("  main %d\n", f1(1));
    printf("  main %d\n", f2(10));
    return 0;
}

```
Build both the **add** files:

```bash
> clang -g -Wall -c add*.c
> ls *.o
add1.o	add2.o
>
```

We have generated **add1.o** and **add2.o**.  Then

```bash
> clang -g -Wall useadd.c add1.o add2.o -o useadd
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

We can take a look at the binary (executable):

```bash
> nm useadd
0000000100000000 T __mh_execute_header
0000000100000f10 T _f1
0000000100000f40 T _f2
0000000100000eb0 T _main
                 U _printf
                 U dyld_stub_binder
>
```

Or an even deeper look with ``otool``

```bash
> file useadd
useadd: Mach-O 64-bit executable x86_64
> otool -tvV useadd
useadd:
(__TEXT,__text) section
_main:
0000000100000eb0	pushq	%rbp
0000000100000eb1	movq	%rsp, %rbp
0000000100000eb4	subq	$0x20, %rsp
0000000100000eb8	movl	$0x1, %eax
0000000100000ebd	movl	$0x0, -0x4(%rbp)
0000000100000ec4	movl	%edi, -0x8(%rbp)
0000000100000ec7	movq	%rsi, -0x10(%rbp)
0000000100000ecb	movl	%eax, %edi
0000000100000ecd	callq	_f1
0000000100000ed2	leaq	0xb9(%rip), %rdi ## literal pool for: "  main %d\n"
0000000100000ed9	movl	%eax, %esi
0000000100000edb	movb	$0x0, %al
0000000100000edd	callq	0x100000f70 ## symbol stub for: _printf
0000000100000ee2	movl	$0xa, %edi
0000000100000ee7	movl	%eax, -0x14(%rbp)
0000000100000eea	callq	_f2
0000000100000eef	leaq	0x9c(%rip), %rdi ## literal pool for: "  main %d\n"
0000000100000ef6	movl	%eax, %esi
0000000100000ef8	movb	$0x0, %al
0000000100000efa	callq	0x100000f70 ## symbol stub for: _printf
0000000100000eff	xorl	%esi, %esi
0000000100000f01	movl	%eax, -0x18(%rbp)
0000000100000f04	movl	%esi, %eax
0000000100000f06	addq	$0x20, %rsp
0000000100000f0a	popq	%rbp
0000000100000f0b	retq
0000000100000f0c	nop
0000000100000f0d	nop
0000000100000f0e	nop
0000000100000f0f	nop
_f1:
0000000100000f10	pushq	%rbp
0000000100000f11	movq	%rsp, %rbp
0000000100000f14	subq	$0x10, %rsp
0000000100000f18	leaq	0x7e(%rip), %rax ## literal pool for: "f1: %d; "
0000000100000f1f	movl	%edi, -0x4(%rbp)
0000000100000f22	movl	-0x4(%rbp), %esi
0000000100000f25	movq	%rax, %rdi
0000000100000f28	movb	$0x0, %al
0000000100000f2a	callq	0x100000f70 ## symbol stub for: _printf
0000000100000f2f	movl	-0x4(%rbp), %esi
0000000100000f32	addl	$0x1, %esi
0000000100000f35	movl	%eax, -0x8(%rbp)
0000000100000f38	movl	%esi, %eax
0000000100000f3a	addq	$0x10, %rsp
0000000100000f3e	popq	%rbp
0000000100000f3f	retq
_f2:
0000000100000f40	pushq	%rbp
0000000100000f41	movq	%rsp, %rbp
0000000100000f44	subq	$0x10, %rsp
0000000100000f48	leaq	0x57(%rip), %rax ## literal pool for: "f2: %d; "
0000000100000f4f	movl	%edi, -0x4(%rbp)
0000000100000f52	movl	-0x4(%rbp), %esi
0000000100000f55	movq	%rax, %rdi
0000000100000f58	movb	$0x0, %al
0000000100000f5a	callq	0x100000f70 ## symbol stub for: _printf
0000000100000f5f	movl	-0x4(%rbp), %esi
0000000100000f62	addl	$0x2, %esi
0000000100000f65	movl	%eax, -0x8(%rbp)
0000000100000f68	movl	%esi, %eax
0000000100000f6a	addq	$0x10, %rsp
0000000100000f6e	popq	%rbp
0000000100000f6f	retq
```

I don't speak assembly, but I get the idea.