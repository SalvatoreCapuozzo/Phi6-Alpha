//
//  RightLaser.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 12/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class RightLaser: SKSpriteNode {
    class func laser(location: CGPoint) -> RightLaser {
        let sprite = RightLaser(imageNamed: "LaserRight.png")
        
        sprite.position = location
        //sprite.imgName = "LaserLeft.png" // Devo verificare se questa riga è ridondante
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        sprite.name = "laserRight"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "LaserRight.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.isDynamic = false
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
        
    }
}
