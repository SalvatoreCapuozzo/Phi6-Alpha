//
//  LeverClass.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 08/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class LeverClass: SKSpriteNode {
    var resizable: Bool = true
    var leverBeam: LeverBeam
    var leverFulcrum: LeverFulcrum
    /*
    class func lever(location: CGPoint) -> [Lever] {
        let sprite = LeverBeam.lever(location: location)
        
        let sprite2 = LeverFulcrum.lever(location: location)
        
        return [sprite, sprite2]
    }
 */
    init(scene: SKScene, location: CGPoint) {
        leverBeam = LeverBeam(location: location)
        leverFulcrum = LeverFulcrum(location: location)
        super.init(texture: SKTexture(imageNamed: "Rectangle.png"), color: UIColor.clear, size: CGSize(width: 100, height: 10))
        self.name = "lever"
        self.position = location
        self.addChild(leverBeam)
        self.addChild(leverFulcrum)

       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
