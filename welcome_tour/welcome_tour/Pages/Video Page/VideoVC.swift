//
//  VideoVC.swift
//  welcome_tour
//
//  Created by User on 23.02.21.
//

import UIKit
import AVFoundation

class VideoVC: UIViewController {

    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    

    override func viewDidAppear(_ animated: Bool) {
        videoPlay()
        self.perform(#selector(goToHomePage), with: nil, afterDelay: 6.24)
    }
        
    
        
    func videoPlay() {
        let URL = Bundle.main.url(forResource: "video", withExtension: ".mp4")

        player = AVPlayer.init(url: (URL)!)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.frame = view.layer.frame
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        player.volume = 0
        player.play()
        view.layer.addSublayer(playerLayer)
    }
        
     
        
        
    @objc func goToHomePage() {
            
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController
            
        self.present(vc!, animated: true, completion: nil)
    }
}
