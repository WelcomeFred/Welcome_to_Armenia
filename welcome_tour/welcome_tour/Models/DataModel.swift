//
//  DataModel.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 3/11/21.
//

import Foundation
import UIKit
struct DataModel{
    var placeImage: UIImage?
    var placeName: String!
    var placeRegion: String!
    var placeDistance: String? //distance - Int , durationHour, durationMin
    var placeDescription: String!
    var placeImagesArray: [UIImage]?
    var placeLatitude: Double!
    var placeLongitude: Double!
}
