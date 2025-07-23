//
//  ViewController.swift
//  Example
//
//  Created by CoderChan on 2025/3/18.
//


import SwiftlyUI

//struct ViewPreview: PreviewProvider {
//    static var previews: some View {
//        UIViewPreview {
//            ViewController().view
//        }.edgesIgnoringSafeArea(.all)
//            .previewDevice("iPhone 16 Pro")
//    }
//}

import SwiftUI
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            UINavigationController(rootViewController: ViewController())
        }.edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 16 Pro")
    }
}

class ViewController: UIViewController {
    deinit { print("deinit") }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("viewDidLoad")
        test2()
    }
    
    func test11() {
        let view1 = UIView()
            .frame(width: 300, height: 400)
            .backgroundColor(.orange.opacity(0.1))
            .centerToSuper()
            .onGesture(.tap) {
                print("view1 tapped")
            }
//            .onGesture(.doubleTap) {
//                print("view1 double tapped")
//            }
            .onGesture(.longPress(minimumDuration: 0.5)) { ges in
                print("view1 long pressed: \(ges.state)")
            }
//            .onGesture(.pan) { ges in
//                print("view1 panned: \(ges.state)")
//            }
            .onGesture(.swipe(direction: .down)) { ges in
                print("view1 swiped down: \(ges.state)")
            }
            .onGesture(.rotation) { ges in
                print("view1 rotated: \(ges.state)")
            }
            .onGesture(.pinch) { ges in
                print("view1 pinched: \(ges.state)")
            }
        
        view.addSubview(view1)
        
        let view2 = HStackView {
            UILabel("Title")
            UIButton("Button")
                .frame(width: 40, height: 40)
                .titleColor(.random)
                .onAction {
                    print("Button tapped")
                    
                    let ges = view1.getGesture(for: .tap)
                    print("Gesture: \(ges)")
                }
            
        }
            .centerToSuper()
        
        view1.addSubview(view2)
    }
    
    func test10() {
        let textView = UITextView("记录这一刻，晒给懂你的人～")
            .backgroundColor(.lightGray.opacity(0.1))
            .leftToSuper(offset: 50)
            .rightToSuper(offset: 50)
            .topToSuper(offset: 100)
            .maxLength(40)
            .height(200)
            .onTextChange { [weak self] text in
                self?.textCountLabel.text = "\(text.count)/200"
            }
        
        view.addSubview(textView)
        textCountLabel
            .right(to: textView)
            .top(to: textView.bottomAnchor)
        view.addSubview(textCountLabel)
        
        
        let btn = UIButton()
            .backgroundColor(.orange)
            .frame(width: 100, height: 40)
            .centerToSuper()
            .onAction {
                textView.attributedText = NSAttributedString(string: "这是一")
            }
        
        view.addSubview(btn)
        
    }
    lazy var textCountLabel: UILabel = {
        UILabel()
            .textColor(.lightGray)
            .font(.regular(12))
            .text("0/200")
            
    }()
    func test9() {
        let view1 = UIView()
            .backgroundColor(.red)
            .frame(width: 300, height: 300)
            .centerX(to: view)
            .centerY(to: view, offset: -60)
            
        view.addSubview(view1)
        
        let view2 = UIView()
            .backgroundColor(.blue)
            .edges.equal(to: view1,offset: 20)
        
        view1.addSubview(view2)
        
        let view3 = UIView()
            .backgroundColor(.green)
            .leading.top.trailing.equalToSuper(offset: 40)
            .bottomToSuper(offset: 60)
        
        view2.addSubview(view3)
    }
    
    
    
    
    
    
    func test8() {
        let tableView = UITableView()
        let refresh = UIRefreshControl()
            .tintColor(.red)
        tableView.refreshControl = refresh
        
    }
