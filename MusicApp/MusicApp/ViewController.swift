//
//  ViewController.swift
//  MusicApp
//
//  Created by Nestor Hernandez on 1/27/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, SPTAudioStreamingDelegate, SPTAudioStreamingPlaybackDelegate{
       
    let player = SPTAudioStreamingController.sharedInstance()
    
    
    
    @IBOutlet weak var audioTrackControl: AudioTrackControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.controlSurface.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        /*
        
        do {
            try player.start(withClientId: "fef445467b6b4655962bf8719b063787", audioController: nil, allowCaching: true)
            player.delegate = self;
            player.playbackDelegate = self
            player.diskCache = SPTDiskCache(capacity: 1024 * 1024 * 64)
            
            
            //self.player.diskCache = [[SPTDiskCache alloc] initWithCapacity:1024 * 1024 * 64];
            //[self.player loginWithAccessToken:auth.session.accessToken];
        }catch{
            print("error starting player")
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7) {
            if let accessToken = (UIApplication.shared.delegate as! AppDelegate).sessionManager.session?.accessToken {
                self.player.login(withAccessToken: accessToken)
            }
        }
        */
    }
    
    @IBAction func play(_ sender: Any) {
        self.player.setIsPlaying(!self.player.playbackState.isPlaying, callback: nil)
    }
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController) {
        print("Audiostream login")
    }
    
    func audioStreaming(_ audioStreaming: SPTAudioStreamingController, didReceiveError error: Error) {
        print(error)
    }
    
    func audioStreaming(_ audioStreaming: SPTAudioStreamingController, didChangePlaybackStatus isPlaying: Bool) {
        if isPlaying {
            self.activateAudioSession()
        } else {
            self.deactivateAudioSession()
        }
    }
    
    func activateAudioSession() {
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .allowAirPlay)
        try? AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
    }
    
    func deactivateAudioSession(){
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }
}




