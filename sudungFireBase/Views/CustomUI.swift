//
//  CustomUI.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/14/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
// Button
class ButtonCustom: UIButton {
    
    @IBInspectable var conneradius: CGFloat = 0.0 {
        didSet {
            updateLayout()
        }
    }
    
    @IBInspectable public var border: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = border
            layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func updateLayout() {
        if conneradius == -1 {
            self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
        }
        else {
            layer.cornerRadius = conneradius
        }
    }
}
// View
@IBDesignable
class ViewCustom: UIView {
    @IBInspectable
    public var conrnerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = conrnerRadius
            layer.borderWidth = 2
            layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
    }
    
}
// Label
@IBDesignable
class LabelCustom: UILabel {
    @IBInspectable
    public var conrnerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = conrnerRadius
        }
    }
    
}
