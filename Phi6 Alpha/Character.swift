//
//  Phisphere.swift
//  Phi6 Alpha
//
//  Created by Giuseppe Sannino on 01/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class Character: SKSpriteNode, GameObjectNode{
    
    var weight: Int = 1
    
    init(imageNamed: String, xPosition: Double, yPosition: Double){
        let texture = SKTexture(imageNamed: imageNamed)
//        let texture = SKTexture(image: image)
        super.init(texture: texture, color: UIColor.red, size: texture.size())
        self.setObject(texture: texture, xPosition: xPosition, yPosition: yPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setObject(texture: SKTexture, xPosition: Double, yPosition: Double) {
        self.xScale = 0.07
        self.yScale = self.xScale
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = true
        self.name = "gameobject"
        
        self.position = CGPoint(x: xPosition, y: yPosition)
    }
    
    internal func setObject(texture: SKTexture, position: CGPoint) {
        
    }
    
    internal func setWeight(weight: Int) {
        self.weight = weight
    }
    
}
