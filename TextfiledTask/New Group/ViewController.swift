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
    
  //  var activeTextField: UITextField?
    
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


}

extension ViewController: AttributeViewDelegate, UITextFieldDelegate {
    func addValueDidTap(value: String) {
        print("l")
    }
}

