//
//  DesignableImageView.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/19/21.
//

import UIKit
@IBDesignable

class MyImage: UIImageView {
    
  @IBInspectable var CornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = CornerRadius
    }
  }
  @IBInspectable var BorderColor: UIColor = .blue {
    didSet {
      layer.borderColor = BorderColor.cgColor
    }
  }
  @IBInspectable var BorderWith: CGFloat = 0 {
    didSet {
      layer.borderWidth = BorderWith
    }
  }
}
