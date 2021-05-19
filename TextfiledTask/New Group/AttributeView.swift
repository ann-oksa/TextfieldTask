//
//  AttributeView.swift
//  TextfiledTask
//
//  Created by Anna Oksanichenko on 19.05.2021.
//

import UIKit

protocol AttributeViewDelegate: AnyObject {
    
}

class AttributeView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    weak var delegate: AttributeViewDelegate?
    
    weak var textFieldDelegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = textFieldDelegate
        }
    }
    
    var text: String? {
        return textField.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        
        let nib = UINib(nibName: "AttributeView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        
        self.addSubview(view)
    }
    
    func setTitles(type: Titles) {
        titleLabel.text = type.title
        textField.placeholder = type.placeholder
    }
    
    func setText(_ text: String?) {
        textField.text = text
    }
    
    @IBAction func textfieldClicked(_ sender: UIButton) {
        print("clicked")
    }
    


}

enum Titles: String {
    case login
    case password
    
    var title: String {
        switch self {
        case .login:
            return "Логин или email"
        case .password:
            return "Пароль"
        }
    }
    var placeholder: String {
        switch self {
        case .login:
            return "Логин или email"
        case .password:
            return "Пароль"
        }
    }
}
