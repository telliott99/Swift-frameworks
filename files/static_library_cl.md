#### Method 3:  Static C library

We make the functions from the previous exercise into an old-fashioned C library:

```bash
> rm useadd
> clang -g -Wall -c add*.c
> libtool -static add*.o -o libadd.a
>
```

And use it like this:

```bash
> clang -g -Wall -o useadd useadd.c -L. -ladd
> ./useadd
useadd
f1: 1;  main 2
f2: 10;  main 12
>
```
