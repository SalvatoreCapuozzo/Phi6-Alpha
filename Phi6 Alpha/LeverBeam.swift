//
//  LeverBeam.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 07/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class LeverBeam: SKSpriteNode {
    var resizable: Bool = true
    
    init(location: CGPoint) {
        
        super.init(texture: SKTexture(imageNamed: "Rectangle.png"), color: UIColor.clear, size: CGSize(width: 100, height: 10))
        //self.position = location
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.isDynamic = true
        self.physicsBody?.linearDamping = 0.75
        self.physicsBody?.angularDamping = 0.75
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.physicsBody?.categoryBitMask = 4
        self.physicsBody?.collisionBitMask = PhysicsCategory.Phisphere
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
