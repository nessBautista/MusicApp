//
//  Drawable.swift
//  MusicApp
//
//  Created by Nestor Hernandez on 2/18/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//

import UIKit

/*
 protocol Drawable -> Concern with drawing background elements
 */
public protocol Drawable {
    var audioData: AudioData {get set}
    
    func drawBackgroundCircle()
    func drawPath(levels:[(x:CGFloat, y:CGFloat)])
    func drawBackgroundMesh()
}

extension Drawable where Self: UIView  {

    func drawBackgroundCircle() {        
        let path = UIBezierPath(ovalIn: self.bounds)
        UIColor.green.setFill()
        path.fill()
    }
    
    func drawPath(levels:[(x:CGFloat, y:CGFloat)]){
        
        guard levels.count > 0 else {return}
        guard let context = UIGraphicsGetCurrentContext() else {return}
        context.saveGState()
        context.beginPath()
        let origin = levels.first
        context.move(to: CGPoint(x: origin?.x ?? 0, y: origin?.y ?? 0))
        for point in levels{
            context.addLine(to: CGPoint(x: point.x, y: point.y))
        }
        context.strokePath()
        context.restoreGState()
    }
    
    func drawBackgroundMesh(){
        
    }
}

/*
 protocol AudioDrawable -> Concern with drawing the Audio graph information
 */
public protocol AudioDrawable: Drawable {
    
    func drawAudioGraph()
}

extension AudioDrawable {
    func drawAudioGraph(){
        
    }
}


