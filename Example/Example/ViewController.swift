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
//            .onTextChange { text in
//                print("text: \(text)")
//            }
//            .onBeginEditing { _ in
//                print("begin")
//            }
//            .onEndEditing { _ in
//                print("end")
//            }
        
        view.addSubview(textF)
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

