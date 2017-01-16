#### Method 4:  Static library from ~/Library/Frameworks

Having made a static library ``libadd.a`` in the previous step, we now try moving it to one of the standard directories for storing libraries.

The eventual goal is to make a Cocoa app that uses ``f1`` and ``f2`` ... whether written in Objective C or in Swift.  

<hr>

We are going to put our libraries into the directory ``Frameworks``, where libraries and frameworks should go.  

We will use the user's ``~/Library/Frameworks`` rather than the system-wide ``/Library/Frameworks`` (not to be confused with ``/System/Library/Frameworks``.

[Apple has different advice, but we are hobbyists, and I think this is a better choice].

It can make things easier to have this directory in the navigation thingie in the Finder window.

![](figs/finder.png)

It's not shown under the **Go** menu by default.

But it appears if you do Shift-Command.

![](figs/finder2.png)

So you can drag it over to the sidebar.

<hr>

Now, follow these four steps.

* First, copy ``libadd.a`` into ``~/Library/Frameworks``.  From the command line you could do:

```bash
> rm *
rm: src: is a directory
rm: useadd.dSYM: is a directory
> fw=~/Library/Frameworks
> cp src/libadd.a $fw
> ls $fw/lib*
/Users/telliott_admin/Library/Frameworks/libadd.a
>
```
or you can just use what we set up in the Finder a second ago.

![](figs/libadd.png)

As on the previous page, **useaddext.c** has been modified to not ``#import "add.h"`` but instead declare ``f1`` and ``f2``:

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

Now, we just try it from the command real quick:

```bash
> cp src/useaddext.c .
> clang -g -Wall -o useadd useaddext.c -L/Users/telliott_admin/Library/Frameworks -ladd
```

I don't have to tell you to substitute your username, right?

```bash
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```
Seems to work!

A few notes on this.  I was suspicious that the library might not have been built into the program (it's supposed to be static but we don't have ``-static`` in the line above and it doesn't work if we put it there.

So I did this:

```bash
> rm $fw/libadd.a
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

The point is that after building and running **useadd**, I removed the library from the Frameworks directory.  It still works.

Or we could just examine the binary:

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

The symbols for ``f1`` and ``f2`` are there.  They won't be there for a dynamic library.
