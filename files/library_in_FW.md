#### Method 4:  Static library from ~/Library/Frameworks

The goal is to make a Cocoa app that uses ``f1`` and ``f2`` ... whether written in Objective C or in Swift.  

We are going to put our libraries into the ``Frameworks`` directory.  We will use the user's ``~/Library/Frameworks`` rather than the system-wide ``/Library/Frameworks``.  [Apple has different advice, but we are hobbyists].

Note that it can make things easier to have this directory in the Finder window.  It's not shown under the **Go** menu by default, but appears if you do Control-Command.

Now, follow these four steps.

* First, copy ``libadd.a`` into ``~/Library/Frameworks``.  From the command line you could do:

```bash
> cp libadd.a ~/Library/Frameworks
> ls ~/Library/Frameworks/l*
/Users/telliott_admin/Library/Frameworks/libadd.a
>
```

* Now, make a new Xcode project **Myapp** on the Desktop, a Cocoa app in **Objective C**. Add the library to the project by clicking + on Linked Frameworks and Libraries, with the project selected in the project navigator.  Navigate to ```~/Library/Frameworks/libadd.a``` and select it.

* Add the header file ``add.h`` to the new Cocoa project.  One way to do this is to first copy the file into the project directory that contains source files, and then add it by using AddFiles.  

* In the AppDelegate (either ``AppDelegate.h`` or ``AppDelegate.m``) do 

```c
#include "add.h"
```

In **applicationDidFinishLaunching** call the functions, e.g. here ``f1``

```c
int x = f1(1);
printf("AD: %d;", x);
```

The debug panel will log

```bash
f1: 1; AD: 2;
```

It works!

In the previous version I also showed how to build and use a dynamic library.  That all still works.
