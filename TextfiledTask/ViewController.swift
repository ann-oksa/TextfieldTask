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
    
    func setTitleForTF(tf: UITextField) {
        if tf == loginView.textField {
            loginView.updateState(isTextFieldChosen: true)
            update()
        } else {
            passwordView.updateState(isTextFieldChosen: true)
            update()
        }
    }
    
   func removeTitleFromTF(tf: UITextField) {
        if tf == loginView.textField {
            loginView.updateState(isTextFieldChosen: false)
            update()
        } else {
            passwordView.updateState(isTextFieldChosen: false)
            update()
        }
    }
    
    func update() {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}

extension ViewController: AttributeViewDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        guard let tf = activeTextField else { return }
        setTitleForTF(tf: tf)

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let tf = activeTextField else { return }
        removeTitleFromTF(tf: tf)
        print(textField.text)
        textField.text = ""
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard let text = loginView.textField.text else { return false }
//            let newString = (text as NSString).replacingCharacters(in: range, with: string)
//            textField.text = format(with: "+XX (XXX) XXX-XX-XX", phone: newString)
//            return false
//    }
//
//    func format(with mask: String, phone: String) -> String {
//        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
//        var result = ""
//        var index = numbers.startIndex
//
//        for ch in mask where index < numbers.endIndex {
//            if ch == "X" {
//                result.append(numbers[index])
//                index = numbers.index(after: index)
//
//            } else {
//                result.append(ch)
//            }
//        }
//        return result
//    }
    
}

    
    


extension NSLayoutConstraint {

    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" 
    }
}
