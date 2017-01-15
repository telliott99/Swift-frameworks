#### Method 8:  Objective-C framework from a Swift Cocoa app.

The basics: open a new Xcode project in Swift and call it MyApp. We need a "bridging header", we get this by adding a new Objective C file, then Xcode will ask if we want this header, and we say yes. 

![](figs/bridging_header.png)

Ungratefully, we promptly delete the dummy Objective C class. In the header, add:

```css
#import "AdderOC/AdderOC.h"
```

You also need to link to the framework, by adding it to Linked Libraries and Frameworks, as we did before.

Add this to **ApplicationDidFinishLaunching**

```css
let x = f1(1)
print("\nAD;  x:\(x)")
```

Build and run and  it will log

```css
f1: 1;
AD;  x:2
```

We even get the ``printf`` from C!

#### Method 10:  Import an Objective-C framework from a Swift program executing on the command line.  

**testAdder.swift**

```css
// @testable import Encryptor
import AdderOC

let x = f1(1)
print("\nAD;  x:\(x)")
```

```bash
> xcrun swiftc testAdder.swift -o prog -F ~/Library/Frameworks -sdk $(xcrun --show-sdk-path --sdk macosx) && ./prog
f1: 1;
AD;  x:2
>
```
We do `-F ~/Library/Frameworks` as before, and we also need to tell the linker where the SDK we are building for is located.

It all works!