# HexCodeClock

HexCodeClock is a OS X Screensaver (I believe it works on 10.9 and and newer).

The idea is, that time would be formatted as HHmmss, but in 24-hour format. If we take that, turn it into a string, and run it though NSColor as hex, we get our HexCodeClock!

For example:

- It is currently 3:17:23pm. 
- We take that in 24-hour time, as 15:17:23
- Remove the colons: 151723
- Add a pound sign so the time becomes a hexcolor: [#151723](http://www.colorhexa.com/151723)

### Version
1.0

### Installation

This was written using Xcode 7.0.1 and Swift 2.0. 

To install, double click the **.saver** file, and then go to **Desktop & Screen Saver** to preview the Screen Saver. 

If you'd like to compile and run from Xcode, what you need to do is:

1. Quit **System Preferences**
2. Build the project in **Xcode** (⌘+B)
3. In the **Products** folder, right click on **HexCodeClock.saver** and click: *Open in Finder*.
4. Here you'll find the **.saver** file, double click to install. If System Preferences prompts you to replace the existing screen saver, press **Replace**
5. That's it!




### To-Do!

 - Change Font to San Francisco
 - Build Light Variant (current version is too damn dark)

License
----

MIT


