#### Method 7:  dynamic library

Clean up first.  But save the source files!  :)
Ask me how I know.

```bash
> clang -g -Wall -c add*.c
> clang -dynamiclib -current_version 1.0  add*.o  -o libadd.dylib
> clang useadd.c ./libadd.dylib -o useadd
> ./useadd
useadd
f1: 1;  main 2
f2: 10;  main 20
>
```

If you want, explore a bit with **otool**

```bash
> otool -L libadd.a
Archive : libadd.a
libadd.a(add1.o):
libadd.a(add2.o):
> otool -L libadd.dylib
libadd.dylib:
	libadd.dylib (compatibility version 0.0.0, current version 1.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1226.10.1)
>
```

We *may* also compile `useadd.c` to an object .o file.

```bash
> clang -c useadd.c
> clang useadd.o ./libadd.dylib -o useadd
> ./useadd
useadd
f1: 1;  main 2
f2: 10;  main 20
>
```

We can also copy ``libadd.dylib`` to the Frameworks directory and import it like we did before.

```bash
> cp libadd.dylib ~/Library/Frameworks
> clang useadd.c -o useadd ./libadd.dylib -L/Users/telliott_admin/Library/Frameworks
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```