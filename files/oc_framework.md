#### Method 6:  Objective-C framework on the command line.

Now, for our first framework, we will make a new Xcode framework in Objective C, called ``AdderOC``. Put ``add1.c`` and ``add2.c`` in the directory that holds the project files and then do Add Files... 

Paste the function prototype declarations from ``add.h`` into ``AdderOC.h`` which Xcode provided for us. 

Build it. Use the Show in Finder trick to find and then drag the Framework to ~/Library/Frameworks.

Now we'll try to use the framework from the command line.

I specify the path to find the header folder which is in the framework.  We need ``useadd.c`` on the Desktop.

```bash
> clang -g -o useadd -F ~/Library/Frameworks/ -framework AdderOC useadd.c -I ~/Library/Frameworks/AdderOC.framework/Headers
>
```

And it works:

```bash
>  ./useadd
useadd
f1: 1;  main 2
f2: 10;  main 12
>
```
