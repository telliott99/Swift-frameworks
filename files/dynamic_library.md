#### Method 7:  dynamic library

Clean up first.  But save the source files!  :)
Ask me how I know.

Once again, **useaddext.c** does not reference **add.h** but just declares ``f1`` and ``f2`` as extern.

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

To build the dynamic library (with **add1.c** and **add2.c** code from [here](with_header.md)).

```bash
> clang -g -Wall -c add*.c
> clang -dynamiclib -current_version 1.0  add*.o  -o libadd.dylib
```
Now we can do something like this:

```bash
> clang useaddext.c ./libadd.dylib -o useadd
> 
```

Since I still have that environment variable set

```
> export DYLD_PRINT_LIBRARIES=1
> 
```

I get something extra:

```bash
> clang useaddext.c ./libadd.dylib -o useadd
> ./useadd
dyld: loaded: /Users/telliott_admin/Desktop/./useadd
dyld: loaded: libadd.dylib
dyld: loaded: /usr/lib/libSystem.B.dylib
..
f1: 1;   main 2
f2: 10;   main 12
>
```

A couple of wrinkles.  We *may* also compile `useadd.c` to an object .o file.

```bash
> clang -c useaddext.c
>
```
And link it

```bash
> clang useaddext.o libadd.dylib -o useadd
```
(or

```bash
> clang useaddext.o ./libadd.dylib -o useadd
```
)

And look at it with ``otool``:

```bash
> otool -L useadd
useadd:
	libadd.dylib (compatibility version 0.0.0, current version 1.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1238.0.0)
```
Look at the symbols

```bash
> nm -gpv useadd
0000000100000000 T __mh_execute_header
0000000100000f00 T _main
                 U _f1
                 U _f2
                 U _printf
                 U dyld_stub_binder
> 
```

We can watch the library being loaded:

```bash
> export DYLD_PRINT_LIBRARIES=1
> ./useadd
dyld: loaded: /Users/telliott_admin/Desktop/./useadd
dyld: loaded: libadd.dylib
..
```