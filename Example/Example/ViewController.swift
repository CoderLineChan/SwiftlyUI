//
//  ViewController.swift
//  Example
//
//  Created by CoderChan on 2025/3/18.
//

import UIKit
import SwiftlyUI


class ViewController: UIViewController {
    deinit {
        print("deinit")
    }
    /// 返回按钮
    lazy var backButton: UIButton = {
        let button: UIButton = UIButton.init(type: .custom)
            .imageName("navi_back_black", state: .normal)
            .frame(width: 44, height: 44)
//            .onAction(target: self, action: {$0.onBackButtonAction() })
            .onAction(target: self, action: { (vc: ViewController, btn: UIButton) in
                vc.onBackButtonAction()
                btn.alpha = 0.5
            })
            .backgroundColor(.orange)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("viewDidLoad")
        
    }

    func test3() {
        let view1 = UIView()
            .backgroundColor(.red)
            .frame(width: 100, height: 100)
            .centerX(to: view)
            .centerY(to: view)
        view.addSubview(view1)
        
        let view2 = UIView()
            .backgroundColor(.blue)
            
            
        view1.addSubview(view2)
        view2.leadingToSuper(offset: 10)
        view2.trailingToSuper(offset: 20)
        view2.topToSuper(offset: 0)
        view2.bottomToSuper(offset: 0)
//        view2.fillSuper(edge: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
    }
    
    func onBackButtonAction() {
        let vc = ViewController()
        vc.view.backgroundColor = .gray
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    func createButton4() {
        view.addSubview(backButton)
        backButton.centerToSuper()
        let image = UIImage.gradient(colors: [.brown, .clear], direction: .leftToRight, size: CGSize(width: 100, height: 40))
        let imageView = UIImageView()
            .centerX(to: view, offset: 0)
            .centerY(to: view, offset: 100)
            .frame(width: 100, height: 40)
            .cornerRadius(20)
        view.addSubview(imageView)
        
        let gra = CAGradientLayer.gradient(colors: [.brown, .clear], direction: .leftToRight)
        gra.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        imageView.layer.addSublayer(gra)
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
    func createButton() {
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
    
    
    func tedt2() {
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
            .center(to: view)
            .alignment(.center)
            .distribution(.fill)
        view.addSubview(stackView)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

