//
//  TriangleNode-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

// WARNING: This class is deprecated
import Foundation
import SpriteKit

class Triangle: SKSpriteNode, SimpleObject {
    var resizable: Bool = true
    var imgName: String = "Triangle.png"
    var simpleObjectName: String = "Triangle"
    class func triangle(location: CGPoint) -> Triangle {
        let sprite = Triangle(imageNamed: "Triangle.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "Triangle.png" // Devo verificare se questa riga è ridondante
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Triangle.png"), size: sprite.size)
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

