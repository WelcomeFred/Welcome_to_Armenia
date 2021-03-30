//
//  CustomNavigationBar.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 3/17/21.
//

import Foundation
import UIKit

public extension UIViewController {
    func navbarOptions() { // showing navigationbar, transparent and blured
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
