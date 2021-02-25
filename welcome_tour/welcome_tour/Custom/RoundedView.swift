//
//  RoundedView.swift
//  Mealo
//
//  Created by ArtS on 2/19/19.
//  Copyright © 2019 ArtS. All rights reserved.
//

import UIKit

@IBDesignable
final class RoundedView: UIView {

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
