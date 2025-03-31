//
//  ViewController.swift
//  Example
//
//  Created by CoderChan on 2025/3/18.
//

import UIKit
import SwiftlyUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")
        let textF = UITextField("123452123213123123231232131236")
            .backgroundColor(.red.opacity(0.2))
            .padding(.horizontal, 00)
            .frame(width: 200, height: 60)
            .maxLength(5)
            .centerToSuper()
            .onTextChange { text in
                print("text: \(text)")
            }
            .onBeginEditing { _ in
                print("begin")
            }
            .onEndEditing { _ in
                print("end")
            }
        
        view.addSubview(textF)
        
        
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

