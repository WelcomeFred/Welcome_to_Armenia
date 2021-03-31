//
//  DataModel.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 3/11/21.
//

import Foundation
import GoogleMaps

enum Places: Int, CaseIterable {
    case akhtala
    case amberd
    case aragatsMount
    case araratMount
    case byurakanObservatory
    case gandzasar
    case garni
    case geghard
    case dadivank
    case dvin
    case zoratsKarer
    case zvartnots
    case etchmiadzinCathedral
    case lastiver
    case khorVirap
    case tsitsernakaberd
    case kecharis
    case haghartsin
    case haghpatMonastery
    case armenianAlphabetMonument
    case hankavan
    case ghazanchetsots
    case marmashenMonastery
    case marmarner
    case weAreOurMountains
    case noravank
    case shakiWaterfall
    case jermukWaterfall
    case saghmosavank
    case sanahinMonastery
    case sardarapat
    case lakeSevan
    case tatevMonastery
    case symphonyofstones
    case odzun
    case oshakan
    
    
    var placeTitle: String {
        switch self {
            case .akhtala:
                return "place1"
            case .amberd:
                return "place2"
            case .aragatsMount:
                return "place3"
            case .araratMount:
                return "place4"
            case .byurakanObservatory:
                return "place5"
            case .gandzasar:
                return "place6"
            case .garni:
                return "place7"
            case .geghard:
                return "place8"
            case .dadivank:
                return "place9"
            case .dvin:
                return "place10"
            case .zoratsKarer:
                return "place11"
            case .zvartnots:
                return "place12"
            case .etchmiadzinCathedral:
                return "place13"
            case .lastiver:
                return "place14"
            case .khorVirap:
                return "place15"
            case .tsitsernakaberd:
                return "place16"
            case .kecharis:
                return "place17"
            case .haghartsin:
                return "place18"
            case .haghpatMonastery:
                return "place19"
            case .armenianAlphabetMonument:
                return "place20"
            case .hankavan:
                return "place21"
            case .ghazanchetsots:
                return "place22"
            case .marmashenMonastery:
                return "place23"
            case .marmarner:
                return "place24"
            case .weAreOurMountains:
                return "place25"
            case .noravank:
                return "place26"
            case .shakiWaterfall:
                return "place27"
            case .jermukWaterfall:
                return "place28"
            case .saghmosavank:
                return "place29"
            case .sanahinMonastery:
                return "place30"
            case .sardarapat:
                return "place31"
            case .lakeSevan:
                return "place32"
            case .tatevMonastery:
                return "place33"
            case .symphonyofstones:
                return "place34"
            case .odzun:
                return "place35"
            case .oshakan:
                return "place36"
        }
    }
    var region: String {
        switch self {
            case .akhtala:
                return "LoriRegion"
            case .amberd:
                return "AragatsotnRegion"
            case .aragatsMount:
                return "AragatsotnRegion"
            case .araratMount:
                return ""
            case .byurakanObservatory:
                return "AragatsotnRegion"
            case .gandzasar:
                return "Artsakh"
            case .garni:
                return "KotaykRegion"
            case .geghard:
                return "KotaykRegion"
            case .dadivank:
                return "Artsakh"
            case .dvin:
                return "AraratRegion"
            case .zoratsKarer:
                return "SyunikRegion"
            case .zvartnots:
                return "ArmavirRegion"
            case .etchmiadzinCathedral:
                return "ArmavirRegion"
            case .lastiver:
                return "TavushRegion"
            case .khorVirap:
                return "AraratRegion"
            case .tsitsernakaberd:
                return "Yerevan"
            case .kecharis:
                return "KotaykRegion"
            case .haghartsin:
                return "TavushRegion"
            case .haghpatMonastery:
                return "LoriRegion"
            case .armenianAlphabetMonument:
                return "AragatsotnRegion"
            case .hankavan:
                return "KotaykRegion"
            case .ghazanchetsots:
                return "Artsakh"
            case .marmashenMonastery:
                return "ShirakRegion"
            case .marmarner:
                return "AraratRegion"
            case .weAreOurMountains:
                return "Artsakh"
            case .noravank:
                return "VayotsDzorRegion"
            case .shakiWaterfall:
                return "SyunikRegion"
            case .jermukWaterfall:
                return "VayotsDzorRegion"
            case .saghmosavank:
                return "AragatsotnRegion"
            case .sanahinMonastery:
                return "LoriRegion"
            case .sardarapat:
                return "ArmavirRegion"
            case .lakeSevan:
                return "GegharkunikRegion"
            case .tatevMonastery:
                return "SyunikRegion"
            case .symphonyofstones:
                return "KotaykRegion"
            case .odzun:
                return "LoriRegion"
            case .oshakan:
                return "AragatsotnRegion"
        }
        
    }
    var length: String {
        switch self {
            case .akhtala:
                return "duration1"
            case .amberd:
                return "duration2"
            case .aragatsMount:
                return "duration3"
            case .araratMount:
                return ""
            case .byurakanObservatory:
                return "duration5"
            case .gandzasar:
                return "duration6"
            case .garni:
                return "duration7"
            case .geghard:
                return "duration8"
            case .dadivank:
                return ""
            case .dvin:
                return "duration10"
            case .zoratsKarer:
                return "duration11"
            case .zvartnots:
                return "duration12"
            case .etchmiadzinCathedral:
                return "duration13"
            case .lastiver:
                return "duration14"
            case .khorVirap:
                return "duration15"
            case .tsitsernakaberd:
                return "duration16"
            case .kecharis:
                return "duration17"
            case .haghartsin:
                return "duration18"
            case .haghpatMonastery:
                return "duration19"
            case .armenianAlphabetMonument:
                return "duration20"
            case .hankavan:
                return "duration21"
            case .ghazanchetsots:
                return ""
            case .marmashenMonastery:
                return "duration23"
            case .marmarner:
                return "duration24"
            case .weAreOurMountains:
                return "duration25"
            case .noravank:
                return "duration26"
            case .shakiWaterfall:
                return "duration27"
            case .jermukWaterfall:
                return "duration28"
            case .saghmosavank:
                return "duration29"
            case .sanahinMonastery:
                return "duration30"
            case .sardarapat:
                return "duration31"
            case .lakeSevan:
                return "duration32"
            case .tatevMonastery:
                return "duration33"
            case .symphonyofstones:
                return "duration34"
            case .odzun:
                return "duration35"
            case .oshakan:
                return "duration36"
        }
        
    }
    var description: String {
        switch self {
            case .akhtala:
                return "text1"
            case .amberd:
                return "text2"
            case .aragatsMount:
                return "text3"
            case .araratMount:
                return "text4"
            case .byurakanObservatory:
                return "text5"
            case .gandzasar:
                return "text6"
            case .garni:
                return "text7"
            case .geghard:
                return "text8"
            case .dadivank:
                return "text9"
            case .dvin:
                return "text10"
            case .zoratsKarer:
                return "text11"
            case .zvartnots:
                return "text12"
            case .etchmiadzinCathedral:
                return "text13"
            case .lastiver:
                return "text14"
            case .khorVirap:
                return "text15"
            case .tsitsernakaberd:
                return "text16"
            case .kecharis:
                return "text17"
            case .haghartsin:
                return "text18"
            case .haghpatMonastery:
                return "text19"
            case .armenianAlphabetMonument:
                return "text20"
            case .hankavan:
                return "text21"
            case .ghazanchetsots:
                return "text22"
            case .marmashenMonastery:
                return "text23"
            case .marmarner:
                return "text24"
            case .weAreOurMountains:
                return "text25"
            case .noravank:
                return "text26"
            case .shakiWaterfall:
                return "text27"
            case .jermukWaterfall:
                return "text28"
            case .saghmosavank:
                return "text29"
            case .sanahinMonastery:
                return "text30"
            case .sardarapat:
                return "text31"
            case .lakeSevan:
                return "text32"
            case .tatevMonastery:
                return "text33"
            case .symphonyofstones:
                return "text34"
            case .odzun:
                return "text35"
            case .oshakan:
                return "text36"
                
        }
        
    }
    
