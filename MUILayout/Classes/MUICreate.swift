//
//  MPUIFactory.swift
//  mpSwiftUiKit
//
//  Created by mac on 28.09.18.
//  Copyright © 2018 Michael Prummer. All rights reserved.
//

import UIKit

//
// Overwrite with your settings
//
public class DefaultSettings {
    var font = FontSettings()
    
    struct FontSettings {
        var size = FontSize()
        var name = FontName()
        
        init() {}
        
        public struct FontSize {
            public var regular: CGFloat = 15.5
            public var large: CGFloat = 18
            public var small: CGFloat = 12
        }
        
        public struct FontName {
            public var regular = "Roboto-Regular"
            public var medium = "Roboto-Medium"
            public var bold = "Roboto-Bold"
            public var light = "Roboto-Light"
            public var condensed = "RobotoCondensed-Regular"
        }
    }
    
}

public class mui {
    public static let shared = mui()
    public var settings = DefaultSettings()
    
    
    public struct create {
        public static func border(opacity: CGFloat = 1.0, color: UIColor = .mBrownishGrey) -> UIView {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.isUserInteractionEnabled = false
            v.backgroundColor = color
            v.alpha = opacity
            return v
            mui.shared.settings.font.name.bold = ""
        }
        
        
        public static func imageView(_ imageName: String? = nil, tinted: UIColor? = nil) -> UIImageView {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.tintColor = tinted
            
            if !mui.tools.isNilOrEmtpy(imageName) {
                iv.image = UIImage(named: imageName!)
             
                if tinted != nil {
                    iv.image = iv.image?.withRenderingMode(.alwaysTemplate)
                }
            }
            
            return iv
        }
        
        
        public static func view(_ color: UIColor, radius:CGFloat = 0) -> UIView {
            let v = UIView()
            v.backgroundColor = color
            v.translatesAutoresizingMaskIntoConstraints = false
            
            if radius > 0 {
                v.layer.cornerRadius = radius
                v.layer.masksToBounds = true
            }
            
            return v
        }
        
        
        public static func button(image named: String, title: String! = nil, tinted: UIColor? = nil) -> UIButton {
            let  btn = UIButton(frame: CGRect.zero)
            btn.translatesAutoresizingMaskIntoConstraints = false
            
            if let image = UIImage(named: named) {
                
                if tinted != nil {
                    btn.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                    btn.tintColor = tinted
                } else {
                    btn.setImage(image, for: .normal)
                }
            }
            
            
            if title != nil {
                btn.setTitle(title, for: .normal)
            }
            
            return btn
        }
        
        public static func button(title: String, fontStyle: mui.fonts.kMUIFont, fontSize: CGFloat, color: UIColor!, alignment: UIControl.ContentHorizontalAlignment = .center) -> UIButton {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.titleLabel?.font = fontStyle.font(size: fontSize)
            btn.contentHorizontalAlignment = alignment
            
            return btn
        }
        
        
        static func tpPasswordTextField() -> MUITextField {
            let tf = MUITextField()
            //tf.font = kTPRAttributedStringType.csRegular14Left.font
            tf.isSecureTextEntry = true
            tf.translatesAutoresizingMaskIntoConstraints = false
            //tf.attributedPlaceholder = TPTools.attributedString(NSLocalizedString("Enter your password.", comment: "TPTools_EnterPassword."), type: .csRegular14Left, color: .taBrownishGrey)
            tf.autocorrectionType = .no
            tf.spellCheckingType = .no
            tf.autocapitalizationType = .none
            tf.contentVerticalAlignment = .center
            return tf
        }
        //
        //
        //    // #selector(handleRefresh(_:))
        //    class func tpRefreshControl(target: AnyObject, onComplete action: Selector) -> UIRefreshControl {
        //        let refreshControl = UIRefreshControl()
        //        refreshControl.addTarget(target, action: action, for: .valueChanged)
        //        refreshControl.backgroundColor = .taBlackTwo
        //        refreshControl.tintColor = .white
        //        //refreshControl.attributedTitle = TPTools.attributedString(NSLocalizedString("Reloading data", comment: "TPPriceTagViewController_ReloadData"), type: .csRegular12Center, color: .white)
        //        return refreshControl
        //    }
        //
        //

    }
    

    

    
    //    static var navigationController: UINavigationController? {
    //        return UIApplication.shared.delegate!.window??.rootViewController as? UINavigationController
    //    }
    //
    //    static func navigationBarHeight() -> CGFloat {
    //        let navbar = (rootController() as? UINavigationController)?.navigationBar.frame
    //
    //        if navbar != nil {
    //            return navbar!.height + navbar!.origin.y
    //        }
    //
    //        return 0
    //    }
    
