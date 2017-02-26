//
//  TutorialFunctions.swift
//  Phi6 Alpha
//
//  Created by Gennaro Nappi on 23/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit
import SpriteKit

func Focus(view: viewTutorialInfo, obj: NSObject, text: String, offset: CGPoint)
{
    var pos = CGPoint(x: 0, y: 0)
    
    if let skNode = obj as? SKSpriteNode
    {
        let nodePos = skNode.position
        pos = CGPoint(x: nodePos.x + offset.x, y: nodePos.y + offset.y)
    }
    else if let button = obj as? UIButton
    {
        pos = button.frame.origin
    }
    // Focus effect
    
    // Show message in a view
    view.frame.origin = CGPoint(x: pos.x + 50, y: pos.y)//CGPoint(x: pos.x + offset.x + 50, y: pos.y + offset.y)
    view.isHidden = false
    view.textInfo.text = text
}

func Point(pointer: UIImageView, obj: NSObject, offset: CGPoint)
{
    var pos = CGPoint(x: 0, y: 0)
    
    if let skNode = obj as? SKSpriteNode
    {
        let nodePos = skNode.position
        pos = CGPoint(x: nodePos.x + offset.x, y: nodePos.y + offset.y)
    }
    else if let button = obj as? UIButton
    {
        pos = button.frame.origin
    }
    
    pointer.frame.origin = CGPoint(x: pos.x - pointer.frame.width / 2, y: pos.y + pointer.frame.height / 2 - 50)
    pointer.isHidden = false
    
}

// NOTA: Aggiungendo degli SKSpriteNode all'effectNode con effectNode.addChild() applicherà l'effetto su di essi
func CreateBlurEffectNode(position: CGPoint, blurAmount: CGFloat) -> SKEffectNode
{
    // Creo l'effetto Blur
    let blur = CIFilter(name: "CIGaussianBlur")
    blur?.setValue(blurAmount, forKey: kCIInputRadiusKey)
    // Lo assegno ad un effect node
    let effectNode = SKEffectNode()
    effectNode.filter = blur
    effectNode.position = position
    effectNode.blendMode = .alpha
    
    return effectNode
}

func Search(name: String) -> Bool
{
    for obj in Singleton.shared.objects
    {
        if name == obj.name!
        {
            return true
        }
    }
    
    return false
}
