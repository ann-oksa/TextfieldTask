//
//  LabelView.swift
//  TextfiledTask
//
//  Created by Anna Oksanichenko on 20.05.2021.
//

import UIKit

class LabelView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTopConstr: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }

    private func setup() {
        let nib = UINib(nibName: "LabelView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        
     //   titleTopConstr.constant = 60
       
        self.addSubview(view)
    }
    
    func setTitle(type: Titles) {
          titleLabel.text = type.title
          titleLabel.textColor = .lightGray
    }
    
    func updateState(isChosen: Bool) {
     //   titleTopConstr.constant = isChosen ? 20 : 60
        titleLabel.textColor = isChosen ? .black : .lightGray
        titleLabel.font = isChosen ? UIFont.systemFont(ofSize: 17) : UIFont.systemFont(ofSize: 14)
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

