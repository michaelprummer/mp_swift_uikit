//
//  UIFont+MUI.swift
//  mpSwiftUiKit
//
//  Created by mac on 28.09.18.
//  Copyright © 2018 Michael Prummer. All rights reserved.
//

import Foundation
public enum kFontWeight {case light, regular, medium, bold }
public enum kFontStyle { case H16 }

extension UIFont {
    public struct mui {
        private static func tpCSRegular(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Regular", size: fontSize)!
        }
        
        private static func tpCSMedium(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Medium", size: fontSize)!
        }
        
        private static func tpCSBold(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Bold", size: fontSize)!
        }
        
        private static func tpCSLight(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Light", size: fontSize)!
        }
        
        private static func tpCSRobotoCondensed(fontSize: CGFloat) -> UIFont {
            return UIFont(name: "RobotoCondensed-Regular", size: fontSize)!
        }
        
        
        static func font(_ weight: kFontWeight, _ size: CGFloat) -> UIFont {
            var font: UIFont! = nil
            switch weight {
            case .bold:
                font = tpCSBold(fontSize: size)
            case .light:
                font = tpCSLight(fontSize: size)
            case .medium:
                font = tpCSMedium(fontSize: size)
            case .regular:
                font = tpCSRegular(fontSize: size)
            }
            
            return font
        }
        
        
        public static func attributes() -> [String:Any]{
            let attr = [String:Any]()
            
            return attr
        }
        
    }
}
