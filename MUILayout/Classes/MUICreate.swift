//
//  MPUIFactory.swift
//  mpSwiftUiKit
//
//  Created by mac on 28.09.18.
//  Copyright © 2018 Michael Prummer. All rights reserved.
//

import UIKit

public class mui {
    public static func border(opacity: CGFloat = 1.0, color: UIColor = .mBrownishGrey) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = false
        v.backgroundColor = color
        v.alpha = opacity
        
        return v
    }
    

    public static func imageView(_ imageName: String) -> UIImageView {
        let v = UIImageView(image: UIImage(named: imageName))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }

    public static func imageView() -> UIImageView {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }


    public static func view(color: UIColor, radius:CGFloat = 0) -> UIView {
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

    public static func button(title: String, fontWeight: kFontWeight, fontSize: CGFloat, color: UIColor!, alignment: UIControl.ContentHorizontalAlignment = .center) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.mui.font(fontWeight, fontSize)
        btn.contentHorizontalAlignment = alignment

        return btn
    }


    
    public struct MimeType {
        struct Video {
            static let MP4 = "video/mp4"
        }
        
        struct Image {
            static let PNG = "image/png"
        }
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
    
    
    
    public static func appNameAndVersionNumberDisplayString(_ devMode:String = "") -> String {
        let dict:NSDictionary = Bundle.main.infoDictionary! as NSDictionary
        let majorVersion:String = dict.object(forKey: "CFBundleShortVersionString") as! String
        let minorVersion:String = dict.object(forKey: "CFBundleVersion") as! String
        
        return "Version " + majorVersion + " (" + minorVersion + ")\(devMode)"
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
    
    
}

    
    
    

