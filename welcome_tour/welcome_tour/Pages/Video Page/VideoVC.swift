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
    }
    override var prefersStatusBarHidden: Bool { //hiding status bar
        return true
    }
    
    func videoPlay() {
        let videoURL = Bundle.main.url(forResource: "video", withExtension: ".mp4")!
        let item = AVPlayerItem(url: videoURL)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: item, queue: .main) { _ in
            self.goToHomePage()
        }
        player = AVPlayer(playerItem: item)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.frame = view.layer.frame
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        player.volume = 0
        player.play()
        view.layer.addSublayer(playerLayer)
    }
    private func goToHomePage() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController
        self.present(vc!, animated: true, completion: nil)
    }
}
