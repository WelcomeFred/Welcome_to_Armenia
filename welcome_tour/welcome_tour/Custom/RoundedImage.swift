//
//  RoundedImage.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/28/21.
//

import Foundation
import UIKit

@IBDesignable
final class RoundedImage: UIImageView {
    
    @IBInspectable var radius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
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
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
}
