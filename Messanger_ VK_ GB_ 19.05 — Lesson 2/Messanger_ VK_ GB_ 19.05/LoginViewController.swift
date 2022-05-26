//
//  LoginViewController.swift
//  Messanger_ VK_ GB_ 19.05
//
//  Created by Игорь Гриценко on 26.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    
    @objc func keyboardWasShown (notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsert = UIEdgeInsets (top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsert
        scrollView?.scrollIndicatorInsets = contentInsert
        
    }
    
    @objc func keyboardWillBeHidden (notification: Notification) {
        let contentInsert = UIEdgeInsets.zero
        scrollView?.contentInset
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // добавление жеста, который убирает клавиатуру при нажатие
    @objc func hideKeyboard () {
        self.scrollView?.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // жест нажатия
        let hidKeyboardGesture = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        // присваеваем его к scrollView
        scrollView?.addGestureRecognizer(hidKeyboardGesture)
    }

    // логика авторизации
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        if login == "igor" && password == "1" {
            print("все успешно")
        }else {
            print("логин или пароль введен не правильно")
        }
        
        
    }
    
}
