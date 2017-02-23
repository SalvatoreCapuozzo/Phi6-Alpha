//
//  PhisphereRed.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit

class PhisphereRed: SKSpriteNode, SimpleObject {
    var resizable: Bool = true
    var imgName: String = "PhiSphereRed.png"
    var simpleObjectName: String = "PhiSphereRed"
    var pausePosition: CGPoint!
    var shapeLayerV = CAShapeLayer()
    var shapeLayerA = CAShapeLayer()
    var beforeAfterVelocityDx: [String: CGFloat] = ["final": 0, "initial": 0]
    var beforeAfterVelocityDy: [String: CGFloat] = ["final": 0, "initial": 0]
    var phiSphereAccDx: CGFloat! = 0
    var phiSphereAccDy: CGFloat! = 0
    class func circle(location: CGPoint) -> PhisphereRed {
        let sprite = PhisphereRed(imageNamed: "PhiSphereRed.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "PhiSphereRed.png" // Devo verificare se questa riga è ridondante
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "PhiSphereRed.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.isDynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
            physics.mass = 10
        }
        return sprite
    }
}
