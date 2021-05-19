//
//  ViewController.swift
//  TextfiledTask
//
//  Created by Anna Oksanichenko on 19.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginView: AttributeView!
    @IBOutlet weak var passwordView: AttributeView!
    
    var activeTextField: UITextField?
    var mytext = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setup()
        
    }
    
    func setup() {
        loginView.setTitles(type: .login)
        passwordView.setTitles(type: .password)
        loginView.delegate = self
        passwordView.delegate = self
        loginView.textFieldDelegate = self
        passwordView.textFieldDelegate = self
    }
    
    func setTitleForTF(text: String, tf: UITextField) {
        if tf == loginView.textField {
            loginView.titleLabel.text = text
            loginView.separatorView?.backgroundColor = .black
        } else {
            passwordView.titleLabel.text = text
            passwordView.separatorView?.backgroundColor = .black
        }
    }
    
   func removeTitleFromTF(tf: UITextField) {
        if tf == loginView.textField {
            loginView.titleLabel.text = ""
            loginView.separatorView?.backgroundColor = .lightGray

        } else {
            passwordView.titleLabel.text = ""
            passwordView.separatorView?.backgroundColor = .lightGray

        }
    }



}

extension ViewController: AttributeViewDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        mytext = textField.placeholder!
        textField.placeholder = ""
        setTitleForTF(text: mytext, tf: activeTextField!)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.placeholder = mytext
        mytext = ""
        removeTitleFromTF(tf: activeTextField!)
        
        
    }
    
    
}

