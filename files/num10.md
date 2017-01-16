#### Method 10:  Import an Objective-C framework from a Swift program executing on the command line.  

**test.swift**

```css
// @testable import Encryptor
import AdderOC

let x = f1(1)
print("\nAD;  x:\(x)")
```

```bash
> xcrun swiftc test.swift -o prog -F ~/Library/Frameworks -sdk $(xcrun --show-sdk-path --sdk macosx) && ./prog
f1: 1;
AD;  x:2
>
```
We do `-F ~/Library/Frameworks` as before, and we also need to tell the linker where the SDK we are building for is located.

It all works!

```bash
> xcrun --show-sdk-path --sdk macosx
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk
> 
```