#### Method:  Dynamic library in ~/Library/Frameworks or /usr/local/lib

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

### /usr/local/lib

To actually build/run this, it helps to use a directory that the linker searches.  I found one that works (of course!):  ``/usr/local/lib``

```bash
> mv ~/Desktop/libadd.dylib /usr/local/lib
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```
We can also build against the library in that location, if we specify the path correctly:

```bash
> clang useaddext.c -ladd -L/usr/local/lib -o useadd && ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

So that's the answer to that!  If we still have ``add.h`` rather than declaring the functions in our code, we would need to have the header file in ``/usr/local/include`` (or on the Desktop).  With the library in ``/usr/local/lib`` and the header on the Desktop:

Switch out ``useadd.c`` for ``useaddext.c``

```bash
> clang useadd.c -ladd -L/usr/local/lib -o useadd 
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

If the header is hidden

```bash
> clang useadd.c -ladd -L/usr/local/lib -o useadd 
useadd.c:2:9: fatal error: 'add.h' file not found
#import "add.h"
        ^
1
```
Copy the header to ``/usr/local/lib``

```bash
> clang useadd.c -ladd -L/usr/local/lib -o useadd 
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```

I don't seem to need the ``-I`` flag.


