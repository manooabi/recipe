//
//  LoginView.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit

class LoginView: UIView{
    
    var loginAction: (() -> Void)?
    var SignupAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup() {
        let stackView = createStackView(views:[emailTextField,passwordTextField,loginButton,SignUpButton])
        addSubview(backgroundImageView)
        addSubview(stackView)
        backgroundImageView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        stackView.setAnchor(width: self.frame.width - 60, height: 210)
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Recipe")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField(placeHolder: "Email")
        return tf
    }()
    let passwordTextField: UITextField = {
          let tf = UITextField(placeHolder: "Password")
        tf.isSecureTextEntry = true;
          return tf
      }()
    
    let loginButton: UIButton = {
        let button = UIButton(title: "Login", borderColor: UIColor.greenBorderColor)
         button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    let SignUpButton: UIButton = {
        let button = UIButton(title: "Sign up", borderColor: UIColor.redBorderColour)
        button.addTarget(self, action: #selector(handleSingup), for: .touchUpInside)
           return button
       }()
    
    @objc func handleLogin(){
        loginAction?()
    }
    @objc func handleSingup(){
          SignupAction?()
      }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
