//
//  SegmentedControlVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/19/21.
//

import UIKit

class SegmentedControlVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var descriptionContainerView: UIView!
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var arContainerView: UIView!
    @IBOutlet weak var effect: UIVisualEffectView!
    var placeArr = DataModel()
    var place = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.effect.alpha = 0.4
        
        if LocalizableManager.type == "hy" {
            let font = UIFont.systemFont(ofSize: 12)
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        }
        
        
        segmentedControl.setTitle(LocalizableManager.getLocalizable(key: "Desc"), forSegmentAt: 0)
        segmentedControl.setTitle(LocalizableManager.getLocalizable(key: "Map"), forSegmentAt: 1)
        
        self.title = placeArr.placeName
        navbarOptions()
        showData()
    }

    @IBAction func selectSection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            descriptionContainerView.isHidden = false
            mapContainerView.isHidden = true
            arContainerView.isHidden = true
            
        case 1:
            descriptionContainerView.isHidden = true
            mapContainerView.isHidden = false
            arContainerView.isHidden = true
        case 2:
            descriptionContainerView.isHidden = true
            mapContainerView.isHidden = true
            arContainerView.isHidden = false
        default:
            break
        }
    }
    func showData() {
        let descriptionVC = descriptionContainerView.subviews.first?.next as? DescriptionVC
//        let mapVC = mapContainerView.subviews.first?.next as? MapVC
//        let arkitVC = arContainerView.subviews.first?.next as? ARkitVC
        descriptionVC?.descriptionTextView.text = placeArr.placeDescription
    }
}
