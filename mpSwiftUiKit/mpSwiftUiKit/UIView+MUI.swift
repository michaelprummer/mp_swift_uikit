//
//  TPDefaultElements.swift
//
//  Created by Michael Prummer
//

import UIKit

extension UIView {
    enum kMUILayoutMode:Int {case hori, vert, bottom, top, left, right, width, height}
    
    func layout(_ muiConstraints: [kMUILayoutMode: CGFloat]) {
        if translatesAutoresizingMaskIntoConstraints {
           translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constList = [NSLayoutConstraint]()
        for const in muiConstraints {
            constList += layout(self, mode: const.key, const.value)
        }
        
        NSLayoutConstraint.activate(constList)
    }

    


//    // TPTextField
//    //
//    static func tpPasswordTextField() -> TPTextField {
//        let tf = TPTextField(fontType: .csRegular14Left, color: .taWhite)
//        tf.font = kTPRAttributedStringType.csRegular14Left.font
//        tf.isSecureTextEntry = true
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.attributedPlaceholder = TPTools.attributedString(NSLocalizedString("Enter your password.", comment: "TPTools_EnterPassword."), type: .csRegular14Left, color: .taBrownishGrey)
//        tf.autocorrectionType = .no
//        tf.spellCheckingType = .no
//        tf.autocapitalizationType = .none
//        tf.contentVerticalAlignment = .center
//        return tf
//    }
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
    private func layoutConstraint(_ item: UIView, attribute: NSLayoutConstraint.Attribute, toItem: UIView!, toAttribute: NSLayoutConstraint.Attribute, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: toAttribute, multiplier: 1, constant: constant)]
    }


    private func layout(_ view: UIView, mode: kMUILayoutMode, _ value: CGFloat = 0) -> [NSLayoutConstraint] {
        let desc = "view_\(view.hash)"
        switch mode {
        case .hori:
            return layoutConstant("H:|-\(value)-[\(desc)]-\(value)-|", views: [desc : view])
        case .vert:
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
        }
    }




    private func layoutConstant(_ const: String, views: [String:AnyObject]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: const, options: [], metrics: nil, views: views)
    }

}
