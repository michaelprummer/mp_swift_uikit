//
//  MPUIFactory.swift
//  mpSwiftUiKit
//
//  Created by mac on 28.09.18.
//  Copyright © 2018 Michael Prummer. All rights reserved.
//

import UIKit

class mui {
    static func border(opacity: CGFloat = 1.0, color: UIColor = .mBrownishGrey) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = false
        v.backgroundColor = color
        v.alpha = opacity
        
        return v
    }
    

    static func imageView(_ imageName: String) -> UIImageView {
        let v = UIImageView(image: UIImage(named: imageName))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }

    static func imageView() -> UIImageView {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }


    static func view(color: UIColor, radius:CGFloat = 0) -> UIView {
        let v = UIView()
        v.backgroundColor = color
        v.translatesAutoresizingMaskIntoConstraints = false

        if radius > 0 {
            v.layer.cornerRadius = radius
            v.layer.masksToBounds = true
        }

        return v
    }


    static func button(image named: String, title: String! = nil, tinted: UIColor? = nil) -> UIButton {
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

    static func button(title: String, fontWeight: kFontWeight, fontSize: CGFloat, color: UIColor!, alignment: UIControl.ContentHorizontalAlignment = .center) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.mui.font(fontWeight, fontSize)
        btn.contentHorizontalAlignment = alignment

        return btn
    }


    
}

    
    
    

