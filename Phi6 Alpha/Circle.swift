//
//  CircleNode-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//


import Foundation
import SpriteKit

class Circle: SKSpriteNode, SimpleObject {
    var resizable: Bool = true
    var imgName: String = "Circle.png"
    var simpleObjectName: String = "Circle"
    class func circle(location: CGPoint) -> Circle {
        let sprite = Circle(imageNamed: "Circle.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "Circle.png" // Devo verificare se questa riga è ridondante
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Circle.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
}

