//
//  Created by Michael Prummer on 01/09/2016.
//

enum VerticalAlignment {
    case none
    case top
    case middle
    case bottom
}

class MUILabel: UILabel {
    var insets: UIEdgeInsets = .zero
    private(set) var fontSize: CGFloat = mui.shared.settings.font.size.regular
    private(set) var type: mui.fonts.kMUIFont
    private(set) var color: UIColor!
    private var useLines: Bool
    private var title: String!
    private var placeholderLabel: UILabel!
    private var placeholderLeftConstraint: NSLayoutConstraint!
    private var placeholderRightConstraint: NSLayoutConstraint!
    
    var placeholder: String! {
        didSet {
            checkPlaceholderLabel()
            placeholderLabel.isHidden = !mui.tools.isNilOrEmtpy(text)
            placeholderLabel.attributedText = mui.attributedString(placeholder, type: .regular, color: .mBrownishGrey)
        }
    }
    	
    
    override internal var text: String! {
        didSet {
            if text != nil && !text.isEmpty {
                title = text
                attributedText = mui.attributedString(text!, type: type, color: color)
                
                if placeholderLabel != nil {
                    placeholderLabel.isHidden = true
                }
                
            } else if placeholder != nil && placeholder.isEmpty == false {
                checkPlaceholderLabel()
                
                if text == nil || text.isEmpty {
                    placeholderLabel.isHidden = false
                } else {
                    placeholderLabel.isHidden = true
                }
                
            }
        }
    }
    
    
    init(_ fontType:  mui.fonts.kMUIFont, size: CGFloat = mui.shared.settings.font.size.regular, color: UIColor?=nil, useLines:Bool = false, hAlign: NSTextAlignment = .left, vAlign: VerticalAlignment = .none) {
        self.type = fontType
        self.useLines = useLines
        super.init(frame: .zero)
        self.fontSize = size
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        textColor = color == nil ? .white : color
        self.color = color == nil ? .white : color
        backgroundColor = .clear
        numberOfLines = useLines ? 0 : (verticalAlignment == .none ? 1 : 2) // 2 := Wired behaviour with 1 line and override rect for lines
        verticalAlignment = vAlign
        textAlignment = hAlign
    }
    
    
    convenience init(text: String, fontType:  mui.fonts.kMUIFont, color: UIColor?=nil, useLines:Bool = false, vAlign: VerticalAlignment = .none, lineBreak: NSLineBreakMode = .byTruncatingTail) {
        self.init(fontType, color: color, useLines:useLines, vAlign: vAlign)
        attributedText = mui.attributedString(text, type:fontType, color: color, lineBreakMode: lineBreak)
    }
    
    
    private func checkPlaceholderLabel(){
        if placeholderLabel == nil {
            placeholderLabel = UILabel()
            placeholderLabel.isHidden = true
            addSubview(placeholderLabel)
            placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
            var c = [NSLayoutConstraint]()
            placeholderLeftConstraint = mui.layoutConstraint(placeholderLabel, attribute: .left, toItem: self, toAttribute: .left, constant: insets.left)[0]
            placeholderRightConstraint = mui.layoutConstraint(placeholderLabel, attribute: .right, toItem: self, toAttribute: .right, constant: -insets.right)[0]
            c.append(placeholderLeftConstraint)
            c.append(placeholderRightConstraint)
            c += mui.layout(placeholderLabel, mode: .fillV)
            NSLayoutConstraint.activate(c)
        }
    }
    
    
    func addTarget(_ target:Any, action: Selector){
        isUserInteractionEnabled = true
        addGestureRecognizer(mui.gestureRecognizer.singleTap(target, selector: action))
    }
    
    
    // Adds letter spacing to the attributed string
    //
    func addLetterspacing(_ spacing: CGFloat){
        if let attr = attributedText as? NSMutableAttributedString {
            attr.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: attr.length))
            attributedText = attr
        }
    }
    
    
    //
    // MARK: Custom alignment methods to enable exotic vertical top|middle|bottom
    //
    
    var verticalAlignment : VerticalAlignment = .none {
        didSet {
            if self.verticalAlignment != .none {
                setNeedsDisplay()
            }
        }
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines: Int) -> CGRect {
        if verticalAlignment == .none {
            return super.textRect(forBounds: bounds, limitedToNumberOfLines: limitedToNumberOfLines)
        }
        
        let rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: useLines ? 0 : 1)
        var x:CGFloat = 0
        
        switch self.textAlignment {
        case .center:
            x = bounds.origin.x + (bounds.size.width - rect.size.width) / 2
        case .right:
            x = self.bounds.size.width - rect.size.width
        default:
            x = bounds.origin.x
        }
  
        switch verticalAlignment {
        case .top:
            return CGRect(x: x, y: bounds.origin.y, width: rect.size.width, height: rect.size.height)
        case .middle:
            return CGRect(x: x, y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2, width: rect.size.width, height: rect.size.height)
        case .bottom:
            return CGRect(x: x, y: bounds.origin.y + (bounds.size.height - rect.size.height), width: rect.size.width, height: rect.size.height)
        default: return super.textRect(forBounds: bounds, limitedToNumberOfLines: limitedToNumberOfLines)
        }
    }
    
    override public func drawText(in rect: CGRect) {
        if verticalAlignment == .none {
            return super.drawText(in: rect.inset(by: insets))
        }
        
        super.drawText(in: self.textRect(forBounds: rect.inset(by: insets), limitedToNumberOfLines: useLines ? numberOfLines : 1))
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
