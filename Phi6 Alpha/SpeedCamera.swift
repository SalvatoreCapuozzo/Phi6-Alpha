//
//  SpeedCamera.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 28/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

class SpeedCamera : SKSpriteNode, Sensor {
    var resizable: Bool = false
    var imgName: String = "SpeedCamera.png"
    var orientation: String = "Any"
    var value: Float = 0
    var sensorName: String = "Speed Camera"
    
    class func speedCamera(location: CGPoint) -> SpeedCamera {
        let sprite = SpeedCamera(imageNamed: "SpeedCamera.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        
        //sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: sprite.imgName), size: sprite.size)
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: 2)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = false;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
    
    func setSpeedCameraValue(_ value: CGFloat) {
        if self.value == 0 {
            self.value = Float(value)
        }
    }
    
    func unset() {
        self.value = 0
    }
}
