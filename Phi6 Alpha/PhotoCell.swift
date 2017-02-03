//
//  PhotoCell.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 28/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

class PhotoCell : SKSpriteNode, Sensor {
    var resizable: Bool = false
    var imgName: String = "PhotoCellDefault.png"
    var orientation: String = "Any"
    var value: Float = 0
    var sensorName: String = "PhotoCell"
    
    class func photoCell(location: CGPoint) -> PhotoCell {
        let sprite = PhotoCell(imageNamed: "PhotoCellDefault.png")
        
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
    
    func setPCValue(_ value: Float) {
        switch value {
        case 0:
            self.value = 0
            self.imgName = "PhotoCellDefault.png"
            self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: self.imgName), size: self.size)
        case 1:
            self.value = 1
            self.imgName = "PhotoCellActivated.png"
            self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: self.imgName), size: self.size)
        default:
            print("Value not valid")
        }
    }
    
}
