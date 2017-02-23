//
//  Beam.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 08/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit

class Beam: SKSpriteNode, SimpleObject {
    var resizable: Bool = true
    var imgName: String = "Rectangle.png"
    var simpleObjectName: String = "Rectangle"
    class func rectangle(location: CGPoint) -> Beam {
        let sprite = Beam(imageNamed: "Rectangle.png")
        
        sprite.xScale = 0.75
        sprite.yScale = 0.05
        sprite.position = location
        sprite.imgName = "Rectangle.png" // Devo verificare se questa riga è ridondante
        sprite.name = "beam"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Rectangle.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
            physics.restitution = 0
        }
        return sprite
    }
}
