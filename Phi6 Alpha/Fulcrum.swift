//
//  Fulcrum.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 08/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit

class Fulcrum: SKSpriteNode, SimpleObject {
    var resizable: Bool = true
    var imgName: String = "Fulcrum.png"
    var simpleObjectName: String = "Circle"
    class func circle(location: CGPoint) -> Fulcrum {
        let sprite = Fulcrum(imageNamed: "Fulcrum.png")
        
        sprite.position = location
        sprite.imgName = "Fulcrum.png" // Devo verificare se questa riga è ridondante
        sprite.zPosition = 2
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        sprite.name = "fulcrum"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Fulcrum.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = true
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
}
