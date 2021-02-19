//
//  PlaceVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/19/21.
//

import UIKit

class PlaceVC: UIViewController {
    @IBOutlet weak var descriptionContainerView: UIView!
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var arContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapContainerView.isHidden = true
        arContainerView.isHidden = true
        
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
            descriptionContainerView.isHidden = false
            mapContainerView.isHidden = true
            arContainerView.isHidden = true
        }
    }
}
