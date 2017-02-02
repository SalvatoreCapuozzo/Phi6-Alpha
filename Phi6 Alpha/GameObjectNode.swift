//
//  GameObjectNode.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 02/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

protocol GameObjectNode{
    
    //MARK: Attributes
    var weight: Int {get set}
    //    var height: Int {get set}
    //    var width: Int {get set}
    //    var image: UIImage {get set}
    
    //MARK: Methods
    func setObject(texture: SKTexture, xPosition: Double, yPosition: Double)
    func setObject(texture: SKTexture, position: CGPoint)
    func setWeight(weight: Int)
    //    func setHeight()
    //    func setWidth()
    //    func setImage()
    //    func action()
}
