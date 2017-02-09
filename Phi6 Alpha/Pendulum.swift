//
//  Ball.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 08/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit

class Pendulum: SKSpriteNode, SimpleObject {
    var resizable: Bool = true
    var imgName: String = "Circle.png"
    var simpleObjectName: String = "Circle"
    var length: CGFloat = 145
    class func circle(location: CGPoint) -> Pendulum {
        let sprite = Pendulum(imageNamed: "Circle.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "Circle.png" // Devo verificare se questa riga è ridondante
        sprite.name = "pendulum"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Circle.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.isDynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
}
