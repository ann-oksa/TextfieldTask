//
//  NewViewController.swift
//  TextfiledTask
//
//  Created by Anna Oksanichenko on 19.05.2021.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextfield: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var activeTF: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setTitles(logType: .login, passType: .password)
//        loginTextfield.delegate = self
//        passwordTextfield.delegate = self
        
    }
    
//    func setTitles(logType: Titles, passType: Titles) {
//        loginLabel.text = logType.rawValue
//        loginTextfield.placeholder = logType.rawValue
//        passwordLabel.text = passType.rawValue
//        passwordTextfield.placeholder = passType.rawValue
//        
//    }


}

extension NewViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTF = textField
        activeTF?.placeholder = ""
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.placeholder = activeTF?.placeholder
        activeTF = nil
    }
}

//enum Titles: String {
//    case login = "Логин или email"
//    case password = "Пароль"
//}
