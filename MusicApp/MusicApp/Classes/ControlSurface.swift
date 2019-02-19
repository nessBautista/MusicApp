//
//  ControlSurface.swift
//  MusicApp
//
//  Created by Nestor Hernandez on 2/18/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//
/*
 ControlSurface is responsible for:
    - Notify current user's touch position in x, y coordinates
    - Perform any transformation required
 */
import UIKit

class ControlSurface: UIControl {
    var delegate: TrackingDelegate?
            
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let x = touch.location(in: self).x
        let y = touch.location(in: self).y
        delegate?.didStartTouchAtPosition(x: x, y: y)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let x = touch.location(in: self).x
        let y = touch.location(in: self).y
        delegate?.touchIsChangingPosition(x: x, y: y)
        return true
    }

}
