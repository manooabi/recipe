//
//  SignupController.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit

class SignupController: UIViewController{
    
   private let nameTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Name"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           return textField
       }()
       
       private let usernameTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Email"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           return textField
       }()

       private let passwordTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Password"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           textField.isSecureTextEntry = true
           return textField
       }()
       private let passwordConfirmTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Confirm Password"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           textField.isSecureTextEntry = true
           return textField
       }()

       private let signUpButton: UIButton = {
           let button = UIButton()
           button.setTitle("Register", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = .orange
           button.layer.cornerRadius = 5
           return button
       }()
       
       private let loginButton: UIButton = {
           let button = UIButton()
           button.setTitle("Log In", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = .red
           button.layer.cornerRadius = 5
           return button
       }()
       
       private let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Sign Up"
           label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
           label.textColor = .systemGray
           return label
       }()
       
       

       override func viewDidLoad() {
           super.viewDidLoad()
           self.view.backgroundColor = .systemBackground
       
           self.view.addSubview(titleLabel)
           self.view.addSubview(usernameTextField)
           self.view.addSubview(nameTextField)
           self.view.addSubview(passwordTextField)
           self.view.addSubview(passwordConfirmTextField)
           self.view.addSubview(signUpButton)
           self.view.addSubview(loginButton)
           
      
           
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           usernameTextField.translatesAutoresizingMaskIntoConstraints = false
           passwordTextField.translatesAutoresizingMaskIntoConstraints = false
           passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
           signUpButton.translatesAutoresizingMaskIntoConstraints = false
           loginButton.translatesAutoresizingMaskIntoConstraints = false
           nameTextField.translatesAutoresizingMaskIntoConstraints = false
       

           NSLayoutConstraint.activate([
      
               titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
               titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               titleLabel.heightAnchor.constraint(equalToConstant: 44),

               
               nameTextField.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200),
               nameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               nameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               
               usernameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
               usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

               passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
               passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

               passwordConfirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
               passwordConfirmTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               passwordConfirmTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
           
               signUpButton.topAnchor.constraint(equalTo: passwordConfirmTextField.bottomAnchor, constant: 10),
               signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               signUpButton.heightAnchor.constraint(equalToConstant: 44),
               
               loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10),
               loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               loginButton.heightAnchor.constraint(equalToConstant: 44),
           ])
           signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
           loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
       }
       
       @objc func signupButtonTapped() {
          let name = nameTextField.text!
           let email = usernameTextField.text!
         
           let password = passwordTextField.text!
           let confirm_password = passwordConfirmTextField.text!
        
        
        
           let params: [String: Any] = [ "userName": name, "email": email, "password": password, "password_confirmation": confirm_password]
       
           let url = URL(string: "https://foodapi-75l5.onrender.com/api/Users")!
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           
           request.httpBody = try? JSONSerialization.data(withJSONObject: params)
           
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
           let session = URLSession.shared
           
           session.dataTask(with: request){data, response, error in
               if let error = error {
                   print(error)
                   return
               }
               guard let data = data else {
                   print("No data")
                   return
               }
               do{
                   //let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                  // let token = json?["token"] as? String
                  // UserDefaults.standard.set(token,forKey: "token")
                  // if((token) != nil){
                let json = try JSONSerialization.jsonObject(with: data, options: [])as? [String: Any]
                    
                       DispatchQueue.main.async {
                           let LoginVController = LoginController()
                        UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromTop, animations: {
                               UIApplication.shared.windows.first?.rootViewController = LoginVController
                           }, completion: nil)
                       }
                   
               }catch let error{
                   print(error)
               }
           }.resume()
       }
       
       @objc func loginButtonTapped() {
           let loginViewController = LoginController()
           UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                 UIApplication.shared.windows.first?.rootViewController = loginViewController
             }, completion: nil)
       }
   }

