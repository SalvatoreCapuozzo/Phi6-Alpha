//
//  Laser.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 12/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Laser: Sensor {
    var resizable: Bool = true
    var imgName: String = "Rectangle.png"
    var orientation: String = "Any"
    var value: Float = 0
    var sensorName: String = "Laser"
    var left: LeftLaser
    var right: RightLaser
    var length: CGFloat = 100
    
    init(location: CGPoint) {
        left = LeftLaser.laser(location: CGPoint(x: location.x - self.length/2, y: location.y))
        right = RightLaser.laser(location: CGPoint(x: location.x + self.length/2, y: location.y))
        
        //super.init(texture: SKTexture(imageNamed: "Rectangle.png"), color: UIColor.clear, size: CGSize(width: self.length, height: 10))

        //self.name = "laser"
        //self.position = location
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
