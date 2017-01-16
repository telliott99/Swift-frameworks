#### Method:  Dynamic library in ~/Library/Frameworks

We would like to be able to copy ``libadd.dylib`` to the Frameworks directory and import it like we did before. 

Build the library as shown on the [previous](dynamic_library.md) page.

We can simplify the code by making an alias for the target Frameworks directory:

```bash
> fw=~/Library/Frameworks/
> 
```

but there is a trap to watch out for as you will see.

Now, move the library:

```bash
> mv libadd.dylib $fw
```

Having done everything as we did before, but moved the library, we try to use the version of ``useadd`` that was built with the dynamic library present on the Desktop (after moving it away):

```bash
> ./useadd
dyld: Library not loaded: libadd.dylib
  Referenced from: /Users/telliott_admin/Desktop/./useadd
  Reason: image not found
Abort trap: 6
> export DYLD_LIBRARY_PATH=$fw
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

We see that it fails at first and then it works if ``DYLD_LIBRARY_PATH=$fw`` is set and ``libadd.dylib`` is present in ``~/Library/Frameworks``.  **Don't forget to export!**

Also, be careful that `$fw` has been defined.  If it's not defined (say, because we just launched a new session in Terminal), then the ``export`` fails silently:

```bash
> export DYLD_LIBRARY_PATH=$fw
> echo DYLD_LIBRARY_PATH
DYLD_LIBRARY_PATH
> ./useadd
dyld: Library not loaded: libadd.dylib
  Referenced from: /Users/telliott_admin/Desktop/./useadd
  Reason: image not found
Abort trap: 6
>
```

I thougt it should work without the ``DYLD_LIBRARY_PATH`` if we copy the dynamic library to ``/Library/Frameworks`` but no.

```bash
> sudo cp libadd.dylib /Library/Frameworks/
> ls /Library/Frameworks/lib*
/Library/Frameworks/libadd.dylib
> ./useadd
dyld: Library not loaded: libadd.dylib
  Referenced from: /Users/telliott_admin/Desktop/./useadd
  Reason: image not found
Abort trap: 6
>
```

Building with the library in the ``~/Library/Frameworks`` directory can be done if we tell the compiler where to look for the library:

```bash
> clang useaddext.c -o useadd -ladd -L$fw
> 
```

But it's not linked either

```bash
> fw=~/Library/Frameworks
> clang useaddext.c -o useadd -ladd -L$fw
> ./useadd
dyld: Library not loaded: libadd.dylib
  Referenced from: /Users/telliott_admin/Desktop/./useadd
  Reason: image not found
Abort trap: 6
> export DYLD_LIBRARY_PATH=$fw
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

It only works because ``DYLD_LIBRARY_PATH`` is set.

To actually build and link:

```bash
> clang useaddext.c -ladd -L$fw -I$fw -o useadd
```
That should work, and I thought it worked, but it isn't working now.  So I guess that means it doesn't work.  

Currently, the only way to fix this that I know is:

```bash
> export DYLD_LIBRARY_PATH=$fw
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

