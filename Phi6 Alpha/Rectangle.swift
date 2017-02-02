//
//  RectangleNode-Alpha.swift
//  Phi6
//
//  Created by Lord Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//


import Foundation
import SpriteKit

class Rectangle: SKSpriteNode, SimpleObject {
    var resizable: Bool = true
    var imgName: String = "Rectangle.png"
    var simpleObjectName: String = "Rectangle"
    class func rectangle(location: CGPoint) -> Rectangle {
        let sprite = Rectangle(imageNamed: "Rectangle.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "Rectangle.png" // Devo verificare se questa riga è ridondante
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Rectangle.png"), size: sprite.size)
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

