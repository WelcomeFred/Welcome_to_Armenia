//
//  ButtonExtention.swift
//  welcome_tour
//
//  Created by User on 20.03.21.
//

import Foundation
import UIKit

extension UIButton {
    func pulstate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.9
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 0.6
        pulse.initialVelocity = 0.5
        pulse.damping = 1
        
        layer.add(pulse, forKey: nil)
        
    }
   
    
}
