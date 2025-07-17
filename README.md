# SwiftlyUI & UIKit Plus
**Infusing UIKit with SwiftUI Development Efficiency**  
Inject SwiftUI-like development efficiency into UIKit through chained syntax and modern API design. Develop with UIKit more concisely and efficiently while maintaining full control, achieving a "zero conversion cost" SwiftUI-like development experience.  

**为 UIKit 注入 SwiftUI 的开发效率**  
通过链式语法和现代化 API 设计，让 UIKit 开发更简洁高效，同时保持完整控制权，实现「零转换成本」的 SwiftUI 式开发体验。  


## Quick Navigation | 快速导航 
- [Installation Guide | 安装指南](#安装指南)
- [Why Choose SwiftlyUI? | 为什么选择](#技术优势全景图)
- [Features | 功能特性](#功能特性)
- [Usage Examples | 使用示例](#使用示例)

## Installation Guide | 安装指南 <a name="安装指南"></a>
[![CocoaPods](https://img.shields.io/cocoapods/v/SwiftlyUI)](https://cocoapods.org/pods/SwiftlyUI)
[![SPM](https://img.shields.io/badge/SPM-supported-green)](https://swift.org/package-manager/)
### CocoaPods
```ruby
pod 'SwiftlyUI'
# Use if pod fails | 如果pod失败使用此方式
pod 'SwiftlyUI', :git => 'https://github.com/CoderLineChan/SwiftlyUI.git', :tag => '*.*.*'
```

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/CoderLineChan/SwiftlyUI.git", 
             from: "*.*.*")
]
```
### Recommended Installation via SPM | 推荐使用SPM方式导入
Xcode -> File -> Add Package Dependencies... -> https://github.com/CoderLineChan/SwiftlyUI.git -> Add Package



## Why Choose SwiftlyUI? <a name="技术优势全景图"></a>
✅ **渐进式迁移** 无需重写现有代码，可逐步改造 UIKit 项目

✅ **Progressive Migration** Migrate existing code gradually without rewriting entire projects

✅ **Swift 原生支持** 专为 Swift 设计的链式语法，类型安全且 IDE 友好

✅ **Native Swift Support** Designed for Swift with chain syntax, type safety and IDE friendliness

✅ **完整 UIKit 能力** 保留底层控件操作能力，不引入额外抽象层

✅ **Full UIKit Capabilities** Retain full underlying control capabilities, no extra abstraction layer

✅ **企业级兼容** 支持 iOS 13+，完美适配存量项目

✅ **Enterprise Compatibility** Supports iOS 13+, perfectly adapts to existing projects

## Features | 功能特性 <a name="功能特性"></a>

### Enhanced Containers with @resultBuilder for UIView and UIStackView
- Perfect nested containers replicating SwiftUI | 多容器嵌套完美复刻SwiftUI
```swift
ZStackView == UIView
HStackView == UIStackView
VStackView == UIStackView
```
```swift
let zView = ZStackView {// == UIView
    UIView()
        .frame(width: 300, height: 200)
        .backgroundColor(.red.opacity(0.5))
        .fillSuperMargins()
    
    VStackView(spacing: 10) {
        HStackView(spacing: 10) {
            Label("ACC:")
                .font(.medium(14))
                .width(50)
            
            UITextField("input ACC")
                .height(35)
                .width(180)
            
        }
            .border(.orange)
            .cornerRadius(5)
        
        HStackView(spacing: 10) {
            Label("PWD:")
                .font(.medium(14))
                .width(50)
            
            UITextField("input PWD")
                .height(35)
                .width(180)
        }
            .border(.orange)
            .cornerRadius(5)
    }
    .distribution(.fillEqually)
    .centerToSuper()
}
    .backgroundColor(.blue.opacity(0.5))
    .padding(10)
    .center(to: view)

view.addSubview(zView)
```

### Chained Syntax: Property Setting Enhancement | 链式语法：属性设置增强
- 极简代码：比原生代码减少 60% 的冗余字符
- 内边距精准设置,支持单边/全局/横向/纵向
- 内置分割线系统，一行代码设置分割线，子视图增删/隐藏/显示时自动更新分隔线
```swift
let stackView = UIStackView()
    /// 系统方法
    .axis(.vertical)
    .spacing(10)
    .alignment(.center)
    .distribution(.fillEqually)
    /// 扩展方法
    //1、 设置任意边距
    .padding(.top, 20)
    .padding(.left, 20)
    .padding(.horizontal, 16)
    .padding(.vertical, 10)
    .padding(16)//设置上左下右边距都是16
    .padding(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    //2、设置分割线
    .separator(color: .red, size: CGSize(width: 20, height: 2))
```

- 链式基础样式配置，告别碎片化的属性设置
- 扩展SwiftUI语法配置：(.border);(.radius);(.background)
```swift
let view = UIView()
    /// 系统方法
    .hidden(false)
    .hidden()
    .tag(100)
    .userInteractionEnabled(false)
    .userInteractionEnabled()
    .shadow(color: .black, radius: 3, opacity: 0.3, offset: .zero)
    .backgroundColor(.clear)
    .cornerRadius(8)
    .alpha(0.5)
    /// 扩展方法
    .border(.orange)
    .border(.black, 2)//设置边框颜色与大小
    .radius(10)
    .radius(10, corners: .topLeft | .topRight)//设置圆角
    .opacity(0.5)//与alpha一致
    .background {//在底部添加视图
        UIImageView()// 嵌入式背景视图
            .imageName("icon")
            .contentMode(.scaleAspectFill)
            .fillSuper()
        //... 可以添加任何UIView
    }
    .overlay {//在主视图上面叠加视图
        UIView()//可以是分割线
            .backgroundColor(.lightGray)
            .height(0.5)
            .left.top.right.equalToSuper()
        //... 可以添加任意UIView
    }
```

### 现代化交互封装：手势识别事件简化
支持UIKit所有手势类型：(.tap);(.doubleTap);(.longPress);(.pan);(.swipe);(.pinch);(.rotation)
```swift
//SwiftlyUI
let view = UIView()
  .onGesture(.tap) { _ in print("tapAction") }

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
### Pre-Parent Constraints ｜ 智能布局系统 Auto Layout ：父视图前约束 + 自适应布局
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

superView.addSubview(view)
```

### UIControl & UIButton Multi-state Enhancement
- Action封装闭包，需要注意循环引用
```swift
let contorl = UIControl()
    .onAction { [weak self] in self?.doSomething() }
    .onAction(target: self, action: { $0.doSomething() })
    .onAction(for: .touchUpInside, action: { [weak self] in self?.doSomething() })
    .onAction(target: self, action: { (vc: ViewController, btn: UIButton) in
        vc.doSomething()
        btn.alpha = 0.5
    })
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
    .onAction(target: self, action: {$0.doSomething() })
```

### UITextView & UITextField：Enhanced Input Controls
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

### Usage Examples ｜ 使用示例 <a name="使用示例"></a>
<p align="center">
<img src="https://github.com/CoderLineChan/SwiftlyUI/blob/main/Example/SampleGraphs/SampleGraph_1.png" width="1000px"/>
</p>
<p align="center">
<img src="https://github.com/CoderLineChan/SwiftlyUI/blob/main/Example/SampleGraphs/SampleGraph_2.png" width="1000px"/>
</p>
<p align="center">
<img src="https://github.com/CoderLineChan/SwiftlyUI/blob/main/Example/SampleGraphs/SampleGraph_3.png" width="1000px"/>
</p>
<p align="center">
<img src="https://github.com/CoderLineChan/SwiftlyUI/blob/main/Example/SampleGraphs/SampleGraph_4.png" width="1000px"/>
</p>
<p align="center">
<img src="https://github.com/CoderLineChan/SwiftlyUI/blob/main/Example/SampleGraphs/SampleGraph_5.png" width="1000px"/>
</p>










