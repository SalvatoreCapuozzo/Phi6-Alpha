//
//  TutorialFunctions.swift
//  Phi6 Alpha
//
//  Created by Gennaro Nappi on 23/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit
import SpriteKit
import iOSContextualMenu
import SwiftyGif

func Tap(view: viewTutorialInfo, obj: NSObject, text: String, offset: CGPoint)
{
    var pos = CGPoint(x: 0, y: 0)
    
    if let skNode = obj as? SKSpriteNode
    {
        let nodePos = skNode.position
        pos = CGPoint(x: nodePos.x + offset.x, y: -nodePos.y + offset.y)
    }
    else if let button = obj as? UIButton
    {
        pos = button.frame.origin
    }
    // Focus effect
    
    // Show message in a view
    //view.frame.origin = CGPoint(x: pos.x + 50, y: pos.y)//CGPoint(x: pos.x + offset.x + 50, y: pos.y + offset.y)
    view.isHidden = false
    view.textInfo.text = text
}

func Focus(view: viewTutorialInfo, obj: NSObject, text: String, offset: CGPoint, scene: BaseTutorialScene)
{
    var pos = CGPoint(x: 0, y: 0)
    
    if let skNode = obj as? SKSpriteNode
    {
        let nodePos = skNode.position
        pos = CGPoint(x: nodePos.x + offset.x, y: -nodePos.y + offset.y)
        var sel = UIImage(named: "Selector")!
        //sel.size.width = skNode.size.width
        //sel.size.height = skNode.size.height
        var selView = UIImageView(image: sel)
        selView.frame.size.width = skNode.size.width + 20
        selView.frame.size.height = skNode.size.height + 20
        selView.tag = 101
        //selView.sizeThatFits(CGSize(width: skNode.size.width, height: skNode.size.height))
        selView.layer.position = CGPoint(x: nodePos.x + scene.frame.size.width/2, y: -nodePos.y + scene.frame.size.height/2)
        scene.view?.addSubview(selView)
        //scene.addSubview(selView)
    }
    else if let button = obj as? UIButton
    {
        pos = button.frame.origin
    }
    // Focus effect
    
    // Show message in a view
    //view.frame.origin = CGPoint(x: pos.x + 50, y: pos.y)//CGPoint(x: pos.x + offset.x + 50, y: pos.y + offset.y)
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
    pointer.layer.zPosition = 2
    pointer.isHidden = false
    
}

func Point(pointer: UIImageView, offset: CGPoint, scene: BaseTutorialScene)
{
    
    pointer.layer.position = CGPoint(x: offset.x + pointer.frame.width / 2 + 30, y: offset.y + pointer.frame.height / 2)
    pointer.layer.zPosition = 2
    pointer.isHidden = false
    
}

func Tap(pointer: UIImageView, pointerTap: UIImageView, offset: CGPoint, scene: BaseTutorialScene)
{
    var pos = CGPoint(x: 0, y: 0)
    pointerTap.layer.position = pointer.layer.position
    pointerTap.layer.zPosition = 2
    pointerTap.isHidden = false
    
}

func Hold(pointer: UIImageView, pointerHold: UIImageView, offset: CGPoint, scene: BaseTutorialScene)
{
    var pos = CGPoint(x: 0, y: 0)
    pointerHold.layer.position = pointer.layer.position
    let gifManager = SwiftyGifManager(memoryLimit:20)
    let contMenu = UIImage(gifName: "ContextualMenu")
    let contMenuView = UIImageView(gifImage: contMenu, manager: gifManager)
    contMenuView.frame.size.width = 200
    contMenuView.frame.size.height = 200
    contMenuView.layer.zPosition = 0
    contMenuView.tag = 100 // Numero a caso
    contMenuView.setGifImage(contMenu, loopCount: 1)
    contMenuView.layer.position = CGPoint(x: pointerHold.layer.position.x - 7, y: pointerHold.layer.position.y - 35)
    scene.view?.addSubview(contMenuView)
    pointerHold.layer.zPosition = 2
    pointerHold.isHidden = false
    
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

func Rotate(name: String) -> Bool
{
    for obj in Singleton.shared.objects
    {
        if name == obj.name! && obj.zRotation != 0
        {
            return true
        }
    }
    
    return false
}

func Activate(name: String) -> Bool
{
    for obj in Singleton.shared.objects
    {
        if name == obj.name!
        {
            let sensor = obj as! Sensor
            if sensor.value != 0 {
                return true
            }
        }
    }
    
    return false
}
