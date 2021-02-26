//
//  AboutAppVC.swift
//  welcome_tour
//
//  Created by User on 24.02.21.
//

import UIKit

class AboutAppVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var effect: UIVisualEffectView!
    @IBOutlet weak var titleBlurEffect: UIVisualEffectView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleBlurEffect.alpha = 0.8
        effect.alpha = 0.4
        effect.backgroundColor = .white
        
        self.descriptionText.delegate = self
        titleName.text = LocalizableManager.getLocalizable(key: "AboutApp")
        descriptionText.text = LocalizableManager.getLocalizable(key: "description")
        if LocalizableManager.type == "hy" {
            titleName.font = titleName.font.withSize(24)
        }

        
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
