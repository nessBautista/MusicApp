//
//  Audible.swift
//  MusicApp
//
//  Created by Nestor Hernandez on 2/18/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//

import UIKit

protocol Audible {
    func initializeAVFoundation()
}

protocol Recordable: Audible {
    func startRecording()
    func stopRecording()
}

protocol Playable: Audible {
    func play()
    func stop()
}
