//
//  Triangolo.swift
//  Phi6 Alpha
//
//  Created by Giuseppe Sannino on 26/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class Obstacle: SKSpriteNode, GameObjectNode{
    internal func setObject(texture: SKTexture, position: CGPoint) {
        
    }
    
    //identificativo per l'array di oggetti
    //var id: Int
    var weight: Int = 1
    
    init(imageNamed: String, xPosition: Double, yPosition: Double){
        let texture = SKTexture(imageNamed: imageNamed)
//        let texture = SKTexture(image: image)
        super.init(texture: texture, color: UIColor.red, size: texture.size())
        
        self.setObject(texture: texture, xPosition: xPosition, yPosition: yPosition)
    }
    
    init(imageNamed: String, scene: GameScene, xPosition: Double, yPosition: Double){
        let texture = SKTexture(imageNamed: imageNamed)
        //        let texture = SKTexture(image: image)
        super.init(texture: texture, color: UIColor.red, size: texture.size())
        
        self.setObjectInScene(texture: texture, scene: scene, xPosition: xPosition, yPosition: yPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setObject(texture: SKTexture, xPosition: Double, yPosition: Double) {
        self.xScale = 0.4
        self.yScale = 0.4
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = false
        self.name = "gameobject"
    }
    
    func setObjectInScene(texture: SKTexture, scene: GameScene, xPosition: Double, yPosition: Double) {
        self.xScale = 0.4
        self.yScale = 0.4
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = false
        self.name = "gameobject"
        
        let position = scene.convertPoint(fromView: CGPoint(x: xPosition, y: yPosition))
        self.position = position
    }
    
    internal func setWeight(weight: Int) {
        self.weight = weight
    }
}
