# AutoLayoutDSL

A simple DSL for using AutoLayout within UIKit.

```
label.layout {
    $0.top == view.topAnchor + 16
    $0.width == view.widthAnchor * 0.5 - 12
    $0.height >= 42
}

imageView.layout {
    $0.centerX == view.centerXAnchor
    $0.centerY == view.centerYAnchor + 25
}
```
