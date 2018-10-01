//
//
//  Created by Michael Prummer on 08/09/16.
//

import UIKit


class MUITextField: UITextField {
    var type: mui.fonts.kMUIFont = .regular
    let insets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8);
    
    override var placeholder: String! {
        didSet {
            if placeholder != nil {
                //attributedPlaceholder = TPTools.attributedString(placeholder!, type:type, color: .taBrownishGrey)
                layoutIfNeeded()
            }
        }
    }

    init(){
        super.init(frame: .zero)
    }
    
//    init(_ fontType: mui.fonts.kMUIFont, color: UIColor = .white) {
//        type = fontType
//        super.init(frame: .zero)
//        translatesAutoresizingMaskIntoConstraints = false
//        isUserInteractionEnabled = true
//        //typingAttributes = NSDictionary.attributeDictionaryForStringType(fontType, color: color, lineBreakMode: .byWordWrapping)
//        font = fontType
//        textColor = color
//        backgroundColor = .clear
//        
//        placeholder = ""
//    }
//    
//    
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
