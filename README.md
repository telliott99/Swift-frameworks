## Frameworks and Libraries

This write-up is an attempt to organize information about using Frameworks and Libraries for macOS, all in one place.

It's a challenge to come up with a scheme for organizing things.  Some questions that arise:

* in what language is the helper function, library or framework written?
* is it from macOS or from me, the user?
* where is the library or framework currently located?
* in what language is the caller written?
* are we compiling on the command line, calling from a Cocoa app or what?

Roughly speaking, we'll try to organize things that way, from the outside in.

An outline of what we'll look at is

* classic C libraries, both static and dynamic
* C libraries wrapped into Cocoa frameworks
* calling libraries from Objective-C
* calling libraries from Swift
* writing and using Swift frameworks

One problem I've noticed in doing such tests, is that one can easily be confused into thinking something you tried works, but it turns out to have actually used object code or even files left over from a previous attempt.

To avoid these problems, especially with C code, we can follow the steps [here](files/cleanup.md).

<hr>

So here is a list of the short focused items we'll cover.

###C code:

####1: a [single file](files/single_file.md) containing C code

####2: multiple C files with a [header](files/with_header.md) file

###C code libraries

####3: a C [static lib](files/static_library_cl.md) on the Desktop from the command line

####4: a C static library in [~/Library/Frameworks](files/static_library_in_FW.md) from the command line

####5: a C static library in [~/Library/Frameworks](files/c_static_library_app.md) from a Cocoa Objective-C app

####6: [Objective-C Framework](files/oc_framework.md) wrapping our C files

####7: a C [dynamic library](files/dynamic_library.md)

For the difference between static and dynamic libraries see [here](http://stackoverflow.com/questions/2649334).

<hr>

###Objective-C frameworks:

####8: [OS X Framework](files/OS_X_framework.md) from the command line

####xx: [Getting](files/getting_randy.md) the rand function back

<hr>

### Swift calling code

####10: [Objective-C framework](files/num10.md) including our C files from Swift on the command line.

####11: [Objective-C framework](files/num8.md) including our C files from a Swift Cocoa app.

<hr>

### Swift

####12:  [Swift framework](files/swift_code.md) called by Swift at the command line

####13:  [Swift frameworks](files/swift_frameworks.md) generally

<hr>

### Playgrounds

####14:  [Swift code in a Playground](files/playground.md)

####15:  [Swift framework in a Playground](files/PG+framework.md)