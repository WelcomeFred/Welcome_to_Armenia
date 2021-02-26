//
//  RoundedShadowView.swift
//  Machan Home
//
//  Created by ArtS on 12/12/18.
//  Copyright © 2018 ArtS. All rights reserved.
//

import UIKit

@IBDesignable
final class RoundedShadowView: UIView {

    @IBInspectable var radius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowRadius = 5
        layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //layer.shadowColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
