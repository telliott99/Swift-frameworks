## Add a Framework to a Playground

Start by creating a new project in Xcode:

* OS X Cocoa Framework
* Swift
* name: **FW**

Select the FW *folder*

![](figs/folder_selected.png)

New > File > New

* Swift file
* name: **File.swift**

![](figs/new_Swift_file.png)

```css
public class Talk {
    public class func hello() -> String {
        print("hi there")
        return "Hello from FW"
    }
}
```

I couldn't get **print** to work into the Playground output, but returning a value is more useful, anway.

* Build the project

With the project selected, 

![](figs/project_selected.png)

Do 

* save as File > Workspace

![](figs/save_workspace.png) 

* name:  **FW.xcworkspace**

Create a new Playground

Save it inside the project folder next to the Swift files.  We do the save here:

![](figs/add_to_project.png)

You must still add the Playground to the project.  Click on the *project* tab and do File > AddFiles and navigate to the Playground file.

![](figs/save_playground.png)
 
Build the FW project again.

In the playground:

![](figs/in_playground.png)

```css
import FW
Talk.hello()
```

[ ``hello`` by itself won't work.]
<<<<<<< HEAD

![](figs/not_just_hello.png)

It works!  The ``print`` statement  in the Framework shows up in the Debug area.  ``

![](figs/playground_talks.png)

If you have issues make sure that in your
Xcode Preferences:  Locations > Advanced > configuration is 'Unique'.

Note:  you must have the Xcode project open and click on the playground in the project navigator.  You can't just open the Playground from the Finder, like here:

![](figs/save_playground.png)

If you do that you'll get the dreaded:

=======

![](figs/not_just_hello.png)

It works!  The ``print`` statement  in the Framework shows up in the Debug area.  ``

![](figs/playground_talks.png)

If you have issues make sure that in your
Xcode Preferences:  Locations > Advanced > configuration is 'Unique'.

Note:  you must have the Xcode project open and click on the playground in the project navigator.  You can't just open the Playground from the Finder, like here:

![](figs/save_playground.png)

If you do that you'll get the dreaded:

>>>>>>> finishing up
![](figs/no_such_module.png)