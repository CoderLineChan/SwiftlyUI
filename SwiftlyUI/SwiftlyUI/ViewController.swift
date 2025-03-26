//
//  ViewController.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
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
            .background(.darkGray.opacity(0.3))
            .center(to: view)
            .alignment(.center)
            .distribution(.fill)
        view.addSubview(stackView)
    }
    
}

