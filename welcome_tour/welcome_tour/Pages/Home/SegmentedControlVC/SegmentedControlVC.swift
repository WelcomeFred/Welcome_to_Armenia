//
//  SegmentedControlVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/19/21.
//

import UIKit

class SegmentedControlVC: UIViewController {
    @IBOutlet weak var descriptionContainerView: UIView!
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var arContainerView: UIView!
    var placeArr = DataModel()
    var place = ""
    override func viewDidLoad() {
        super.viewDidLoad()
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
