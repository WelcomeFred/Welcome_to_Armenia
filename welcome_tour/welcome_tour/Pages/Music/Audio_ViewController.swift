//
//  Audio_ViewController.swift
//  welcome_tour
//
//  Created by User on 20.02.21.
//

import UIKit
import AVFoundation

class Audio_ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var titleBlurEffect: UIVisualEffectView!
    
    @IBOutlet weak var effect: UIVisualEffectView!
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleSongLbl: UILabel!
    @IBOutlet weak var artistSongLbl: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var playPause: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var currentTimeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    
    
    var time = 0
    var trackID: Int = 0
    var library = MusicLibrary().library
    var audioPlayer: AVAudioPlayer!
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleBlurEffect.alpha = 0.8
        self.effect.alpha = 0.5
        
        if let cover = library[trackID]["cover"] {
            coverImage.image = UIImage(named: "\(cover).jpg")
        }
        titleLbl.text = "Player"
       
        artistSongLbl.text = library[trackID]["artist"]!
        titleSongLbl.text = library[trackID]["title"]!

        
//        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
//        progressView.progress = 0.0
//        progressView.layer.cornerRadius = 0
//        progressView.clipsToBounds = true
//        progressView.layer.sublayers![1].cornerRadius = 1.5
//        progressView.subviews[1].clipsToBounds = true

        music()
        
        
    }
    
    
    
    func music() {
        let path = Bundle.main.path(forResource: "\(trackID)", ofType: "mp3")
        
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            do {
                
//                try AVAudioSession.sharedInstance().setCategory(.playback)
//                try AVAudioSession.sharedInstance().setActive(true)
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                audioPlayer.delegate = self
//                audioPlayer.prepareToPlay()
//                audioPlayer.play()
                if (audioPlayer!.prepareToPlay())
                           {
                               audioPlayer!.play()
                           }
                audioPlayer.volume = slider.value

                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Audio_ViewController.updateProgressView), userInfo: nil, repeats: true)
                progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)

                } catch let error as NSError {
                print(error.localizedDescription)
                
            }
        }

    }
    
    func updateTimer() {
        
        guard let player = audioPlayer else { return }
        // Update time remaining label
        durationLbl.text = getFormattedTime(timeInterval: player.duration /* - player.currentTime*/)
        currentTimeLbl.text = getFormattedTime(timeInterval: player.currentTime)
        
    }
    
    @objc func updateProgressView() {
        if audioPlayer.isPlaying {
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
            time += 1
            
            updateTimer()
            
        
        }
     }
    
    @IBAction func playPause(_ sender: Any) {
                
        if (audioPlayer.isPlaying == true) {
            audioPlayer.pause()
            updateProgressView()

            playPause.setImage(UIImage(named: "play"), for: UIControl.State.normal)
            
            } else { audioPlayer.play()
            playPause.setImage(UIImage(named: "pause"), for: UIControl.State.normal)

        }
    }
    
    
    @IBAction func nextSong(_ sender: UIButton) {
        playPause.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        
        if trackID == 0 || trackID < library.count - 1 {
            trackID += 1
            
            } else if trackID == library.count - 1 {
            trackID = library.count - trackID - 1

        }
        if let cover = library[trackID]["cover"] {
            coverImage.image = UIImage(named: "\(cover).jpg")
        }

        artistSongLbl.text = library[trackID]["artist"]!
        titleSongLbl.text = library[trackID]["title"]!
        timer.invalidate()
        time = 0
        audioPlayer.currentTime = 0
        progressView.progress = 0
        
        music()
    }
    
    @IBAction func prevSong(_ sender: UIButton) {
        playPause.setImage(UIImage(named: "pause"), for: UIControl.State.normal)

        if trackID != 0 || trackID > 0 {
            trackID -= 1 }
        else if trackID == 0 {
            trackID = library.count - 1 - trackID
        }
        
        if let cover = library[trackID]["cover"] {
            coverImage.image = UIImage(named: "\(cover).jpg")
        }
        artistSongLbl.text = library[trackID]["artist"]!
        titleSongLbl.text = library[trackID]["title"]!
        timer.invalidate()
        time = 0
        
        audioPlayer.currentTime = 0
        progressView.progress = 0
        
        music()
    }
    
    @IBAction func fastForward(_ sender: UIButton) {
        var time: TimeInterval = audioPlayer.currentTime
        time += 7.0
        
        audioPlayer.currentTime = time
         timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Audio_ViewController.updateProgressView), userInfo: nil, repeats: true)
         progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        
        updateTimer()
    }
    
    @IBAction func rewind(_ sender: UIButton) {
        var time: TimeInterval = audioPlayer.currentTime
        time -= 7.0
         audioPlayer.currentTime = time
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Audio_ViewController.updateProgressView), userInfo: nil, repeats: true)
         progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        
        updateTimer()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            if trackID == 0 || trackID < library.count - 1 {
                trackID += 1
                
            } else if trackID == library.count - 1 {
                trackID = library.count - trackID - 1
                
            }
            if let cover = library[trackID]["cover"] {
                coverImage.image = UIImage(named: "\(cover).jpg")
            }

            artistSongLbl.text = library[trackID]["artist"]
            titleSongLbl.text = library[trackID]["title"]
            timer.invalidate()
            time = 0
            audioPlayer.currentTime = 0
            progressView.progress = 0
            
            music()
            
            }
        }
     
     func getFormattedTime(timeInterval: TimeInterval) -> String {
         let mins = timeInterval / 60
         let secs = timeInterval.truncatingRemainder(dividingBy: 60)
         let timeformatter = NumberFormatter()
         timeformatter.minimumIntegerDigits = 2
         timeformatter.minimumFractionDigits = 0
         timeformatter.roundingMode = .down
         guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value:  secs)) else {
             return ""
         }
         return "\(minsStr):\(secsStr)"
        
     }
    
    @IBAction func editVolume(_ sender: UISlider) {
        audioPlayer.volume = slider.value
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        audioPlayer.stop()
    }
    
}
