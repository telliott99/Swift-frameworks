#### Random numbers

In Swift3, the venerable C functions ``rand`` and ``srand`` have been made "unavailable in Swift".

While I'm sure there are good reasons for this (namely, cryptographic safety), it's bad for hobbyist programmers because the preferred function that is made available --- ``arc4random`` --- is not seedable, by design.

I think it's a really good thing to have "random" numbers reproducible between runs when testing new code, rather than insist on safety in this case.

Here is how to recover these functions for use in your Swift code.

First, we "wrap" the C library functions into our own C code.

**funcs.c**

```c
#import <stdlib.h>

int rand2() { return rand(); }
void srand2(int x) { srand(x); }

```

A header declares the prototypes:

**funcs.h**

```c
int rand2();
void srand2(int x);
```

We test by calling from:

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
A quick test from the command line:

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

Having seeded the PRNG, we get the same three random numbers (mod 500) for two runs in a row.

<hr>

Now, one approach would be to turn this into an Objective-C framework.

Make a new Cocoa project called **RandFW**, a framework, with the language set to Objective-C.  

Copy ``funcs.c`` to the directory in the project that holds source files.  From Xcode, add the file to the project (with the folder selected, not the project).

Copy these declarations into ``RandFW.h``

```c
void srand2(int x);
int rand2();
```

Place the declarations just after

```c
#import <Cocoa/Cocoa.h>
```

Build the framework.

Using the Show in Finder trick, copy it into ``~/Library/Frameworks``.

Call from C code on the command line:

```bash
> clang -g -o prog -F ~/Library/Frameworks/ -framework RandFW test.c -I ~/Library/Frameworks/RandFW.framework/Headers
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

It works.

Now write

**test.swift**

```swift
import RandFW

srand2(133)
for _ in 0..<3 {
    print(rand2() % 500)
}
print("--------")
srand2(133)
for _ in 0..<3 {
    print(rand2() % 500)
}

let x = rand2()
print(type(of: x))
```

```bash
> xcrun swiftc test.swift -o prog -F ~/Library/Frameworks -sdk $(xcrun --show-sdk-path --sdk macosx) && ./prog
331
118
9
--------
331
118
9
Int32
> 
```
I think those numbers look familiar.

These functions are also available in a Swift Cocoa app.  To use them in a Playground is more work, but we'll get there eventually.  See the very last section.