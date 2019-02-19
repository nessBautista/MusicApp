//
//  AudioTrackControl.swift
//  MusicApp
//
//  Created by Nestor Hernandez on 2/18/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//

/*
    AudioTrackControl: Responsible for  drawing operations.
    It transforms user's input into CoreGraphics elements:
 */

import UIKit

class AudioTrackControl: ControlSurface, TrackingDelegate, Drawable {
    
    var audioData: AudioData
    
    required init?(coder aDecoder: NSCoder) {
        self.audioData = AudioData(audioLevels: [])
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    override func draw(_ rect: CGRect) {
        drawBackgroundCircle()
        drawBackgroundMesh()
        drawPath(levels: audioData.audioLevels)
    }
    
    func didStartTouchAtPosition(x: CGFloat, y: CGFloat) {
        print("Touch started at position  x:\(x) y:\(y)")
    }
    
    func touchIsChangingPosition(x: CGFloat, y: CGFloat) {
        audioData.addAudioLevel((x:x, y:y))
        self.setNeedsDisplay()
    }
}
