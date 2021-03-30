//
//  DescriptionVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 3/1/21.
//

import UIKit
import ImageSlideshow

class DescriptionVC: UIViewController {
    
    @IBOutlet weak var slideShowImageView: ImageSlideshow!
    @IBOutlet weak var descriptionTextView: UITextView!
    var imageArray = [
        ImageSource(image: UIImage(named: "Ախթալայի վանք")!),
        ImageSource(image: UIImage(named: "Ամբերդ")!),
        ImageSource(image: UIImage(named: "Արագած լեռ")!),
        ImageSource(image: UIImage(named: "Զորաց Քարեր")!),
        ImageSource(image: UIImage(named: "Ծիծեռնակաբերդ")!),]
    
//    var descriptionText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.tintColor = UIColor.blue
        slideShowImageView.circular = true
        slideShowImageView.setImageInputs(imageArray)
        slideShowImageView.contentScaleMode = .scaleAspectFill
        slideShowImageView.slideshowInterval = 3
        
//        slideshowInterval - slideshow interval in seconds (default 0 – disabled)
//        zoomEnabled - enables zooming (default false)
//        circular - enables circular scrolling (default true)
//        activityIndicator – allows to set custom activity indicator, see Activity indicator section
//        pageIndicator – allows to set custom page indicator, see Page indicator section; assign nil to hide page indicator
//        pageIndicatorPosition - configures position of the page indicator
//        contentScaleMode - configures the scaling (default ScaleAspectFit)
//        draggingEnabled - enables dragging (default true)
//        currentPageChanged - closure called on page change
//        willBeginDragging - closure called on scrollViewWillBeginDragging
//        didEndDecelerating - closure called on scrollViewDidEndDecelerating
//        preload - image preloading configuration (default all preloading, also fixed)
    }
}
