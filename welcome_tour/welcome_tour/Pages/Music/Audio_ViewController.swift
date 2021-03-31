//
//  Audio_ViewController.swift
//  welcome_tour
//
//  Created by User on 20.02.21.
//

import UIKit
import AVFoundation
import MediaPlayer

class Audio_ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleSongLbl: UILabel!
    @IBOutlet weak var artistSongLbl: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var playPause: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var currentTimeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    var time = 0
    var trackID: Int = 0
    var library = MusicLibrary().library
    var audioPlayer: AVAudioPlayer!
    var timer = Timer()
    private var volumeView = MPVolumeView()
    private var outputVolumeObserve: NSKeyValueObservation?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cover = library[trackID]["cover"] {
            coverImage.image = UIImage(named: "\(cover).jpg")
        }
        titleLbl.text = "Player"
        
        artistSongLbl.text = library[trackID]["artist"]!
        titleSongLbl.text = library[trackID]["title"]!
                
        slider.setThumbImage(UIImage(named: "apricot"), for: .normal)
        slider.setThumbImage(UIImage(named: "apricot"), for: UIControl.State.highlighted)

        slider.value = self.volumeView.volumeSlider.value
        
        music()
//        setUpPlayer()
        setupRemoteTransportControls()
        setupNotifications()
        setupNowPlaying()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        observe()
    
    }
    
    
    func music() {
        let path = Bundle.main.path(forResource: "\(trackID)", ofType: "mp3")
        
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            do {
                
               
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                audioPlayer.delegate = self
                
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
    
    func observe() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(true)
        } catch {
            print("Failed to activate audio session")
        }
        outputVolumeObserve = audioSession.observe(\.outputVolume, options: .new) { (audioSession, changes) in
            if let new = changes.newValue {
                self.slider.value = new
                print("Volume is:", new)
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
    
    @IBAction func togglePlayPause(_ sender: UIButton) {
        sender.pulstate()
        if audioPlayer.isPlaying {
            pause()
        } else {
            play()
            
        }
        
    }
    func play() {
        audioPlayer.play()
        playPause.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        updateNowPlaying(isPause: false)
        print("Play - current time: \(audioPlayer.currentTime) - is playing: \(audioPlayer.isPlaying)")
        UIView.animate(withDuration: 0.5, animations: {
            self.coverImage.transform =
                CGAffineTransform.identity
            
        })
        
    }
    
    func pause() {
        UIView.animate(withDuration: 0.5) {
            self.coverImage.transform =
                CGAffineTransform(scaleX: 0.85, y: 0.85)
            self.audioPlayer.pause()
            self.updateProgressView()
            self.updateNowPlaying(isPause: true)
            self.playPause.setImage(UIImage(named: "play"), for: UIControl.State.normal)
            print("Pause - current time: \(self.audioPlayer.currentTime) - is playing: \(self.audioPlayer.isPlaying)")

        }
    }
    
    
    
    @IBAction func nextSong(_ sender: UIButton) {
        playPause.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        
        self.coverImage.transform = CGAffineTransform.identity
        
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
        setupNowPlaying()

    }
    
    @IBAction func prevSong(_ sender: UIButton) {
        playPause.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        
        self.coverImage.transform = CGAffineTransform.identity
        
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
        setupNowPlaying()

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
                setupNowPlaying()
                updateNowPlaying(isPause: true)
                
            } else if trackID == library.count - 1 {
                trackID = library.count - trackID - 1
                setupNowPlaying()
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
        self.volumeView.volumeSlider.value = slider.value

    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        audioPlayer.stop()
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            print("Play command - is playing: \(self.audioPlayer.isPlaying)")
            if !self.audioPlayer.isPlaying {
                self.play()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            print("Pause command - is playing: \(self.audioPlayer.isPlaying)")
            if self.audioPlayer.isPlaying {
                self.pause()
                return .success
            }
            return .commandFailed
        }
        
        
    }
    
    func setupNowPlaying() {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = library[trackID]["title"]
        
        if let image = UIImage(named: library[trackID]["cover"]!) {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { size in
                return image
            }
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = audioPlayer.currentTime
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = audioPlayer.duration
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = audioPlayer.rate
        
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    func updateNowPlaying(isPause: Bool) {
        // Define Now Playing Info
        var nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo
        
        nowPlayingInfo![MPNowPlayingInfoPropertyElapsedPlaybackTime] = audioPlayer.currentTime
        nowPlayingInfo![MPNowPlayingInfoPropertyPlaybackRate] = isPause ? 0 : 1
        
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    func setupNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(handleInterruption),
                                       name: AVAudioSession.interruptionNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(handleRouteChange),
                                       name: AVAudioSession.routeChangeNotification,
                                       object: nil)
    }
    
    // MARK: Handle Notifications
    @objc func handleRouteChange(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
              let reason = AVAudioSession.RouteChangeReason(rawValue:reasonValue) else {
            return
        }
        switch reason {
            case .newDeviceAvailable:
                let session = AVAudioSession.sharedInstance()
                for output in session.currentRoute.outputs where output.portType == AVAudioSession.Port.headphones {
                    print("headphones connected")
                    DispatchQueue.main.sync {
                        self.play()
                    }
                    break
                }
            case .oldDeviceUnavailable:
                if let previousRoute =
                    userInfo[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription {
                    for output in previousRoute.outputs where output.portType == AVAudioSession.Port.headphones {
                        print("headphones disconnected")
                        DispatchQueue.main.sync {
                            self.pause()
                        }
                        break
                    }
                }
            default: ()
        }
    }
    
    @objc func handleInterruption(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }
        
        if type == .began {
            print("Interruption began")
            // Interruption began, take appropriate actions
        }
        else if type == .ended {
            if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
                if options.contains(.shouldResume) {
                    // Interruption Ended - playback should resume
                    print("Interruption Ended - playback should resume")
                    play()
                } else {
                    // Interruption Ended - playback should NOT resume
                    print("Interruption Ended - playback should NOT resume")
                }
            }
        }
    }
    
    // MARK: Actions
    //    @IBAction func togglePlayPause(_ sender: Any) {
    //      if (player.isPlaying) {
    //        pause()
    //      }
    //      else {
    //        play()
    //      }
    //    }
    //
    //    func play() {
    //      player.play()
    //      playPauseButton.setTitle("Pause", for: UIControl.State.normal)
    //      updateNowPlaying(isPause: false)
    //      print("Play - current time: \(player.currentTime) - is playing: \(player.isPlaying)")
    //    }
    //
    //    func pause() {
    //      player.pause()
    //      playPauseButton.setTitle("Play", for: UIControl.State.normal)
    //      updateNowPlaying(isPause: true)
    //      print("Pause - current time: \(player.currentTime) - is playing: \(player.isPlaying)")
    //    }
    //
    
    
    
    
}


