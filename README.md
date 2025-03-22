# SwiftlyUI 🚀
**为 UIKit 注入 SwiftUI 的开发效率**  
通过链式语法和现代化 API 设计，让 UIKit 开发更简洁高效，同时保持完整控制权，实现「零转换成本」的 SwiftUI 式开发体验。  

[![CocoaPods](https://img.shields.io/cocoapods/v/SwiftlyUI)](https://cocoapods.org/pods/SwiftlyUI)
[![SPM](https://img.shields.io/badge/SPM-supported-green)](https://swift.org/package-manager/)

## 快速导航 🗺️ | Quick Navigation
- [安装指南 | Installation](#安装指南)
- [为什么选择 SwiftlyUI？](#技术优势全景图)
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


## 为什么选择 SwiftlyUI？ <a name="技术优势全景图"></a>
✅ **渐进式迁移** 无需重写现有代码，可逐步改造 UIKit 项目
  
✅ **Swift 原生支持** 专为 Swift 设计的链式语法，类型安全且 IDE 友好
  
✅ **完整 UIKit 能力** 保留底层控件操作能力，不引入额外抽象层
  
✅ **企业级兼容** 支持 iOS 11+，完美适配存量项目


## 功能特性 ✨ | Features <a name="功能特性"></a>
### 🌪️ 链式语法：属性设置增强
- 极简代码：比原生代码减少 60% 的冗余字符
- 内边距精准设置,支持单边/全局/横向/纵向
- 内置分割线系统，一行代码设置分割线，子视图增删/隐藏/显示时自动更新分隔线
```swift
let stackView = UIStackView()
    .axis(.vertical)
    .spacing(10)
    .alignment(.center)
    .distribution(.fillEqually)
    .padding(.top, 20)
    .padding(.left, 20)
    .padding(.horizontal, 16)
    .padding(16)
    .separator(color: .red, size: CGSize(width: 20, height: 2))
```

- 链式基础样式配置，告别碎片化的属性设置
- 扩展SwiftUI语法配置：(.border);(.radius);(.background)
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
    .background {
        UIImageView()// 嵌入式背景视图
            .imageName("icon")
            .contentMode(.scaleAspectFill)
    }
```

### 现代化交互封装：手势识别事件简化
支持UIKit所有手势类型：(.tap);(.doubleTap);(.longPress);(.pan);(.swipe);(.pinch);(.rotation)
```swift
//SwiftlyUI
let view = UIView()
  .onGesture(.tap) { _ in print("tapAction") }
  .onGesture(.tap, action: tapAction)

//UIKit
let view = UIView()
view.isUserInteractionEnabled = true
let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
view.addGestureRecognizer(tap)

@objc func tapAction() {
    print("tapAction")
}
```
### 声明式动画引擎：像 SwiftUI 一样驱动 UIKit
```swift
// SwiftlyUI
withAnimation(.easeInOut) {
    self.view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
} completion: { _ in print("animation completed") }

// UIKit
UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
    self.view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
} completion: { _ in
    print("animation completed")
}

```
### 智能布局系统 Auto Layout ：前置约束 + 自适应布局
- 添加父控件前约束，打破相对布局限制
```swift
let view = UIView()
    .frame(width: 20)//the same as .width()
    .frame(height: 100)//the same as .height()
    .frame(minWidth: 50)
    .frame(maxWidth: 200)
    .left(to: superView.leftAnchor, offset: 30)//添加父控件前
    .top(to: superView, offset: 30)//Before adding superView
    .fill(to: superView)
    .fill(to: brother, UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    .leading(to: superView)//Before adding superView
    .bottom(to: superView)//添加父控件前
    .width(20)//the same as .frame(width: 20)
    .width(to: view, multiplier: 1.2)
```

### UIControl & UIButton 多状态增强
- 高质量 Action 封装，告别 告别 Target-Action 的原始时代
```swift
let contorl = UIControl()
    .onAction { print("click") }
    .onAction(for: .touchUpInside, action: { print("click") })
```

```swift
let button = UIButton()
    .font(.bold(16))
    .title("title", state: .normal)
    .titleColor(.black, state: .normal)
    .foregroundColor(.black, state: .normal)
    .image(UIImage(named: "image"), state: .normal)
    .imageName("local_imageName", state: .selected)
    .backgroundColor(.red, state: .normal)
    .backgroundImage(UIImage.gradient(colors: [.red, .green], direction: .leftToRight, size: CGSize(width: 100, height: 100)))
    .backgroundImageName("local_imageName", state: .normal)
    .cornerRadius(20)
    .onAction{ print("action") }
```

### UITextView & UITextField：输入控件增强，比原生更易用的文本处理
- 一行代码实现 Placeholder
- Padding 精准设置内边距
- 控件事件简化监听文本变化
```swift
let textView = UITextView()//or
let textField = UITextField()
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
    .onTextChange{ print("onTextChange: \($0)") }
    .onTextChange{ print("onTextChange: \($0.text)") }
    .onBeginEditing(onBeginEditingAction)
    .onEndEditing(onEndEditingAction)
```


## 使用示例导航 🔍 | Examples <a name="使用示例导航"></a>
- [UIView Build](#UIView-Build)
- [UIStackView Build](#UIStackView-Build)
- [UITextView Build](#UITextView-Build)
- [UITextField Build](#UITextField-Build)
- [UILabel Build](#UILabel-Build)
- [UIControl Build](#UIControl-Build)
- [UIButton Build](#UIButton-Build)


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
//SnapKit Layout
let brother = UIView()
    .snp { make in // if Import SnapKit
        make.width.equalTo(100)
        make.height.equalTo(200)
        //make.left.equalTo(self.view);//cannot
    }

//添加父控件前布局 | Before adding superView
let view = UIView()
    .frame(width: 100, height: 200)
    .frame(width: 20)//the same as .width()
    .frame(height: 100)//the same as .height()
    .frame(minWidth: 50)
    .frame(maxWidth: 200)
    .left(to: superView.leftAnchor, offset: 30)//添加父控件前
    .top(to: superView, offset: 30)//Before adding superView
    .fill(to: superView)
    .fill(to: brother, UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    .leading(to: superView)//Before adding superView
    .bottom(to: superView)//添加父控件前
    .width(20)//the same as .frame(width: 20)
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