    //MARK: UI Helpers
    
    
    public struct fonts {
        public enum kMUIFont {
            case light, regular, medium, bold, condensed
            
            func font(size: CGFloat = mui.shared.settings.font.size.regular) -> UIFont {
                switch self {
                case .bold:
                    return mui.fonts.bold(fontSize: size)
                case .light:
                    return mui.fonts.light(fontSize: size)
                case .medium:
                    return mui.fonts.medium(fontSize: size)
                case .regular:
                    return mui.fonts.regular(fontSize: size)
                case .condensed:
                    return mui.fonts.condensed(fontSize: size)
                    
                }
            }
        }
        
        
        private static func regular(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Regular", size: fontSize)!
        }
        
        private static func medium(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Medium", size: fontSize)!
        }
        
        private static func bold(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Bold", size: fontSize)!
        }
        
        private static func light(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Light", size: fontSize)!
        }
        
        private static func condensed(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "RobotoCondensed-Regular", size: fontSize)!
        }
        
        
        public static func attributes() -> [String:Any]{
            let attr = [String:Any]()
            
            return attr
        }

    }
    
    
    public struct gestureRecognizer {
        static func singleTap(_ target: Any, selector: Selector) -> UITapGestureRecognizer {
            let tap = UITapGestureRecognizer(target: target, action: selector)
            tap.numberOfTapsRequired = 1
            tap.numberOfTouchesRequired = 1
            return tap
        }
    }
    
    
    public struct dialogs {
        static func alert(_ text: String, msg:String?=nil, controller: UIViewController, completion: (() -> Void)?) {
            let alertController = UIAlertController(title: text, message: msg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "Alert_Ok").capitalized , style: .default) { (a:UIAlertAction) in
                completion?()
            }
            
            alertController.addAction(okAction)
            controller.present(alertController, animated: true, completion: nil)
        }
        
        static func alert(_ title: String, controller: UIViewController, message: String? = nil, ok: (() -> Void)?, cancel: (() -> Void)?) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "ok").capitalized, style: .default) { (a:UIAlertAction) in
                ok?()
            }
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: "cancel").capitalized, style: .cancel) { (a:UIAlertAction) in
                cancel?()
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
    public struct tools {
        public static func isNilOrEmtpy(_ str: String?) -> Bool {
            return str?.isEmpty ?? true
        }
        
        public static func appNameAndVersionNumberDisplayString(_ devMode:String = "") -> String {
            let dict:NSDictionary = Bundle.main.infoDictionary! as NSDictionary
            let majorVersion:String = dict.object(forKey: "CFBundleShortVersionString") as! String
            let minorVersion:String = dict.object(forKey: "CFBundleVersion") as! String
            
            return "Version " + majorVersion + " (" + minorVersion + ")\(devMode)"
        }
        
        public struct MimeType {
            struct Video {
                static let MP4 = "video/mp4"
            }
            
            struct Image {
                static let PNG = "image/png"
            }
        }
    }
    
    
    
    //    static func attributedString(_ title: String, type: kTPRAttributedStringType, color: UIColor? = nil, lineBreakMode: NSLineBreakMode = .byTruncatingTail) -> NSAttributedString {
    //        return NSAttributedString(string: title, attributes: NSDictionary.attributeDictionaryForStringType(type, color: color, lineBreakMode: lineBreakMode))
    //    }
    //
    //
    //
    //    static func performWith(delay:Double, target: AnyObject,  selector: Selector){
    //        Timer.scheduledTimer(timeInterval: delay, target: target, selector: selector, userInfo: nil, repeats: false)
    //    }
    //
    //    static func documentPath(append filename: String) -> URL? {
    //        guard let documentsDirectoryPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return nil }
    //        guard let documentsDirectoryPath = NSURL(string: documentsDirectoryPathString) else { return nil }
    //        return documentsDirectoryPath.appendingPathComponent(filename)
    //    }
    
    
    
    // Pin to safe area
    //
    
    public enum kSafeLayoutAnchor { case top, bottom, fillVertical }
    
    public static func pinSafeArea(_ controller: UIViewController, target view: UIView, mode: kSafeLayoutAnchor, standardSpacing: CGFloat = 0){
        if #available(iOS 11, *) {
            let guide = controller.view.safeAreaLayoutGuide
            
            switch mode {
            case .top:
                NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: guide.topAnchor, constant: standardSpacing)])
                
            case .bottom:
                NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: guide.bottomAnchor, constant: standardSpacing)])
                
            case .fillVertical:
                NSLayoutConstraint.activate([
                    view.topAnchor.constraint(equalTo: guide.topAnchor, constant: standardSpacing),
                    guide.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0)
                    ])
            }
            
        } else {
            switch mode {
            case .top:
                NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: controller.topLayoutGuide.topAnchor, constant: standardSpacing)])
                
            case .bottom:
                NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: controller.topLayoutGuide.bottomAnchor, constant: standardSpacing)])
                
            case .fillVertical:
                NSLayoutConstraint.activate([
                    view.topAnchor.constraint(equalTo: controller.topLayoutGuide.bottomAnchor, constant: standardSpacing),
                    controller.bottomLayoutGuide.topAnchor.constraint(equalTo: view.bottomAnchor, constant: standardSpacing)
                    ])
            }
        }
    }
    
    public static func layoutConstraint(_ item: UIView, attribute: NSLayoutConstraint.Attribute, toItem: UIView!, toAttribute: NSLayoutConstraint.Attribute, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: toAttribute, multiplier: 1, constant: constant)]
    }
    
    
    static func layoutConstant(_ const: String, views: [String:AnyObject]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: const, options: [], metrics: nil, views: views)
    }
    
    
    public static func layout(_ view: UIView, mode: UIView.kMUILayoutMode, _ value: CGFloat = 0) -> [NSLayoutConstraint] {
        let desc = "view_\(view.hash)"
        switch mode {
        case .fillH:
            return layoutConstant("H:|-\(value)-[\(desc)]-\(value)-|", views: [desc : view])
        case .fillV:
            return layoutConstant("V:|-\(value)-[\(desc)]-\(value)-|", views: [desc : view])
        case .bottom:
            return layoutConstant("V:[\(desc)]-\(value)-|", views: [desc : view])
        case .top:
            return layoutConstant("V:|-\(value)-[\(desc)]", views: [desc : view])
        case .left:
            return layoutConstant("H:|-\(value)-[\(desc)]", views: [desc : view])
        case .right:
            return layoutConstant("H:[\(desc)]-\(value)-|", views: [desc : view])
        case .width:
            return layoutConstant("H:[\(desc)(\(value))]", views: [desc : view])
        case .height:
            return layoutConstant("V:[\(desc)(\(value))]", views: [desc : view])
        case .centerX:
            return layoutConstraint(view, attribute: .centerX, toItem: view.superview!, toAttribute: .centerX, constant: value)
        case .centerY:
            return layoutConstraint(view, attribute: .centerY, toItem: view.superview!, toAttribute: .centerY, constant: value)
        }
    }
    
}

    
    
    

