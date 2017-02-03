//
//  LaserRangefinder.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 28/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

class LaserRangefinder : SKSpriteNode, Sensor {
    var resizable: Bool = false
    var imgName: String = ""
    var orientation: String = ""
    var value: Float = 0
    var sensorName: String = "Laser Rangefinder"
    
    class func horizontal(location: CGPoint) -> LaserRangefinder {
        let sprite = LaserRangefinder(imageNamed: "LaserRangefinder(H).png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "LaserRangefinder(H).png"
        sprite.orientation = "Horizontal"
        
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
    
    class func vertical(location: CGPoint) -> LaserRangefinder {
        let sprite = LaserRangefinder(imageNamed: "LaserRangefinder(V).png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "LaserRangefinder(V).png"
        sprite.orientation = "Vertical"
        
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
    
    func unset() {
        self.value = 0
    }
    
}
