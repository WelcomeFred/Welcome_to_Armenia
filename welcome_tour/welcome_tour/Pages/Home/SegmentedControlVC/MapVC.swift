//
//  MapVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/19/21.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController {
    @IBOutlet weak var gmsMapView: GMSMapView!
    @IBOutlet weak var showRouteButton: UIButton!
    
    var placeCoordinate = CLLocationCoordinate2D(latitude: 40.1775977, longitude: 44.5128729) //default location is Republic Square
    var placeTitle = ""
    var showRoute = true
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if placeTitle == "" {
            let camera = GMSCameraPosition.camera(withTarget: placeCoordinate, zoom: 17)
            self.gmsMapView.camera = camera
        }
        else {
            let camera = GMSCameraPosition.camera(withTarget: placeCoordinate, zoom: 16)
            self.gmsMapView.camera = camera
            let marker = GMSMarker(position: placeCoordinate)
            marker.title = placeTitle
            marker.map = self.gmsMapView
            gmsMapView.selectedMarker = marker
            gmsMapView.updateFocusIfNeeded()
            gmsMapView.addSubview(showRouteButton)
        }
        
    }
    
    @IBAction func showRouteButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: LocalizableManager.getLocalizable(key: "alertTitle"), message: nil, preferredStyle: .actionSheet)
        alert.view.tintColor = .blue
        let googleMapsAction = UIAlertAction(title: "Google Maps", style: .default) { (action) in
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an Google Maps app
                if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(self.placeCoordinate.latitude),\(self.placeCoordinate.longitude)&directionsmode=driving&views=traffic") {
                    UIApplication.shared.open(url, options: [:])
                }
            }
            else {//Open in browser
                if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(self.placeCoordinate.latitude),\(self.placeCoordinate.longitude)&directionsmode=driving&views=traffic") {
                    UIApplication.shared.open(urlDestination)
                }
            }
        }
        let yandexMapsAction = UIAlertAction(title: "Yandex Maps", style: .default) { (action) in
            if (UIApplication.shared.canOpenURL(URL(string:"yandexmaps://")!)) {  //if phone has an Yandex Maps app
                if let url = URL(string:"yandexmaps://maps.yandex.ru/?rtext=~\(self.placeCoordinate.latitude),\(self.placeCoordinate.longitude)&rtt=auto") {
                    UIApplication.shared.open(url, options: [:])
                }
            }
            else {//Open in browser
                if let urlDestination = URL.init(string: "https://maps.yandex.ru/?rtext=~\(self.placeCoordinate.latitude),\(self.placeCoordinate.longitude)&rtt=auto") {
                    UIApplication.shared.open(urlDestination)
                }
            }
        }
        
        alert.addAction(googleMapsAction)
        alert.addAction(yandexMapsAction)
        let cancelAction = UIAlertAction(title: LocalizableManager.getLocalizable(key: "alertCancelAction"), style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
