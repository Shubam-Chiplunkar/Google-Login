//
//  ViewController.swift
//  Google Login
//
//  Created by mayank ranka on 03/05/23.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate{
    
    var logoImageView       : UIImageView!
    var emailLabel          : UILabel!
    var emailTextField      : UITextField!
    var passwordLabel       : UILabel!
    var passwordTextField   : UITextField!
    var facebookButton      : UIButton!
    var otherSignUp         : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPage()
        googleLoad()
    }
    
    
    @objc func googleButtonClick(){
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    func googleLoad(){
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    //MARK: GIDSignInDelegate delegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        print("\(user.profile.email ?? "No email")")
        emailTextField.isHidden = true
        passwordTextField.isHidden = true
        emailLabel.textAlignment = .center
        emailLabel.text = "Hello..! \(user.profile.name!)"
        passwordLabel.text = user.profile.email
        passwordLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)
        ])
    
        let googleImage = user.profile.imageURL(withDimension: .min)!
        let data = try? Data(contentsOf: googleImage)
        if let imageData = data{
            logoImageView.image = UIImage(data: imageData)
        }
        
    }
        
    func loadPage(){
        logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "profile")
        logoImageView.layer.cornerRadius = 50
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "Arial", size: 15)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        //        emailTextField.textAlignment = .center
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Arial", size: 15)
        view.addSubview(passwordLabel)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        //       passwordTextField.textAlignment = .center
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        otherSignUp = UILabel()
        otherSignUp.translatesAutoresizingMaskIntoConstraints = false
        otherSignUp.text = "-------Other Sign Up--------"
        otherSignUp.textAlignment = .center
        otherSignUp.textColor = .gray
        otherSignUp.font = UIFont(name: "Arial", size: 12)
        view.addSubview(otherSignUp)
        
        NSLayoutConstraint.activate([
            otherSignUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            otherSignUp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            otherSignUp.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
        ])
        
        facebookButton = UIButton()
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setTitle("Google", for: .normal)
        //            facebookButton.setImage(UIImage(named: "google"), for: .normal)
        facebookButton.imageView?.contentMode = .scaleToFill
        facebookButton.setTitleColor(UIColor.black, for: .normal)
        facebookButton.semanticContentAttribute = .forceLeftToRight
        facebookButton.backgroundColor = .init(red: 235/255, green: 242/255, blue: 240/255, alpha: 1)
        facebookButton.layer.cornerRadius = 10
        facebookButton.addTarget(self, action: #selector(googleButtonClick), for: .touchUpInside)
        view.addSubview(facebookButton)
        
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: otherSignUp.bottomAnchor, constant: 30),
            facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            facebookButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    
    
}






