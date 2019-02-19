//
//  AudioData.swift
//  MusicApp
//
//  Created by Nestor Hernandez on 2/18/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//

protocol AudioRepresentable {
    var audioLevels:[(x: CGFloat, y: CGFloat)] {get set}
    
    mutating func addAudioLevel(_ level:(x: CGFloat, y: CGFloat))
    
    init(audioLevels:[(x: CGFloat, y: CGFloat)])
    //init(rawAudio: Data) { most data will derivate from this}
}
extension AudioRepresentable {
    init(audioLevels:[(x: CGFloat, y: CGFloat)]) {
        self.init(audioLevels: audioLevels)
    }
    
}

public struct AudioData: AudioRepresentable{
    var audioLevels: [(x: CGFloat, y: CGFloat)]
    
    mutating func addAudioLevel(_ level:(x: CGFloat, y: CGFloat)) {
        self.audioLevels.append(level)
    }
}
