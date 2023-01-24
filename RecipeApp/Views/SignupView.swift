//
//  SignupView.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit

class SignupView: UIView {
    
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Recipe")
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    let nameTextField: UITextField = {
        let tf = UITextField(placeHolder: "Username")
        return tf
    }()
    let emailTextField: UITextField = {
         let ef = UITextField(placeHolder: "Email")
         return ef
     }()
    let passwordTextField: UITextField = {
         let pf = UITextField(placeHolder: "Password")
        pf.isSecureTextEntry = true
         return pf
     }()
    let confirmPasswordTextField: UITextField = {
         let cpf = UITextField(placeHolder: "Confirm Password")
        cpf.isSecureTextEntry = true
         return cpf
     }()
    let submitButton: UIButton = {
        let button = UIButton(title: "Submit", borderColor: .greenBorderColor)
        button.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return button
    }()
    let cancelButton: UIButton = {
           let button = UIButton(title: "Cancel", borderColor: .redBorderColour)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
           return button
       }()
  
    var submitAction:(() -> Void)?
    var cancelAction:(() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews(){
        let stackView = createStackView(views: [nameTextField,emailTextField,passwordTextField,confirmPasswordTextField,submitButton,cancelButton])
        
        self.addSubview(backgroundImageView)
        addSubview(stackView)
        backgroundImageView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        stackView.setAnchor(width: self.frame.width - 60, height: 310)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    @objc func handleSubmit(){
        submitAction?()
    }
    @objc func handleCancel(){
        cancelAction?()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