//    @available(iOS 14.0, *)
    func test7() {
        let swt = UISwitch()
            .center(to: view)
            .scaleEffect(0.5)
            .onTintColor(.orange)
            .thumbTintColor(.red)
            .onAction { (swt: UISwitch) in
                print("switch is \(swt.isOn)")
            }
        
        view.addSubview(swt)
        print("swt.frame:\(swt.frame)")
    }
    func test6() {
        let array = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        let scrollView = VScrollView {
            VStackView {
                ForEach(array) { i in
                    self.createCell("cell ForEach: \(i)")
                }
                createCell("cell1")
                createCell("cell2")
            }
            .spacing(10)
            .fillSuper()
            .width(200)
        }
            .height(200)
            .width(200)
            .centerToSuper()
            .backgroundColor(.yellow)
        
        view.addSubview(scrollView)
    }
    
    func createCell(_ string: String) -> UIView {
        let cell = UIView()
            .backgroundColor(.random())
            .frame(width: 190, height: 50)
        
        let label = Label(string)
            .centerToSuper()
        cell.addSubview(label)
        return cell
            
    }
    
    
    
    
    /// 返回按钮
    lazy var backButton: UIButton = {
        let button: UIButton = UIButton.init(type: .custom)
            .imageName("navi_back_black", state: .normal)
        //            .frame(width: 44, height: 44)
            .frame(size: CGSize(width: 44, height: 44))
            .scaleEffect(0.3, anchor: .center)
            .onAction(target: self, action: { (vc: ViewController, btn: UIButton) in
                vc.onBackButtonAction()
                btn.alpha = 0.5
            })
            .backgroundColor(.orange)
        return button
    }()
    func animation() {
        
        SwiftlyUI.withAnimation {
            self.backButton.scaleEffect(0.8, anchor: .bottomLeading)
        }
        print("animation")
    }
    
    func test5() {
        let view1 = UIView()
            .backgroundColor(.red)
            .frame(width: 100, height: 100)
            .centerX(to: view)
            .centerY(to: view, offset: 300)
            .roundCorners(10, corners: [.topLeft, .bottomRight])
        view.addSubview(view1)
        let view2 = UIView()
            .backgroundColor(.blue)
            
            
//        view1.addSubview(view2)
//        view2.leadingToSuper(offset: 10)
//        view2.trailingToSuper(offset: 20)
//        view2.topToSuper(offset: 0)
//        view2.bottomToSuper(offset: 0)
        
        
//        view2.fillSuper(edge: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
    }
    
    func onBackButtonAction() {
        let vc = ViewController()
        vc.view.backgroundColor = .gray
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    func test4() {
        view.addSubview(backButton)
        let bg = UIView()
            .backgroundColor(.orange.opacity(0.5))
            .frame(size: CGSize(width: 44, height: 44))
            .center(to: backButton)
        view.insertSubview(bg, at: 0)
        
//        let image = UIImage.gradient(colors: [.brown, .clear], direction: .leftToRight, size: CGSize(width: 100, height: 40))
//        let imageView = UIImageView()
//            .centerX(to: view, offset: 0)
//            .centerY(to: view, offset: 100)
//            .frame(width: 100, height: 40)
//            .cornerRadius(20)
//        view.addSubview(imageView)
//        
//        let gra = CAGradientLayer.gradient(colors: [.brown, .clear], direction: .leftToRight)
//        gra.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
//        imageView.layer.addSublayer(gra)
        
        
        let ani = UIButton("animation")
            .onAction(target: self, action: { $0.animation() })
            .centerXToSuper()
            .centerYToSuper(offset: -190)
            .frame(width: 100, height: 40)
            .userInteractionEnabled(false)
            .backgroundColor(.yellow)
            .onGesture(.longPress(minimumDuration: 1), action: {[weak self] in self?.animation() })
//            .onGesture(.longPress(minimumDuration: 1), target: self) { vc, gest in
//                print("gestgest:\(gest)")
//            }
        
        view.addSubview(ani)
        backButton.centerXToSuper()
        backButton.bottom(to: ani.topAnchor, offset: 30)
        backButton.activeConstraints()
    }
    @available(iOS 15.0, *)
    func createButton3() {
        let button = UIButton {
            .filled()
            .title("button")
            .background {
                .clear()
                .customView {
                    UIView().backgroundColor(.red).cornerRadius(20)
                }
                .image(UIColor.black.image(withSize: CGSize(width: 100, height: 40)))
            }
        }
            .frame(width: 100, height: 50)
            .center(to: view)
        
        view.addSubview(button)
    }
    
    //ios14
    @available(iOS 15.0, *)
    func createButton2() {
        let ac = UIAction(title: "buttonac", subtitle: "sub") { ac in
            print("buttonac")
        }
        let config = UIButton.Configuration.filled()
            .title("button")
            .subtitle("subtitle")
            .baseBackgroundColor(.orange)
//            .title("button")
            .image(UIColor.black.image(withSize: CGSize(width: 12, height: 12)))
//            .imagePlacement(.trailing)
//            .imagePadding(5)
            .titlePadding(5)
            
        let config2 = config
            .title("button2")
            .subtitle("subtitle2")
        
        let config3 = config
            .title("button3")
            .subtitle("subtitle3")
        
        let config4 = config
            .title("button4")
            .subtitle("subtitle4")
            
        
        let button = UIButton(configuration: config, primaryAction: ac)
//            .configuration(config2, state: .highlighted)
//            .configuration(config4, state: .selected)
            .frame(width: 100, height: 50)
            .center(to: view)
            .onAction { (btn) in
                print("buttonAction")
//                btn.isSelected.toggle()
            }
            .configurationUpdateHandler({ button in
                print("button.state:\(button.state)")
                if button.state == .highlighted {
                    button.configuration = config3
                }
            })
        
        view.addSubview(button)
        
        
        
    }
    
    // MARK: - UIButton
    func test3() {
        //UIKit
        let button1 = UIButton()
        button1.titleLabel?.font = .medium(15)
        button1.setTitleColor(.black, for: .normal)
        button1.setTitle("button1", for: .normal)
        button1.backgroundColor = .red
        button1.setImage(UIColor.black.image(withSize: CGSize(width: 12, height: 12)), for: .normal)
        button1.size = CGSize(width: 120, height: 30)
        button1.resetImagePosition(.right, withTitleSpacing: 5)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button1)
        button1.center = view.center
        
        //SwiftlyUI
        let button2 = UIButton()
            .title("button2")
            .titleColor(.black)
            .font(.medium(15))
            .backgroundColor(.red)
            .image(UIColor.black.image(withSize: CGSize(width: 12, height: 12)))
            .resetImagePosition(.right, withTitleSpacing: 5)
            .frame(width: 120, height: 30)
            .centerXToSuper()
            .centerYToSuper(offset: 50)
            .onAction(action: buttonAction)
        
        view.addSubview(button2)
        
        //SwiftlyUI SwiftUI style 1
        let button3 = UIButton {
            HStackView(spacing: 5) {
                UILabel("button3")
                    .font(.medium(15))
                    .foregroundColor(.black)
                
                UIImageView("")
                    .frame(width: 12, height: 12)
                    .backgroundColor(.black)
            }
            .fillSuperMargins() //has Margins
        } action: { //or btn in
            print("buttonAction")
        }
            .backgroundColor(.red)
            .centerXToSuper()
            .centerYToSuper(offset: 100)
                    
        view.addSubview(button3)
        
        //SwiftlyUI SwiftUI style 2
        let button4 = UIButton(buttonAction) {
            VStackView(spacing: 5) {
                UILabel("button4")
                    .font(.medium(15))
                    .foregroundColor(.black)
                
                UIImageView("")
                    .frame(width: 12, height: 12)
                    .backgroundColor(.black)
            }
            .fillSuper() //no Margins
        }
            .backgroundColor(.red)
            .centerXToSuper()
            .centerYToSuper(offset: 160)
                    
        view.addSubview(button4)
    }
    @objc func buttonAction() {
        print("buttonAction")
    }
    
    
    func test2() {
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
                        .maxLength(5)
                    
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
                        .maxLength(5)
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
    }
    
    func test1() {
        let stackView = HStackView {
            ImageView("avatar")
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            VStackView(spacing: 5) {
                UILabel("UserName")
                    .font(.medium(15))
                    .foregroundColor(.hexColor("333333"))
                
                ImageView("htmlTag")
                    .contentMode(.scaleAspectFit)
                
                UILabel("Description long long long text")
                    .font(.regular(13))
                    .foregroundColor(.hexColor("666666").opacity(0.9))
            }
            .alignment(.leading)
            .padding(.left, 12)
            UIView()
            VStackView(spacing: 10) {
                UIView()
                    .frame(height: 20)
                
                UILabel("2025-03-18")
                    .font(.medium(11))
                    .foregroundColor(.hexColor("333333").opacity(0.6))
            }
        }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .backgroundColor(.darkGray.opacity(0.3))
            .centerXToSuper()
            .centerYToSuper(offset: -300)
            .alignment(.center)
            .distribution(.fill)
        view.addSubview(stackView)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

