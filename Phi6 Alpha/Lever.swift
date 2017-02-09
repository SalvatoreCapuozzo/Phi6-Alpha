//
//  LeverClass.swift
//  Phi6 Alpha CHE IN REALTA' E' LA FINAL, HURR DURR
//
//  Created by Gennaro Nappi on 09/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Lever: SKSpriteNode {
    var resizable: Bool = true
    var leverBeam: Beam
    var leverFulcrum: Fulcrum
    var joint: SKPhysicsJoint!
    
    init(location: CGPoint)
    {
        leverBeam = Beam.rectangle(location: location)
        leverFulcrum = Fulcrum.circle(location: location)
        
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 100, height: 10))
        
        self.name = "lever"
        self.position = location
        self.addChild(leverBeam)
        self.addChild(leverFulcrum)
    }
    
    func JoinLeverParts(scene: SKScene)
    {
        joint = SKPhysicsJointPin.joint(withBodyA: leverBeam.physicsBody!, bodyB: leverFulcrum.physicsBody!, anchor: leverBeam.position)
        scene.physicsWorld.add(joint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
