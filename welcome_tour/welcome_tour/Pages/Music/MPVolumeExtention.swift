//
//  MPVolumeExtention.swift
//  welcome_tour
//
//  Created by User on 29.03.21.
//

import Foundation
import MediaPlayer

extension MPVolumeView {
    var volumeSlider:UISlider {
        
        self.showsLargeContentViewer = false
        self.showsVolumeSlider = false
        self.isHidden = true
        self.alpha = 0
        var slider = UISlider()
        for subview in self.subviews {
            if subview.isKind(of: UISlider.self) {
                slider = subview as! UISlider
                slider.isContinuous = false
                (subview as! UISlider).value = AVAudioSession.sharedInstance().outputVolume
                return slider
            }
        }
        return slider
    }
}
