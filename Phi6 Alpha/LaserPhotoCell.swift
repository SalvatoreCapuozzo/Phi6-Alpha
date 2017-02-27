//
//  LaserPhotoCell.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 21/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit

class LaserPhotoCell : SKSpriteNode, Sensor {
    var resizable: Bool = false
    var imgName: String = "LaserPhotoCell.png"
    var orientation: String = "Any"
    var value: Float = 0
    var sensorName: String = "LaserPhotoCell"
    var chronometer: Bool = false
    
    class func laserPhotoCell(location: CGPoint) -> LaserPhotoCell {
        let sprite = LaserPhotoCell(imageNamed: "LaserPhotoCell.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: sprite.imgName), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = false;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
            
            physics.categoryBitMask = 1
            physics.collisionBitMask = 0
            physics.contactTestBitMask = 1
        }
        
        
        return sprite
    }
    
    func setLaserPhotoCellValue() {
        self.value = 1
        self.imgName = "LaserPhotoCellActivated.png"
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: self.imgName), size: self.size)
        self.physicsBody?.collisionBitMask = 1
        self.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        self.texture = SKTexture(imageNamed: "LaserPhotoCellActivated")
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
    }
    
    func unset() {
        self.value = 0
        self.imgName = "LaserPhotoCell.png"
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: self.imgName), size: self.size)
        //self.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -self.size.width/2, y: -self.size.height/2 + 48, width: self.size.width, height: self.size.height/10))
        self.physicsBody?.collisionBitMask = 1
        self.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        self.texture = SKTexture(imageNamed: "LaserPhotoCell")
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
    }
    
}
