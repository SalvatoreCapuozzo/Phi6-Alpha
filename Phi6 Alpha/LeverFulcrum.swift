//
//  LeverFulcrum.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 07/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class LeverFulcrum: SKSpriteNode{
    var resizable: Bool = false
    
    init(location: CGPoint) {
        super.init(texture: SKTexture(imageNamed: "Oval 5.png"), color: UIColor.clear, size: CGSize(width: 10, height: 10))
        //self.position = location
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Oval 5.png"), size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.linearDamping = 0.75
        self.physicsBody?.angularDamping = 0.75
        
        self.physicsBody?.collisionBitMask = 3
        self.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        //self.zPosition = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
