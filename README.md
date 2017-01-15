## Frameworks and Libraries

This is an attempt to organize information about using Frameworks and Libraries for macOS, all in one place.

An outline of what we'll look at is

* classic C libraries, both static and dynamic
* C libraries wrapped into Cocoa frameworks
* calling libraries from Objective-C
* calling libraries from Swift
* writing and using Swift frameworks
* recovering ``rand`` and ``srand`` for use in Swift

One problem I've noticed in doing such tests is that one can easily be confused into thinking something you tried works, but it turns out to be using files left over from a previous attempt.

To avoid these problems we can follow the steps [here](files/cleanup.md).

####1: a [single file](files/single_file.md) with C code

####2: multiple C files [with a header](file/with_header.md) file

####3: a C [static library](files/static_library.md)

####4: a C static library in [~/Library/Frameworks](files/library_in_FW.md)

####5: a C [dynamic library](files/dynamic_library.md)

For the difference between static and dynamic libraries see [here](http://stackoverflow.com/questions/2649334).

####6: [Objective-C Framework](files/objc_framework.md) including our C files

####7: [OS X Framework](files/OS_X_framework.md) from the command line

####8: [Objective-C framework](files/num8.md) including our C files from a Swift app.

####xx: [Getting](files/getting_randy.md) the rand function back

####9:  [Swift code](files/swift_code.md) from the command line

####10:  [Swift code in a Playground](files/playground.md)

####11:  [Swift framework in a Playground](files/PG+framework.md)

####12:  [Swift frameworks generally](files/swift_code.md)
