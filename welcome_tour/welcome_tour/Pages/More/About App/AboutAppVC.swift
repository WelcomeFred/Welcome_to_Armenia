//
//  AboutAppVC.swift
//  welcome_tour
//
//  Created by User on 24.02.21.
//

import UIKit

class AboutAppVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var descriptionText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.title = LocalizableManager.getLocalizable(key: "AboutApp")
        
        self.descriptionText.delegate = self
        descriptionText.text = LocalizableManager.getLocalizable(key: "description")
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

