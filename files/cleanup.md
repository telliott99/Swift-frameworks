The first thing is to clean up the Desktop

```bash
> cd Desktop
> ls
>
```

And make a directory to hold our source files:


```bash
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

To perform any of the steps ahead, we work on the Desktop, removing all old files before we start, then copying in the files from ``src`` each time:

```bash
> cd build
> > rm *
rm: src: is a directory
> 
```

All the files (but not ``src``) will be removed.