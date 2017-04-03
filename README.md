ToastView
============

Class for toast presenting

## Instruction

Copy [Toast.swift](https://github.com/steelkiwi/ToastView/blob/master/Toast.swift) file to your project

Examples:
```swift
// 1
self.present(toast: Toast("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tristique maximus volutpat. Morbi vel dolor nec risus gravida malesuada non et lacus."), animated: true)

// 2
self.present(toast: Toast("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tristique maximus volutpat. Morbi vel dolor nec risus gravida malesuada non et lacus."), topOffset: 100.0, timeInterval: 3, animated: true, completion: nil)
```

Results:
1. [alt example-1-result](https://www.dropbox.com/s/p2rendayafm6xqo/iOS-Toast-Example-1.png)
2. [alt example-2-result](https://www.dropbox.com/s/vp7obi85r2jzbx7/iOS-Toast-Example-2.png)
