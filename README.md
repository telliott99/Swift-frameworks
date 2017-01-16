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

* [single file](files/single_file.md) containing C code

* multiple C files with a [header](files/with_header.md) file

<hr>

### C code libraries

* a C [static lib](files/static_library_cl.md) on the Desktop from the command line

* a C static library in [~/Library/Frameworks](files/static_library_in_FW.md) from the command line

* a C static library in [~/Library/Frameworks](files/c_static_library_app.md) from a Cocoa Objective-C app

* [Objective-C Framework](files/oc_framework.md) wrapping our C files

* a C [dynamic library](files/dynamic_library.md)

* dynamic library in [~/Library/Frameworks](files/dynamic_library_in_FW.md) from the command line

For the difference between static and dynamic libraries see [here](http://stackoverflow.com/questions/2649334).  The main difference is that a dynamic library can be shared between different programs, and its code isn't actually present in the object code.

<hr>

### Objective-C frameworks:

It's only worth looking at these older ways of doing things to have some insight into what a library is.

The modern way on macOS is to use a Framework.

* [OS X Framework](files/OS_X_framework.md) from the command line

Certainly the simplest way to use C code in a modern Cocoa app is to just add the .c files to the Xcode project.  If you already have something like ``libadd.a`` or ``libadd.dylib`` then things are (much) more complicated.

I found an [article](https://pewpewthespells.com/blog/convert_static_to_dynamic.html) that describes how to repackage legacy libraries into Frameworks.  I haven't worked through all that yet.

<hr>

### Swift calling Objective-C frameworks

* [Getting](files/getting_randy.md) the rand function back into Swift.

* [Objective-C framework](files/num10.md) including our C files called by Swift on the command line.

* [Objective-C framework](files/num8.md) including our C files called from a Swift Cocoa app.

<hr>

### Swift frameworks

*  [Swift framework](files/swift_code.md) called by Swift at the command line

*  [Swift frameworks](files/swift_frameworks.md) generally

<hr>

### Playgrounds

*  Swift code in an Xcode [Playground](files/playground.md)

*  Adding a Swift framework to an Xcode [Playground](files/PG+framework.md)