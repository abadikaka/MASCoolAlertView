# MASCoolAlertView

[![CI Status](http://img.shields.io/travis/abadikaka/MASCoolAlertView.svg?style=flat)](https://travis-ci.org/abadikaka/MASCoolAlertView)
[![Version](https://img.shields.io/cocoapods/v/MASCoolAlertView.svg?style=flat)](http://cocoapods.org/pods/MASCoolAlertView)
[![License](https://img.shields.io/cocoapods/l/MASCoolAlertView.svg?style=flat)](http://cocoapods.org/pods/MASCoolAlertView)
[![Platform](https://img.shields.io/cocoapods/p/MASCoolAlertView.svg?style=flat)](http://cocoapods.org/pods/MASCoolAlertView)

## Description
A simple and customizable Alert View and easy to use.
What does it offer ?

* custom title bar
* custom footer button
* custom view body
* custom close button

![Imgur Image](https://imgur.com/pW3SAk1.jpg)
![Imgur Image](https://imgur.com/OTf8k64.jpg)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## How to use

Initialize the MASCoolAlertView
```
self.newAlert = MASCoolAlertView(height: 200, width: 200, cornerRadius: 10, backgroundColor: .yellow)
```
add to the subview
```
self.view.addSubview(newAlert!)
```

set the title bar
```
self.newAlert!.setTitleBar(height: 50, backgroundColor: .green, titleColor: .blue, titleText: "Title Text")
```

set the title bar border
```
self.newAlert!.setTitleBarBorder(borderWidth: 1, borderColor: .red)
```

create the close button
```
self.newAlert!.createCloseButton(tintColor: .red, imageNamed: "close-circular.png", buttonSize: 24)
```

set the footer button
```
self.newAlert!.setFooterButton(buttonText: "Close", buttonColor: .black, buttonTextColor: .red, height: 50)
```

set the custom footer button handler
```
self.newAlert!.handleBottomButton = handleButton
```

set the body view using custom body
```
let newView = UIView(frame: CGRect(x: 10, y: self.newAlert!.topView!.bounds.maxY + 10, width: self.newAlert!.bounds.height - 20, height: self.newAlert!.bounds.height/3))
newView.backgroundColor = .blue
```

set the body content either using bodyText -- default -- or using custom body above
```
self.newAlert!.setBodyContent(bodyBackgroundColor: .clear, bodyTextColor: .black, bodyText: "Hello This is Text Field", bodyView: nil)
```

show the alert with duration delay and options effect (curveEaseIn, curveEaseOut, curveEaseInOut, specialCurve)
```
self.newAlert!.show(duration: 0.5, delay: 0.0, options: .curveEaseIn)
```

## Installation

MASCoolAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MASCoolAlertView'
```

## Author

abadikaka, abadi_kaka@yahoo.com
Michael Abadi Santoso, michael.abadi@ti.ukdw.ac.id

## License

MASCoolAlertView is available under the MIT license. See the LICENSE file for more info.