    var mapCoordinates: CLLocationCoordinate2D {
        switch self {
            case .akhtala:
                return CLLocationCoordinate2D(latitude: 41.150639, longitude: 44.763519)
            case .amberd:
                return CLLocationCoordinate2D(latitude: 40.387510, longitude: 44.228220)
            case .aragatsMount:
                return CLLocationCoordinate2D(latitude: 40.523190, longitude: 44.194583)
            case .araratMount:
                return CLLocationCoordinate2D(latitude: 39.702415, longitude: 44.299042)
            case .byurakanObservatory:
                return CLLocationCoordinate2D(latitude: 40.330324, longitude: 44.273401)
            case .gandzasar:
                return CLLocationCoordinate2D(latitude: 40.057309, longitude: 46.530667)
            case .garni:
                return CLLocationCoordinate2D(latitude: 40.112329, longitude: 44.730165)
            case .geghard:
                return CLLocationCoordinate2D(latitude: 40.140476, longitude: 44.818420)
            case .dadivank:
                return CLLocationCoordinate2D(latitude: 40.161636, longitude: 46.288378)
            case .dvin:
                return CLLocationCoordinate2D(latitude: 40.004480, longitude: 44.578386)
            case .zoratsKarer:
                return CLLocationCoordinate2D(latitude: 39.550675, longitude: 46.028577)
            case .zvartnots:
                return CLLocationCoordinate2D(latitude: 40.160224, longitude: 44.336336)
            case .etchmiadzinCathedral:
                return CLLocationCoordinate2D(latitude: 40.161990, longitude: 44.291152)
            case .lastiver:
                return CLLocationCoordinate2D(latitude: 40.911464, longitude: 45.104336)
            case .khorVirap:
                return CLLocationCoordinate2D(latitude: 39.878291, longitude: 44.576363)
            case .tsitsernakaberd:
                return CLLocationCoordinate2D(latitude: 40.185773, longitude: 44.490567)
            case .kecharis:
                return CLLocationCoordinate2D(latitude: 40.533793, longitude: 44.716151)
            case .haghartsin:
                return CLLocationCoordinate2D(latitude: 40.801923, longitude: 44.890636)
            case .haghpatMonastery:
                return CLLocationCoordinate2D(latitude: 41.093792, longitude: 44.711552)
            case .armenianAlphabetMonument:
                return CLLocationCoordinate2D(latitude: 40.408273, longitude: 44.380720)
            case .hankavan:
                return CLLocationCoordinate2D(latitude: 40.635248, longitude: 44.485040)
            case .ghazanchetsots:
                return CLLocationCoordinate2D(latitude: 39.758728, longitude: 46.747512)
            case .marmashenMonastery:
                return CLLocationCoordinate2D(latitude: 40.842837, longitude: 43.755731)
            case .marmarner:
                return CLLocationCoordinate2D(latitude: 40.044566, longitude: 44.554507)
            case .weAreOurMountains:
                return CLLocationCoordinate2D(latitude: 39.837268, longitude: 46.770462)
            case .noravank:
                return CLLocationCoordinate2D(latitude: 39.684744, longitude: 45.233010)
            case .shakiWaterfall:
                return CLLocationCoordinate2D(latitude: 39.552334, longitude: 45.993841)
            case .jermukWaterfall:
                return CLLocationCoordinate2D(latitude: 39.834751, longitude: 45.682733)
            case .saghmosavank:
                return CLLocationCoordinate2D(latitude: 40.380514, longitude: 44.396771)
            case .sanahinMonastery:
                return CLLocationCoordinate2D(latitude: 41.087146, longitude: 44.666042)
            case .sardarapat:
                return CLLocationCoordinate2D(latitude: 40.093393, longitude: 43.946185)
            case .lakeSevan:
                return CLLocationCoordinate2D(latitude: 40.356503, longitude: 45.328307)
            case .tatevMonastery:
                return CLLocationCoordinate2D(latitude: 40.046528, longitude: 49.016459)
            case .symphonyofstones:
                return CLLocationCoordinate2D(latitude: 40.153716, longitude: 44.675050)
            case .odzun:
                return CLLocationCoordinate2D(latitude: 41.050982, longitude: 44.616199)
            case .oshakan:
                return CLLocationCoordinate2D(latitude: 40.258586, longitude: 44.315658)
        }
    }
}
