class MUITools {
    
    struct MimeType {
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
    
    
    struct gestureRecognizer {
        static func singleTap(_ target: Any, selector: Selector) -> UITapGestureRecognizer {
            let tap = UITapGestureRecognizer(target: target, action: selector)
            tap.numberOfTapsRequired = 1
            tap.numberOfTouchesRequired = 1
            return tap
        }
    }
    
    
    struct dialogs {
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
    

    
    static func appNameAndVersionNumberDisplayString(_ devMode:String = "") -> String {
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
