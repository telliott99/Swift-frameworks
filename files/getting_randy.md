#### Random numbers

This is not numbered as a method, but it seems to fit here.  In Swift3, the venerable C functions ``rand`` and ``srand`` have been made "unavailable in Swift".

While I'm sure there are good reasons for this (namely cryptographic safety), it's bad for hobbyist programmers because the preferred function ``arc4random`` is not seedable --- by design.

I think it's much better not to worry about our "random" numbers not being reproducible between runs, when testing new code.

Here is how to recover these functions for use in your Swift code.

**funcs.c**

```c
#import <stdlib.h>

int rand2() {
    return rand();
}

void srand2(int x) {
    srand(x);
}
```

**funcs.h**

```c
int rand2();
void srand2(int x);
```

**test.c**

```c
#import "funcs.h"
#import "stdio.h"

int main(int argc, char** argv){
    int i, n;
    n = 3;
    srand2(133);
    for( i = 0 ; i < n ; i++ ) {
        printf("%d\n", rand2() % 500);
    }
    printf("-----\n");
    srand2(133);
    for( i = 0 ; i < n ; i++ ) {
        printf("%d\n", rand2() % 500);
    }
    return(0);
}

```

```bash
> clang -g -Wall -c funcs.c
> clang -g -Wall test.c funcs.o -o test && ./test
331
118
9
-----
331
118
9
>
``` 

Now, one approach is to turn this into an Objective-C framework.

Make a new Cocoa project called **MyRand**, a framework, in Objective-C.  Copy ``funcs.c`` to the directory in the project that holds source files.  From Xcode, add the file to the project (with the folder selected, not the project).

Copy these declarations into ``MyRand.h``

```c
void srand2(int x);
int rand2();
```

just after

```c
#import <Cocoa/Cocoa.h>
```

Build the framework.

Copy it into ``~/Library/Frameworks``.

Call it from C code on the command line:

```bash
> clang -g -o prog -F ~/Library/Frameworks/ -framework MyRand test.c -I ~/Library/Frameworks/AdderOC.framework/Headers
> ./prog
331
118
9
-----
331
118
9
>
```

Now write

**test.swift**

```swift
import MyRand

srand2(133)
for _ in 0..<5 {
    print(rand2() % 50)
}

let x = rand2()
print(type(of: x))
```

```bash
> xcrun swiftc test.swift -o prog -F ~/Library/Frameworks -sdk $(xcrun --show-sdk-path --sdk macosx) && ./prog
31
18
9
47
0
Int32
>
```

These functions are available in a Swift Cocoa app.  To use them in a Playground is more work, but we'll get there eventually.