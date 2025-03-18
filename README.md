# SwiftlyUI 🚀
**UIKit 的 SwiftUI 式极速开发框架** | **SwiftUI-style Rapid Development Framework for UIKit**  
通过重新设计 UIKit 的 API 边界，采用 Swift 原生链式调用，实现「零转换成本」的 SwiftUI 式开发体验。  
Redesigning UIKit's API boundaries with native Swift chaining calls to achieve zero-conversion-cost SwiftUI-style development experience.

[![CocoaPods](https://img.shields.io/cocoapods/v/SwiftlyUI)](https://cocoapods.org/pods/SwiftlyUI)
[![SPM](https://img.shields.io/badge/SPM-supported-green)](https://swift.org/package-manager/)

## 快速导航 🗺️ | Quick Navigation
- [安装指南 | Installation](#安装指南)
- [使用示例 | Examples](#使用示例导航)
- [核心优势 | Advantages](#技术优势全景图)
- [功能特性 | Features](#功能特性)

## 安装指南 📦| Installation <a name="安装指南"></a>
### CocoaPods
```ruby
# 核心组件 | Core components
pod 'SwiftlyUI'
# SnapKit 扩展 | SnapKit extensions
pod 'SwiftlyUI/SnapKitExt'
```

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/CoderLineChan/SwiftlyUI.git", 
             from: "1.0.0")
]
```

## 使用示例导航 🔍 | Examples <a name="使用示例导航"></a>
- [UIView Build](#UIView-Build)
- [UIStackView Build](#UIStackView-Build)
- [UITextView Build](#UITextView-Build)
- [UITextField Build](#UITextField-Build)
- [UILabel Build](#UILabel-Build)
- [UIControl Build](#UIControl-Build)
- [UIButton Build](#UIButton-Build)




## 核心优势 📊 | Advantages <a name="技术优势全景图"></a>
✅ **存量项目现代化** (Modernize Legacy Projects)  
  渐进式改造现有 UIKit 代码 | Progressive refactoring for existing UIKit code
  
✅ **开发体验革新** (Development Revolution)  
  在 UIKit 上获得 SwiftUI 的开发效率 | SwiftUI-like efficiency on UIKit foundation
  
✅ **完全掌控力** (Full Control)  
  保留 UIKit 的底层控制能力 | Maintain UIKit's low-level control capabilities
  
✅ **深度整合** (Deep Integration)  
  无缝兼容 Objective-C/Swift 代码 | Seamless compatibility with Objective-C/Swift
  
✅ **企业级适配** (Enterprise Ready)  
  非 SwiftUI 项目的完美解决方案 | Perfect solution for non-SwiftUI projects


## 功能特性 ✨ | Features <a name="功能特性"></a>
### 🌟 链式语法革命 | Fluent Syntax Revolution
```swift
let stackView = UIStackView()
    .axis(.vertical)
    .spacing(10)
    .alignment(.center)
    .distribution(.fillEqually)
    .padding()
    .separator(color: .red, size: CGSize(width: 20, height: 2))
```


### 🎮 智能手势系统 | Smart Gesture System
```
let view = UIView()
  .onGesture(.doubleTap) { _ in print("双击触发") }
  .onGesture(.swipe(.up)) { _ in showMenu() }
```
- 声明式动画引擎
```
withAnimation(.spring(duration: 0.8)) {
    view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
} completion: { _ in /* 动画收尾逻辑 */ }
```
### 📐 多模式布局 | Multi-Layout Modes
```
// 自动布局 | Auto Layout
.frame(width: 100, minHeight: 200)

// SnapKit 
.snp { make in
    make.with.height.equalTo(30)
}

// 父控件前布局 | Pre-Superview Layout
UIView().left(to: superView.leftAnchor, offset: 30)
        .top(to: superView, offset: 30)
        .fill(to: superView)
```

## 组件构建示例 | Component Build Examples

### UIView Build<a name="UIView-Build"></a>
Basics
```swift
let view = UIView()
    .backgroundColor(.clear)
    .border(.orange)
    .border(.black, 2)
    .cornerRadius(8)
    .alpha(0.5)
    .opacity(0.5)
    .hidden(false)
    .hidden()
    .tag(100)
    .userInteractionEnabled(false)
    .userInteractionEnabled()
    .shadow(color: .black, radius: 3, opacity: 0.3, offset: .zero)
    .backgroundView {
      UIView()
    }

and more ...
```

- Layout
```swift
//自动布局 | Auto Layout
let brother = UIView()
    .frame(width: 100, height: 200)
    .frame(width: 20)
    .frame(height: 100)
    .frame(minWidth: 50)
    .frame(maxWidth: 200)
    .snp { make in // if Import SnapKit
        make.width.equalTo(100)
        make.height.equalTo(200)
    }

//父控件前布局 | Pre-Superview Layout
let view = UIView()
    .left(to: superView.leftAnchor, offset: 30)
    .top(to: superView, offset: 30)
    .fill(to: superView)
    .fill(to: brother, UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    .leading(to: superView)
    .bottom(to: superView)
    .width(20)
    .width(to: view, multiplier: 1.2)

superView.addSubview(brother)     
superView.addSubview(view)
```

- Gesture
```swift
let view = UIView()
    .onGesture(.tap) { _ in
        // action
    }
    .onGesture(.tap, action:gestureAction)
    .onGesture(.doubleTap, action: onTapGestureAction)
    .onGesture(.pan, action: onPanGestureAction)
    .onGesture(.rotation, action: onRelocationGestureAction)
    .onGesture(.pinch, action: onPinchGestureAction)
    .onGesture(.swipe(direction: .down), action: onSwipeGestureAction)
    .onGesture(.longPress(minimumDuration: 1), action: onLongPressGestureAction)

func onGestureAction(_ gesture: UIGestureRecognizer) { }
func onTapGestureAction(_ gesture: UITapGestureRecognizer) { }
func onPanGestureAction(_ gesture: UIPanGestureRecognizer) { }
func onSwipeGestureAction(_ gesture: UISwipeGestureRecognizer) { }
func onPinchGestureAction(_ gesture: UIPinchGestureRecognizer) { }
func onRelocationGestureAction(_ gesture: UIRotationGestureRecognizer) { }
func onLongPressGestureAction(_ gesture: UILongPressGestureRecognizer) { }
```

- animations
```swift
withAnimation {
    self.box.alpha = 1.0
}

withAnimation(.default) {
    self.box.alpha = 1.0
}

withAnimation(.default(duration: 0.5)) {
    self.box.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
}

withAnimation(.default(duration: 0.5)) {
    self.box.alpha = 1.0
} completion: { _ in
    self.box.removeFromSuperview()
}

withAnimation(.default(duration: 0.5), completion: { _ in
    self.box.alpha = 0.0
}) {
    self.box.removeFromSuperview()
}

withAnimation(.easeInOut) {
    self.box.centerYConstraint.constant += 100
    self.box.layoutIfNeeded()
}

withAnimation(.easeInOut(duration: 0.5, delay: 0.5, refreshAllViews: true)) {// refreshAllViews default is False
    self.box.centerYConstraint.constant += 100
    self.box.layoutIfNeeded()
}

withAnimation(.easeIn) {
    self.box.centerYConstraint.constant += 100
    self.box.layoutIfNeeded()
}

withAnimation(.easeOut) {
    self.box.alpha = 1.0
}

withAnimation(.linear) {
    self.box.alpha = 1.0
}

withAnimation(.delay(0.5, animation: .default)) {
    self.box.backgroundColor = .green
}

withAnimation(.spring(duration: 0.5, dampingRatio: 0.5, initialVelocity: 0.5)) {
    self.box.centerYConstraint.constant += 100
    self.box.layoutIfNeeded()
}

withAnimation(.repeatCount(3, autoreverses: true, animation: .default)) {
    self.box.transform = CGAffineTransform(rotationAngle: .pi/4)
}

withAnimation(.repeatForever(autoreverses: true, animation: .default)) {
    self.box.transform = CGAffineTransform(rotationAngle: .pi/4)
}
```

## UIStackView Build<a name="UIStackView-Build"></a>
```swift
let stackView = UIStackView()
    .axis(.vertical)
    .spacing(10)
    .alignment(.center)
    .distribution(.fillEqually)
    .padding()// all padding default 16
    .padding(.all)// default 16
    .padding(.all, 20)
    .padding(.top)// default 16
    .padding(.bottom, 20)
    .padding(.left, 20)
    .padding(.right, 20)
    .padding(.horizontal)// default 16
    .padding(.vertical, 30)
    .separator(color: .red, size: CGSize(width: 20, height: 2))
```

## UITextView Build<a name="UITextView-Build"></a>
```swift
let textView = UITextView()
    .font(.regular(16))
    .textColor(.black)
    .foregroundColor(.black)
    .alignment(.left)
    .keyboardType(.numberPad)
    .text("input text")
    .placeholder("placeholder", color: .placeholderText)
    .editable(true)
    .maxLength(50)
    .padding()
    .padding(.horizontal, 10)
    .padding(.vertical, 10)
    .onTextChange(onTextChangeAction)
    .onTextChange(onTextViewChangeAction)
    .onBeginEditing(onBeginEditingAction)
    .onEndEditing(onEndEditingAction)


func onTextChangeAction(_ text: String) {}
func onTextViewChangeAction(_ textView: UITextView) {}
func onBeginEditingAction(_ textView: UITextView) {}
func onEndEditingAction(_ textView: UITextView) {}
```

## UITextField Build<a name="UITextField-Build"></a>
```swift
let textField = UITextField()
    .font(.regular(16))
    .textColor(.black)
    .foregroundColor(.black)
    .alignment(.left)
    .keyboardType(.numberPad)
    .text("input text")
    .placeholder("placeholder", color: .placeholderText)
    .padding()
    .padding(.horizontal, 10)
    .padding(.vertical, 10)
    .maxLength(10)
    .onTextChange(onTextChangeAction)
    .onTextChange(onTextViewChangeAction)
    .onBeginEditing(onBeginEditingAction)
    .onEndEditing(onEndEditingAction)


func onTextChangeAction(_ text: String) {}
func onTextViewChangeAction(_ textView: UITextView) {}
func onBeginEditingAction(_ textView: UITextView) {}
func onEndEditingAction(_ textView: UITextView) {}
```

## UILabel Build<a name="UILabel-Build"></a>
```swift
let label = UILabel()
    .font(.regular(16))
    .textColor(.black)
    .foregroundColor(.black)
    .alignment(.left)
    .text("input text")
    .lineSpacing(20, wordSpacing: 2)
```


## UIControl Build<a name="UIControl-Build"></a>
```swift
let contorl = UIControl()
    .onAction { print("click") }
    .onAction(for: .touchUpInside, action: { print("click") })
    .onAction(self, action: #selector(click))
```

## UIButton Build<a name="UIButton-Build"></a>
```swift
let button = UIButton()
    .image(UIImage(named: "image"), state: .normal)
    .imageName("local_imageName", state: .selected)
    .backgroundImage(UIImage.gradient(colors: [.red, .green], direction: .leftToRight, size: CGSize(width: 100, height: 100)))
    .backgroundImageName("local_imageName", state: .normal)
    .cornerRadius(20)
    .onAction{ print("action") }
```







