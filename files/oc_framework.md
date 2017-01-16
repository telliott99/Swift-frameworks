#### Method 6:  Objective-C framework on the command line.

Now, for our first framework, we will make a new Xcode framework in Objective C, called ``AdderOCFW``. 

Put ``add1.c`` and ``add2.c`` in the directory that holds the project files and then do Add Files... 

Paste the function prototype declarations from ``add.h`` into ``AdderOCFW.h`` which Xcode provided for us. 

Build it. Use the Show in Finder trick to find and then drag the Framework to ~/Library/Frameworks.

Now we'll try to use the framework from the command line.

I specify the path to find the header folder which is in the framework.  We need ``useadd.c`` on the Desktop.

```bash
> clang -g -o useadd -F ~/Library/Frameworks/ -framework AdderOCFW useadd.c -I ~/Library/Frameworks/AdderOCFW.framework/Headers
>
```

And it works:

```bash
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
> nm useadd
0000000100000000 T __mh_execute_header
                 U _f1
                 U _f2
0000000100000f00 T _main
                 U _printf
                 U dyld_stub_binder
>
``

This framework is a dynamic library.  That's why you see ``dyld_stub_binder``.

We can watch the library load with

```
> export DYLD_PRINT_LIBRARIES=1
> ./useadd
dyld: loaded: /Users/telliott_admin/Desktop/./useadd
dyld: loaded: /Users/telliott_admin/Library/Frameworks/AdderOCFW.framework/Versions/A/AdderOCFW
```