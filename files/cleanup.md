The first thing is to make two directories on the Desktop:

```bash
> cd Desktop
> mkdir build
> mkdir src
```

Copy into ``src`` the code files we'll be using 

```bash
> pwd
/Users/telliott_admin/Desktop
> ls src
add.h		add2.c		useadd.c
add1.c		test.c
```

To perform any of the steps ahead, we work in the ``build`` directory, erasing the whole thing before we start, then copying in the files from ``src`` each time:

```bash
> cd build
> rm -r * && cp ../src/* . && ls
add.h		add2.c		useadd.c
add1.c		test.c
>
```