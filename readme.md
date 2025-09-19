# HexCodeClock

HexCodeClock is a macOS Screensaver that displays the current time as a hex color code, with the background color changing based on the time.

![](https://github.com/eledroos/HexCodeClock/blob/master/img/HexCodeClock.gif)

The idea is, that time would be formatted as HHmmss, but in 24-hour format. If we take that, turn it into a string, and run it though NSColor as hex, we get our HexCodeClock!

For example:

- It is currently 3:17:23pm. 
- We take that in 24-hour time, as 15:17:23
- Remove the colons: 151723
- Add a pound sign so the time becomes a hexcolor: [#151723](http://www.colorhexa.com/151723)

### Version
2.0 - Updated for macOS 26 (Tahoe) compatibility

### Features
- Swift 5.0
- San Francisco font support
- Light and Dark mode support
- macOS 14.0+ compatibility
- Smooth color transitions

### Requirements
- macOS 14.0 or later
- Xcode 16.0 or later (for building from source)

### Installation

**Option 1: Install from built .saver file**
1. Download the latest `HexCodeClock.saver` file
2. Double-click the **.saver** file to install
3. Go to **System Settings > Lock Screen** to preview and enable the screensaver

**Option 2: Build from source**
1. Open `HexCodeClock.xcodeproj` in Xcode 16.0+
2. Build the project (⌘+B)
3. In the **Products** folder, right-click on **HexCodeClock.saver** and click: *Show in Finder*
4. Double-click the **.saver** file to install
5. Go to **System Settings > Lock Screen** to preview and enable the screensaver

### What's New in v2.0
- Complete rewrite using modern Swift syntax
- Updated for macOS 26 (Tahoe) compatibility
- Added San Francisco font support
- Implemented light/dark mode awareness
- Improved performance and reliability
- Updated minimum system requirement to macOS 14.0

### Development
This project was originally written using Xcode 7.0.1 and Swift 2.0, and has been completely modernized for current macOS versions.

### License
MIT