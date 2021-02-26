//
//  MyImage.swift
//  welcome_tour
//
//  Created by User on 20.02.21.
//

import UIKit

@IBDesignable

class MyImage: UIImageView {
    @IBInspectable var radius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }

    @IBInspectable var borderColor: UIColor {
        set { layer.borderColor = newValue.cgColor }
        get { return UIColor(cgColor: layer.borderColor!) }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }
}
