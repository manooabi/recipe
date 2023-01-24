//
//  LoginController.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit
import JWTDecode

class LoginController: UIViewController {

   
        
            
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
    

  
            
            private let loginButton: UIButton = {
                let button = UIButton()
                button.setTitle("Log In", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .systemGray
                button.layer.cornerRadius = 5
                return button
            }()
            
            private let titleLabel: UILabel = {
                let label = UILabel()
                label.text = "Recipe Master"
                label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
                label.textColor = .systemGray
                return label
            }()
            
            

            override func viewDidLoad() {
                super.viewDidLoad()
                self.view.backgroundColor = .systemBackground
            
                self.view.addSubview(titleLabel)
                self.view.addSubview(usernameTextField)
              
                self.view.addSubview(passwordTextField)
               
               
                self.view.addSubview(loginButton)
                
                
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                usernameTextField.translatesAutoresizingMaskIntoConstraints = false
                passwordTextField.translatesAutoresizingMaskIntoConstraints = false
               
              
                loginButton.translatesAutoresizingMaskIntoConstraints = false
               
            

                NSLayoutConstraint.activate([
           
                    titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                    titleLabel.heightAnchor.constraint(equalToConstant: 44),

                    
              
                    
                    usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                    usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                    usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

                    passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
                    passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                    passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

    
                
            
                    
                    loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
                    loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                    loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                    loginButton.heightAnchor.constraint(equalToConstant: 44),
                ])
           
                loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            }
            
            @objc func loginButtonTapped() {
                let email = usernameTextField.text!
                let password = passwordTextField.text!
                
//
//                let params: [String: Any] = ["email": email, "password": password]
//
//                let url = URL(string: "https://foodapi-75l5.onrender.com/api/Login")!
//
//                var request = URLRequest(url: url)
//                request.httpMethod = "POST"
//
//                request.httpBody = try? JSONSerialization.data(withJSONObject: params)
//
//                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                request.setValue("application/json", forHTTPHeaderField: "text/plain ; charset=UTF-8")
//                request.setValue("application/json", forHTTPHeaderField: "Accept")
//
//                let session = URLSession.shared
//
//                session.dataTask(with: request){data, response, error in
//                    if let error = error {
//                        print(error)
//                        return
//                    }
//                    guard let data = data else {
//                        print("No data")
//                        return
//                    }
//                    do{
//                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
//                        let token = json?["token"] as? String
//                        print(data)
//                        UserDefaults.standard.set(token,forKey: "token")
//                        if((token) != nil){
//                            DispatchQueue.main.async {
//
//                                let mainTabBarViewController = MainTabBarViewController()
//                                UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
//                                    UIApplication.shared.windows.first?.rootViewController = mainTabBarViewController
//                                }, completion: nil)
//                            }
//                        }
//                    }catch let error{
//                        print(error)
//                    }
//                }.resume()
//            }
//
         let login = Login(email: email, password: password)
         let jsonData = try! JSONEncoder().encode(login)

         let url = URL(string: "https://foodapi-75l5.onrender.com/api/Login")!
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         request.httpBody = jsonData
                
         let task = URLSession.shared.dataTask(with: request) { data, response, error in
             if let error = error {
                 print(error)
                 return
             }
             guard let data = data else {
                 print("No data in response")
                 return
             }
            print(data)
             do {
               // let loginResponse = try decode(LoginResponse.self, from: data)
                //let jwt = try decode(jwt: LoginResponse.self)
//                 let jwtToken = loginResponse.jwt
//                 print("JWT Token: \(jwtToken)")
//                print(loginResponse)
                //print(LoginResponse)

             } catch let jsonError {
                 print(jsonError)
             }
         }
         task.resume()
}
}

struct Login:Encodable {
    let email: String
    let password:String
}
struct LoginResponse: Decodable {
    let jwt: String
}

