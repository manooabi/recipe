//
//  LoginController.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit
import JWTDecode

public var userToken: String = ""
public var userId: Int = 0
class LoginController: UIViewController {

   let MainTabarViewCOntroller = MainTabBarViewController()
        
             private let usernameTextField: UITextField = {
                    let textField = UITextField()
                    textField.placeholder = "Username"
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
                    button.backgroundColor = .red
                    button.layer.cornerRadius = 5
                    return button
                }()
                
                private let signUpButton: UIButton = {
                    let button = UIButton()
                    button.setTitle("Sign Up", for: .normal)
                    button.setTitleColor(.white, for: .normal)
                    button.backgroundColor = .orange
                    button.layer.cornerRadius = 5
                    return button
                }()
                
                private let titleLabel: UILabel = {
                    let label = UILabel()
                    label.text = "Login"
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
                    self.view.addSubview(signUpButton)
                    
                    
                    titleLabel.translatesAutoresizingMaskIntoConstraints = false
                    usernameTextField.translatesAutoresizingMaskIntoConstraints = false
                    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
                    loginButton.translatesAutoresizingMaskIntoConstraints = false
                    signUpButton.translatesAutoresizingMaskIntoConstraints = false
                
            
                    NSLayoutConstraint.activate([
               
                        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
                        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                        titleLabel.heightAnchor.constraint(equalToConstant: 44),
            
                        usernameTextField.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200),
                        usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                        usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
                        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
                        passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                        passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
                        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
                        loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                        loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                        loginButton.heightAnchor.constraint(equalToConstant: 44),
                        
                        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
                        signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                        signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                        signUpButton.heightAnchor.constraint(equalToConstant: 44),
                    ])
                    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
                    signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
                }
                
                @objc func signupButtonTapped() {
                    let signUpViewController = SignupController()
                    UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromTop, animations: {
                          UIApplication.shared.windows.first?.rootViewController = signUpViewController
                      }, completion: nil)
//                    let jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKV1RTZXJ2aWNlQWNjZXNzVG9rZW4iLCJqdGkiOiI4YWFkMWZkOC0yYTdlLTRkNjUtYmJmZS1mMmY4ZmM3ZDlkZDMiLCJpYXQiOiIwMS8yNC8yMDIzIDA2OjE0OjI3IiwiVXNlcklkIjoiMSIsIlVzZXJOYW1lIjoiTWFub28iLCJFbWFpbCI6Im1hbm9vLmFiaGlsbGFzaEBnbWFpbC5jb20iLCJleHAiOjE2NzQ1NDE0NjcsImlzcyI6IkpXVEF1dGhlbnRpY2F0aW9uU2VydmVyIiwiYXVkIjoiSldUU2VydmljZVBvc3RtYW5DbGllbnQifQ.2KddXP7bj1jKkzCA4vsliri22-z0py662n3aHfwZDUw"
//                    let components = jwt.components(separatedBy: ".")
//                    guard components.count == 3 else { return }
//                    let payloadData = Data(base64Encoded: components[1], options: .ignoreUnknownCharacters)!
//                    do {
//                        let json = try JSONSerialization.jsonObject(with:payloadData, options: [])
//                        as! [String: Any]
//                        let userId = json["userId"] as? String
//                        print("User Id: \(userId)")
//
//                    } catch let error {
//                        print(error)
//
//                    }
                }
                
                @IBAction func loginButtonTapped(_ sender: Any){
                    let email = usernameTextField.text!
                    let password = passwordTextField.text!
                    
                    let params: [String: Any] = ["email": email, "password": password]
                    
                    let url = URL(string: "https://foodapi-75l5.onrender.com/api/Login")!
                    
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
                           // let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                            let loginResponse = try JSONDecoder().decode(Tokens.self, from: data)
                            userId = loginResponse.userId
                            userToken = loginResponse.token!
                            print(userId)
                            print(userToken)
                            
                            
                            UserDefaults.standard.set(userToken,forKey: "token")
                            if((userToken) != nil){
                                DispatchQueue.main.async {
                                    let mainTabBarViewController = MainTabBarViewController()
                                    UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromTop, animations: {
                                        UIApplication.shared.windows.first?.rootViewController = mainTabBarViewController
                                    }, completion: nil)
                                }
                            }
                        }catch let error{
                            print(error)
                        }
                    }.resume()
                }
                }



