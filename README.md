# SwiftlyUI 🚀
**SwiftUI 风格的 UIKit 极速开发框架,通过重新设计 UIKit 的 API 边界， 采用 Swift 原生链式调用，实现「零转换成本」的 SwiftUI 式开发体验.**

[![CocoaPods](https://img.shields.io/cocoapods/v/SwiftlyUI)](https://cocoapods.org/pods/SwiftlyUI)
[![SPM](https://img.shields.io/badge/SPM-supported-green)](https://swift.org/package-manager/)

## 快速导航 🗺️
- [安装指南](#安装指南)
- [使用示例](#使用示例导航)
- [选择 SwiftlyUI](#技术优势全景图)
- [功能特性](#功能特性)

## 安装指南 📦<a name="安装指南"></a>
### CocoaPods
```ruby
pod 'SwiftlyUI'  # 核心组件
pod 'SwiftlyUI/SnapKitExt'  # 包含 SnapKit 扩展
```

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/CoderLineChan/SwiftlyUI.git", 
             from: "1.0.0")
]
```

## 使用示例导航 🔍 <a name="使用示例导航"></a>
- [UIView Build](#UIView-Build)
- [UIStackView Build](#UIStackView-Build)
- [UITextView Build](#UITextView-Build)
- [UITextField Build](#UITextField-Build)
- [UILabel Build](#UILabel-Build)
- [UIControl Build](#UIControl-Build)
- [UIButton Build](#UIButton-Build)




## 为什么选择 SwiftlyUI？📊 <a name="技术优势全景图"></a>
✅ 存量 UIKit 项目的现代化改造  
✅ 在 UIKit 基础上获得 SwiftUI 的开发体验  
✅ 需要 UIKit 完全掌控力的复杂界面开发  
✅ 与现有 Objective-C/Swift 代码深度整合  
✅ 渐进式改造而非全盘重写 
✅ 企业级适配 无缝接入现有非SwiftUI项目


## 功能特性 ✨ <a name="功能特性"></a>
### 🌟 链式语法革命
```swift
let stackView = UIStackView()
    .axis(.vertical)
    .spacing(10)
    .alignment(.center)
    .distribution(.fillEqually)
    .padding()
    .separator(color: .red, size: CGSize(width: 20, height: 2))
```

### 🧩 全组件覆盖
- 基础视图：UIView 支持边框/圆角/阴影/动画一站式配置
- 布局体系：UIStackView 支持智能边距与分隔线配置, UIVIew 支持添加父控件之前布局
- 文本控件：UITextView/UILabel 内置 placeholder 等实用扩展, 支持智能边距
- 交互元素：UIControl 强化事件处理，UIView 智能手势

### 🎮 手势与动画
- 智能手势系统
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
### 📐 布局革命
- 多模式布局方案自由选择
```
// layout自动布局
.frame(width: 100, minHeight: 200)

// SnapKit 集成
.snp { make in
    make.with.height.equalTo(30)
}

// 添加父控件之前布局
UIView().left(to: superView.leftAnchor, offset: 30)
        .top(to: superView, offset: 30)
        .fill(to: superView)
```



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
//正常布局方式
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

//未添加进父控件之前也可布局约束
let view = UIView()
    .left(to: superView.leftAnchor, offset: 30)
    .top(to: superView, offset: 30)
    .fill(to: superView)
    .fill(to: brother, uiEdgeInsets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
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







