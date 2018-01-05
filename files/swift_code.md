#### Swift framework called from Swift at the command line

Even for small projects, it is nice to have the ability to split up your code into several files.

In Swift, we can do this in different ways.  The first, to be discussed here is:  working from the command line.  The others are: adding resources to a Playground, or importing a framework into a Cocoa app.


**stringStuff.swift**:

```swift
import Foundation

extension String {
    func stripCharacters(input: String) -> String {
        let badChars = input.characters
        let ret = self.characters.filter {
            !badChars.contains($0) }
        return String(ret)
    }
}
```

**main.swift**:

```swift
var s = "a$b#c."
print(s.stripCharacters(input: "$#."))
```

The name ``main.swift`` for the main file is required.  On the command line:

```bash
> swiftc stringStuff.swift main.swift -o prog && ./prog
abc
>
```
