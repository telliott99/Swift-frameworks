#### Method 3:  Static C library

We make the functions from the previous exercise into an old-fashioned C library:

```bash
> rm *
rm: src: is a directory
rm: useadd.dSYM: is a directory
>
```
These are debugging symbols.  I remove them by dragging them to the Trash.

```bash
> cp src/* .
> clang -g -Wall -c add*.c
> libtool -static add*.o -o libadd.a
>
```

If you are curious what is inside ``libadd.a``

```bash
> tar -tvf libadd.a
-rw-r--r--  0 501    20         32 Jan 16 10:24 __.SYMDEF SORTED
-rw-r--r--  0 501    20       2352 Jan 16 10:24 add1.o
-rw-r--r--  0 501    20       2352 Jan 16 10:24 add2.o
>
```

We change **useadd.c** to remove ``#import "add.h"``.  We simply declare the functions we will use as ``extern``.

**useaddext.c**

```c
#import <stdio.h>

extern int f1(int);
extern int f2(int);

int main(int argc, char** argv){
    printf("  main %d\n", f1(1));
    printf("  main %d\n", f2(10));
    return 0;
}
```

And build it using either one of these calls

```bash
> clang -g -Wall -o useadd useadd.c -L. -ladd
> clang -g -Wall -o useadd useadd.c -L. libadd.a
>
```

``-ladd`` is shorthand for ``libadd.a``.  

Run it:

```bash
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```
It works.

This is a static library.  That means its code will be present in any program that is built using it.  In particular, this version of ``useadd`` has the code for ``f1`` and ``f2``.

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

It looks identical to what we had in the [previous](with_header.md) page.