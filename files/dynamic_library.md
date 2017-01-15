#### Method 5:  dynamic library from ~/Library/Frameworks

Clean up first.

```bash
> rm -r * && cp ../src/* . && ls
```

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

To use it we *may* also compile `useadd.c` to an object .o file.

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