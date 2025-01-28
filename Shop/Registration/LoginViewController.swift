//
//  LoginViewController.swift
//  Shop
//
//  Created by Кирилл Сысоев on 28.01.2025.
//

import UIKit
import FirebaseFirestore

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        addToolBar(emailTextField)
        addToolBar(passwordTextField)
    }
    
    let db = Firestore.firestore()

    func addToolBar(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: true)
        
        textField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func signInButtonTapped() {
        db
            .collection("User")
            .document("\(emailTextField.text!)").setData([
                "email": "\(emailTextField.text!)",
                "password": "\(passwordTextField.text!)"
            ])
        
        let alert = UIAlertController(title: "Готово", message: "Вы успешно вошли в аккаунт", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ок", style: .cancel) { _ in
            firstVC.modalPresentationStyle = .fullScreen
            self.present(firstVC, animated: true)
        }
        
        alert.addAction(okButton)
        show(alert, sender: nil)
    }

}
