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
            constList += mui.layout(self, mode: const.key, const.value)
        }
        
        NSLayoutConstraint.activate(constList)
    }


    


    

}
