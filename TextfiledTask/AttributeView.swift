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
    
    @IBOutlet weak var labelView: LabelView!
    @IBOutlet  var textField: UITextField!
    
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
                
        separatorView = UIView.init(frame: CGRect(x: 20, y: view.frame.size.height - 30, width:  view.frame.size.width - 40, height: 1))
        separatorView?.backgroundColor = .lightGray

        self.addSubview(view)
        self.addSubview(separatorView!)
    }
    
    func setTitles(type: Titles) {
        labelView.setTitle(type: type)
    }
 
    func updateState(isTextFieldChosen: Bool) {
        separatorView?.backgroundColor = isTextFieldChosen ? .black : .lightGray
        labelView.updateState(isChosen: isTextFieldChosen)
        update()
    }
    
    func update() {
        UIView.animate(withDuration: 0.2) {
            self.labelView.layoutIfNeeded()
        }
    }

}
