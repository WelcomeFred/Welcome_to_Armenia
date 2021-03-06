//
//  HelpVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/26/21.
//

import UIKit
import iCarousel

class HelpVC: UIViewController, iCarouselDataSource {
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary /* .cylndr , .rotary , .coverFlow */
        view.autoscroll = CGFloat(-0.5)
        view.isPagingEnabled = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.title = LocalizableManager.getLocalizable(key: "Help")
        view.addSubview(myCarousel )
        myCarousel.dataSource = self
        
        //myCarousel.autoscroll = -0.5
        
        myCarousel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 400)
    }
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 450))
        view.backgroundColor = .white
        let imageview = UIImageView(frame:  view.bounds)
        view.addSubview(imageview)
        imageview.contentMode = .scaleToFill
        imageview.image = UIImage(named: "iCarousel\(index+1)")
        
        return view
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
