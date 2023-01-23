//
//  LoginController.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    var loginview: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
    }
    func setupView(){
        
        let mainView = LoginView(frame: self.view.frame)
        self.loginview = mainView
        self.loginview.loginAction = loginPressed
        self.loginview.SignupAction = SignupPressed
        self.view.addSubview(loginview)
        loginview.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    }
    func loginPressed(){
        print("Login button pressed")
    }
    func SignupPressed(){
        let signUpController = SignupController()
        present(signUpController, animated: true, completion: nil)
        
    }


}
