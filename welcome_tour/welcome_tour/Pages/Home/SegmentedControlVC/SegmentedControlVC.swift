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
    @IBOutlet weak var effect: UIVisualEffectView!
        var placeNavTitle = ""
        var descriptionText = ""
    var place = Places(rawValue: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.effect.alpha = 0.7
        segmentedControl.setTitle(LocalizableManager.getLocalizable(key: "Desc"), forSegmentAt: 0)
        segmentedControl.setTitle(LocalizableManager.getLocalizable(key: "Map"), forSegmentAt: 1)
        
        self.title = LocalizableManager.getLocalizable(key: place!.placeTitle)
        navbarOptions()
        showData()
    }
    
    @IBAction func selectSection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            descriptionContainerView.isHidden = false
            mapContainerView.isHidden = true
        case 1:
            descriptionContainerView.isHidden = true
            mapContainerView.isHidden = false
        case 2:
            descriptionContainerView.isHidden = true
            mapContainerView.isHidden = true
        default:
            break
        }
    }
    func showData() {
        let descriptionVC = descriptionContainerView.subviews.first?.next as? DescriptionVC
        let mapVC = mapContainerView.subviews.first?.next as? MapVC
        guard let placeData = place else {return}
        descriptionVC?.descriptionTextView.text = LocalizableManager.getLocalizable(key: placeData.description)
        mapVC?.placeTitle = LocalizableManager.getLocalizable(key: placeData.placeTitle)
        mapVC?.placeCoordinate = placeData.mapCoordinates

        if placeData.length == "" {
            mapVC?.showRouteButton.isHidden = true
        }
        else {
            mapVC?.showRouteButton.isHidden = false
        }
    }
}
