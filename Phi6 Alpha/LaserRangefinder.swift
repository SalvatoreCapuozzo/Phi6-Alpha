//
//  LaserRangefinder.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 28/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

class LaserRangefinder : SKSpriteNode, Sensor {
    var resizable: Bool = false
    var imgName: String = ""
    var orientation: String = ""
    var value: Float = 0
    var sensorName: String = "Laser Rangefinder"
    
    class func horizontal(location: CGPoint) -> LaserRangefinder {
        let sprite = LaserRangefinder(imageNamed: "LaserRangefinder(H).png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "LaserRangefinder(H).png"
        sprite.orientation = "Horizontal"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: sprite.imgName), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = false;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
    
    class func vertical(location: CGPoint) -> LaserRangefinder {
        let sprite = LaserRangefinder(imageNamed: "LaserRangefinder(V).png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "LaserRangefinder(V).png"
        sprite.orientation = "Vertical"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: sprite.imgName), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = false;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
    
    func laser(scene: GameScene) {
        if self.orientation == "Horizontal" {
            let startL = CGPoint(x: self.position.x - self.size.width/2 - 1 + (scene.frame.size.width / 2), y: -self.position.y + (scene.frame.size.height / 2) + 10)
            
            let endL = CGPoint(x: self.position.x - self.size.width/2 - 1 + (scene.frame.size.width / 2) - 1000, y: -self.position.y + (scene.frame.size.height / 2) + 10)
            
            let pathL = UIBezierPath.arrow(from: startL, to: endL,
                                           tailWidth: 2.0, headWidth: 5.0, headLength: 5.0)
            
            let startR = CGPoint(x: self.position.x + self.size.width/2 + 1 + (scene.frame.size.width / 2), y: -self.position.y + (scene.frame.size.height / 2) + 10)
            
            let endR = CGPoint(x: self.position.x + self.size.width/2 + 1 + (scene.frame.size.width / 2) + 1000, y: -self.position.y + (scene.frame.size.height / 2) + 10)
            
            let pathR = UIBezierPath.arrow(from: startR, to: endR,
                                           tailWidth: 2.0, headWidth: 5.0, headLength: 5.0)
            /*
            scene.shapeLayerL.path = pathL.cgPath
            scene.shapeLayerL.strokeColor = UIColor.red.cgColor
            scene.shapeLayerL.lineWidth = 2.0
            
            scene.shapeLayerR.path = pathR.cgPath
            scene.shapeLayerR.strokeColor = UIColor.red.cgColor
            scene.shapeLayerR.lineWidth = 2.0
            
            scene.view?.layer.addSublayer(scene.shapeLayerL)
            scene.view?.layer.addSublayer(scene.shapeLayerR)
 */
        }
    }
    
    func setDistance(scene: GameScene) {
        if self.orientation == "Horizontal" {
            self.value = abs(Float(scene.phisphere.position.x) - Float(self.position.x))
        } else if self.orientation == "Vertical" {
            self.value = abs(Float(scene.phisphere.position.y) - Float(self.position.y))
        }
    }
    
    func unset() {
        self.value = 0
    }
    
}
