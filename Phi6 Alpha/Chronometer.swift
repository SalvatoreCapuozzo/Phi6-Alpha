//
//  Chronometer.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 28/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

class Chronometer : SKSpriteNode, Sensor {
    var resizable: Bool = false
    var imgName: String = "Chronometer.png"
    var orientation: String = "Any"
    var value: Float = 0
    var sensorName: String = "Chronometer"
    
    var activated: Bool = false
    var timer = Timer()
    
    class func chronometer(location: CGPoint) -> Chronometer {
        let sprite = Chronometer(imageNamed: "Chronometer.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: sprite.imgName), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = false;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func timerAction() {
        self.value += 0.1
        self.value = round(self.value * 10) / 10
    }

    func unset() {
        self.value = 0
    }
}
