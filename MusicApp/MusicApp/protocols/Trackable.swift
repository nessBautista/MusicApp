//
//  Trackable.swift
//  MusicApp
//
//  Created by Nestor Hernandez on 2/18/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//

import UIKit

protocol Trackable {
    
}

protocol TrackingDelegate: AnyObject {
    func didStartTouchAtPosition(x: CGFloat, y: CGFloat)
    func touchIsChangingPosition(x: CGFloat, y: CGFloat)
}

