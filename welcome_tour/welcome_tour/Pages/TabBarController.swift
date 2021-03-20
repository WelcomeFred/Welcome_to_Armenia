//
//  TabBarController.swift
//  welcome_tour
//
//  Created by User on 23.02.21.
//

import UIKit

class TabBarController: UITabBarController {
    
    private var bounceAnimation: CAKeyframeAnimation = {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.4, 1.3, 1.2, 1.1, 1.0]
        bounceAnimation.duration = TimeInterval(0.6)
        bounceAnimation.fillMode = CAMediaTimingFillMode(rawValue: kCATransition)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.linear
        return bounceAnimation
    }()
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.first as? UIImageView else {
            return
        }
        
        imageView.layer.add(bounceAnimation, forKey: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.selectedIndex = 0
        
        
        NotificationCenter.default.addObserver(forName: .language, object: nil, queue: .main) { notification in
            self.tabBar.items![0].title = LocalizableManager.getLocalizable(key: "Home")
            self.tabBar.items![1].title = LocalizableManager.getLocalizable(key: "Music")
            self.tabBar.items![2].title = LocalizableManager.getLocalizable(key: "More")
        }
        
        
        
        self.tabBar.unselectedItemTintColor = UIColor(red: 1/255, green: 25/255, blue: 147/255, alpha: 1)
        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 129/255, blue:0/255, alpha: 1)
        
        tabBar.items![0].title = LocalizableManager.getLocalizable(key: "Home")
        tabBar.items![1].title = LocalizableManager.getLocalizable(key: "Music")
        tabBar.items![2].title = LocalizableManager.getLocalizable(key: "More")
        
        for item in self.tabBar.items! {
            let unselectedItem = [NSAttributedString.Key.foregroundColor: UIColor.black]
            let selectedItem = [NSAttributedString.Key.foregroundColor: UIColor.black]
            
            item.setTitleTextAttributes(unselectedItem, for: .normal)
            item.setTitleTextAttributes(selectedItem, for: .selected)
        }
        
    }
   
}

extension NSNotification.Name {
    static let language = NSNotification.Name("languageNotification")
}


