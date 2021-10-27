//
//  LoginViewController.swift
//  hw_3.1
//
//  Created by Anna Ivanova on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.textContentType = .username
        userNameTF.autocorrectionType = .no
        userNameTF.returnKeyType = .next
        
        passwordTF.textContentType = .password
        passwordTF.autocorrectionType = .no
        passwordTF.isSecureTextEntry = true
        passwordTF.returnKeyType = .done
        
    }
    
    //data transfer between screens
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userNameVC = segue.destination as? WelcomeViewController else { return }
        userNameVC.userName = userNameTF.text
    }
    
    //hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }
    
    //checking the correctness of the password and login
    @IBAction func loginButtonPressed() {
        let userName = "User"
        let password = "Password"
        guard let correctUserName = userNameTF.text,
              let correctPassword = passwordTF.text,
                !correctUserName.isEmpty && !correctPassword.isEmpty,
                correctUserName == userName && correctPassword == password
        else {
            showAlertCorrectData(title: "invalid login or password", message: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    @IBAction func forgotUserNameButtonPressed() {
        showAlertForgotUserName(title: "Oops!", message: "Your name is User")
    }
    @IBAction func forgotPasswordButtonPressed() {
        showAlertForgotPassword(title: "Oops!", message: "your password is Password")
    }
}

extension LoginViewController {
    private func showAlertCorrectData(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okActionCorrectData = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okActionCorrectData)
        present(alert, animated: true)
    }
    
    private func showAlertForgotUserName(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okActionForgotUserName = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTF.text = ""
        }
        alert.addAction(okActionForgotUserName)
        present(alert, animated: true)
    }
    
    private func showAlertForgotPassword(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okActionForgotPassword = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okActionForgotPassword)
        present(alert, animated: true)
    }
}
