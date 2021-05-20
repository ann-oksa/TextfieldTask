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
    
    @IBOutlet  var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var labelTopConstr: NSLayoutConstraint!
    
    weak var delegate: AttributeViewDelegate?
    private var separatorView: UIView?
    
    weak var textFieldDelegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = textFieldDelegate
        }
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
                
        separatorView = UIView.init(frame: CGRect(x: 20, y: view.frame.size.height - 30, width:  UIScreen.main.bounds.width - 40, height: 1))
        separatorView?.backgroundColor = .lightGray
        
        labelTopConstr.constant = 40

        self.addSubview(view)
        self.addSubview(separatorView!)
    }
    
    func setTitles(type: Titles) {
        titleLabel.text = type.title
        titleLabel.textColor = .lightGray
    }
 
    func updateState(isTextFieldChosen: Bool) {
        separatorView?.backgroundColor = isTextFieldChosen ? .black : .lightGray
        titleLabel.textColor = isTextFieldChosen ? .label : .lightGray
        titleLabel.font = isTextFieldChosen ? UIFont.systemFont(ofSize: 16) : UIFont.systemFont(ofSize: 13)
        labelTopConstr.constant = isTextFieldChosen ? 5 : 40
    }


}
enum Titles {
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
    
}
