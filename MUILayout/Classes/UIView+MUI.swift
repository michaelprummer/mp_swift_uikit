//
//  TPDefaultElements.swift
//
//  Created by Michael Prummer
//

import UIKit

extension UIView {
    public enum kMUILayoutMode:Int {case fillH, fillV, bottom, top, left, right, width, height, centerX, centerY}
    
    public func layout(_ muiConstraints: [kMUILayoutMode: CGFloat]) {
        if translatesAutoresizingMaskIntoConstraints {
           translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constList = [NSLayoutConstraint]()
        for const in muiConstraints {
            constList += layout(self, mode: const.key, const.value)
        }
        
        NSLayoutConstraint.activate(constList)
    }


    private func layoutConstraint(_ item: UIView, attribute: NSLayoutConstraint.Attribute, toItem: UIView!, toAttribute: NSLayoutConstraint.Attribute, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: toAttribute, multiplier: 1, constant: constant)]
    }

    
    private func layoutConstant(_ const: String, views: [String:AnyObject]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: const, options: [], metrics: nil, views: views)
    }
    

    private func layout(_ view: UIView, mode: kMUILayoutMode, _ value: CGFloat = 0) -> [NSLayoutConstraint] {
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
            return layoutConstraint(view, attribute: .centerX, toItem: view.superview!, toAttribute: .centerX)
        case .centerY:
            return layoutConstraint(view, attribute: .centerY, toItem: view.superview!, toAttribute: .centerY, constant: value)
        }
    }


    

}
