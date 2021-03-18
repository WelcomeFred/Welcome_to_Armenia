//
//  LocalizableManager.swift
//  welcome_tour
//
//  Created by User on 24.02.21.
//

import UIKit

class LocalizableManager: NSObject {
    
    static var type: String = "en"
    
    static func getLocalizable(key: String) -> String {
        
        let path = Bundle.main.path(forResource: type, ofType: "lproj")
        let bundle = Bundle(path: path!)!
        
        return bundle.localizedString(forKey: key, value: nil, table: nil )
    }
}
