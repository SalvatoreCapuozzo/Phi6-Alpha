//
//  Adder.swift
//  Phi6 Alpha
//
//  Created by Giuseppe Sannino on 06/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Adder{

func addPhotoCell(scene: GameScene) {
    let sprite = PhotoCell.photoCell(location: CGPoint(x: scene.frame.maxX/2, y: scene.frame.maxY/2))
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.isDynamic = false
    
    sprite.physicsBody?.collisionBitMask = 0
    sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
    sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
    
    sprite.size.width = scene.objectWidth
    sprite.size.height = scene.objectHeight
    sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -scene.objectWidth/2, y: -scene.objectHeight/2, width: scene.objectWidth, height: scene.objectHeight))
    print(sprite.xScale)
    Singleton.shared.addNewObject(anObject: sprite)
    scene.addChild(sprite)
    scene.arrayOfSensors.append(sprite)
    
    if sprite.name == nil {
        sprite.name = "sensor"// + String(number)
    }
    
    print(sprite.name!)
}

    func addSpeedCamera(scene: GameScene) {
    let sprite = SpeedCamera.speedCamera(location: CGPoint(x: scene.frame.maxX/2, y: scene.frame.maxY/2))
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.isDynamic = false
    
    sprite.physicsBody?.collisionBitMask = 0
    sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
    sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
    
    sprite.size.width = scene.objectWidth
    sprite.size.height = scene.objectHeight
    sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -scene.objectWidth/2, y: -scene.objectHeight/2, width: scene.objectWidth, height: scene.objectHeight))
    print(sprite.xScale)
    Singleton.shared.addNewObject(anObject: sprite)
    scene.addChild(sprite)
    scene.arrayOfSensors.append(sprite)
    
    if sprite.name == nil {
        sprite.name = "speedCamera"// + String(number)
    }
    print(sprite.name!)
}

    func addLoadCell(scene: GameScene) {
    let sprite = LoadCell.loadCell(location: CGPoint(x: scene.frame.maxX/2, y: scene.frame.maxY/2))
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.isDynamic = false
    
    sprite.physicsBody?.collisionBitMask = 0
    sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
    sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
    
    sprite.size.width = scene.objectWidth
    sprite.size.height = scene.objectHeight
    sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -scene.objectWidth/2, y: -scene.objectHeight/2, width: scene.objectWidth, height: scene.objectHeight/2 + 1))
    print(sprite.xScale)
    Singleton.shared.addNewObject(anObject: sprite)
    scene.addChild(sprite)
    scene.arrayOfSensors.append(sprite)
    
    if sprite.name == nil {
        sprite.name = "loadCell"// + String(number)
    }
    print(sprite.name!)
}

    func addRectangle(scene: GameScene) {
    let sprite = Rectangle.rectangle(location: CGPoint(x: scene.frame.maxX/2, y: scene.frame.maxY/2))
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.isDynamic = false
    sprite.physicsBody?.usesPreciseCollisionDetection = true
    
    sprite.size.width = scene.objectWidth
    sprite.size.height = scene.objectHeight
    sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -scene.objectWidth/2, y: -scene.objectHeight/2, width: scene.objectWidth, height: scene.objectHeight))
    print(sprite.xScale)
    Singleton.shared.addNewObject(anObject: sprite)
    scene.addChild(sprite)
    
    if sprite.name == nil {
        sprite.name = "object"// + String(number)
    }
    print(sprite.name!)
}

func addCircle(scene: GameScene) {
    let sprite = Circle.circle(location: CGPoint(x: scene.frame.maxX/2, y: scene.frame.maxY/2))
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.isDynamic = false
    sprite.physicsBody?.usesPreciseCollisionDetection = true
    
    sprite.size.width = scene.objectWidth
    sprite.size.height = scene.objectWidth
    sprite.physicsBody = SKPhysicsBody(circleOfRadius: scene.objectWidth/2)
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.isDynamic = false
    Singleton.shared.addNewObject(anObject: sprite)
    scene.addChild(sprite)
    
    if sprite.name == nil {
        sprite.name = "objectCircle" //+ String(number)
    }
    print(sprite.name!)
}

func addInitSlider(scene: GameScene) {
    scene.deleteSliders()
    // Set Velocity Text Field
    scene.labelInitV = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelInitV.layer.position = CGPoint(x: scene.phisphere.position.x + (scene.frame.size.width / 2) + 140, y: -scene.phisphere.position.y + (scene.frame.size.height / 2) + 25)
    scene.labelInitV.textColor! = UIColor.black
    scene.labelInitV?.text = String(describing: round((scene.phisphere.physicsBody?.velocity.dx)!*10)/10)
    if scene.labelInitV.text != nil {
        scene.labelInitV.text! = String(describing: round((scene.phisphere.physicsBody?.velocity.dx)!*10)/10)
    }
    
    scene.sliderInitV = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.sliderInitV?.layer.position = CGPoint(x: scene.phisphere.position.x + (scene.frame.size.width / 2) + 100, y: -scene.phisphere.position.y + (scene.frame.size.height / 2))
    scene.sliderInitV?.backgroundColor = UIColor.clear
    scene.sliderInitV?.tintColor = UIColor.green
    scene.sliderInitV?.layer.cornerRadius = 15.0
    scene.sliderInitV?.layer.shadowOpacity = 0.5
    scene.sliderInitV?.layer.masksToBounds = false
    scene.sliderInitV?.maximumValue = 326
    scene.sliderInitV?.minimumValue = -326
    scene.sliderInitV?.value = Float((scene.phisphere.physicsBody?.velocity.dx)!)
    
    scene.sliderInitV.addTarget(scene, action: #selector(scene.setInitialV), for: UIControlEvents.valueChanged)
    
    scene.arrayOfSliderInitV.append(scene.sliderInitV)
    scene.view?.addSubview(scene.sliderInitV)
    scene.arrayOfLabelInitV.append(scene.labelInitV)
    scene.view?.addSubview(scene.labelInitV)
    
}

func addSlider(node: SKSpriteNode, scene: GameScene) {
    scene.myNode = nil
    scene.deleteSliders()
    
    // Set Width Slider
    scene.mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    scene.mySlider?.layer.position = CGPoint(x: (scene.view?.frame.width)!/4 - ((scene.mySlider?.frame.width)!/8) , y: (scene.view?.frame.height)!-45)
    scene.mySlider?.backgroundColor = UIColor.clear
    scene.mySlider?.layer.cornerRadius = 15.0
    scene.mySlider?.layer.shadowOpacity = 0.5
    scene.mySlider?.layer.masksToBounds = false
    scene.mySlider?.maximumValue = 326
    scene.mySlider?.minimumValue = 0.2
    scene.mySlider?.value = Float(node.size.width)
    
    // Set Height Slider
    scene.sliderHeight = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    scene.sliderHeight?.layer.position = CGPoint(x: (scene.view?.frame.width)!/4 - ((scene.mySlider?.frame.width)!/8) , y: (scene.view?.frame.height)!-15)
    scene.sliderHeight?.backgroundColor = UIColor.clear
    scene.sliderHeight?.layer.cornerRadius = 15.0
    scene.sliderHeight?.layer.shadowOpacity = 0.5
    scene.sliderHeight?.layer.masksToBounds = false
    scene.sliderHeight?.maximumValue = 326
    scene.sliderHeight?.minimumValue = 0.2
    scene.sliderHeight?.value = Float(node.size.height)
    
    // Set Rotation Slider
    scene.sliderRotationLine = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    scene.sliderRotationLine?.layer.position = CGPoint(x: (scene.view?.frame.width)!/2 + ((scene.mySlider?.frame.width)!/2) , y: (scene.view?.frame.height)!-15)
    scene.sliderRotationLine?.backgroundColor = UIColor.clear
    scene.sliderRotationLine?.layer.cornerRadius = 15.0
    scene.sliderRotationLine?.layer.shadowOpacity = 0.5
    scene.sliderRotationLine?.layer.masksToBounds = false
    scene.sliderRotationLine?.maximumValue = 360
    scene.sliderRotationLine?.minimumValue = 0
    scene.sliderRotationLine?.value = Float(node.zRotation)
    
    // Set Width Label
    scene.myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.myLabel.layer.position = CGPoint(x: (scene.view?.frame.width)!/4 + ((scene.mySlider?.frame.width)!/1.2), y: (scene.view?.frame.height)!-45)
    scene.myLabel.textColor! = UIColor.black
    scene.myLabel?.text = String(describing: (round((scene.mySlider.value/163)*100)/100)) + " m"
    if scene.myLabel.text != nil {
        scene.myLabel.text! = String(describing: (round((scene.mySlider.value/163)*100)/100)) + " m"
    }
    
    // Set Height Label
    scene.labelHeight = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelHeight.layer.position = CGPoint(x: (scene.view?.frame.width)!/4 + ((scene.mySlider?.frame.width)!/1.2), y: (scene.view?.frame.height)!-15)
    scene.labelHeight.textColor! = UIColor.black
    scene.labelHeight?.text = String(describing: (round((scene.sliderHeight.value/163)*100)/100)) + " m"
    if scene.labelHeight.text != nil {
        scene.labelHeight.text! = String(describing: (round((scene.sliderHeight.value/163)*100)/100)) + " m"
    }
    
    // Set Rotation Label
    scene.labelRotation = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelRotation.layer.position = CGPoint(x: (scene.view?.frame.width)!/2 + ((scene.mySlider?.frame.width)!*1.5), y: (scene.view?.frame.height)!-15)
    scene.labelRotation.textColor! = UIColor.black
    scene.labelRotation?.text = String(describing: round(scene.sliderRotationLine.value*10)/10) + "°"
    if scene.labelRotation.text != nil {
        scene.labelRotation.text! = String(describing: round(scene.sliderRotationLine.value*10)/10) + "°"
    }
    
    if(node.name == "phisphere"){
        scene.mySlider?.addTarget(scene, action: #selector(scene.setDiameter2), for: UIControlEvents.valueChanged)
    }
    else if(node.name == "triangle") || (node.name == "block") {
        scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
        scene.sliderHeight?.addTarget(scene, action: #selector(scene.setHeight2), for: UIControlEvents.valueChanged)
        //sliderRotation?.addTarget(scene, action: #selector(setRotation), for: UIControlEvents.valueChanged)
    } else if (node.name == "object") {
        scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
        scene.sliderHeight?.addTarget(scene, action: #selector(scene.setHeight2), for: UIControlEvents.valueChanged)
        //sliderRotation?.addTarget(scene, action: #selector(setRotation), for: UIControlEvents.valueChanged)
        //sliderRotation?.target(forAction: #selector(setRotation), withSender: scene)
        scene.sliderRotationLine?.addTarget(scene, action: #selector(scene.setRotation), for: UIControlEvents.valueChanged)
    } else if (node.name == "objectCircle") {
        scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
    }
    
    scene.arrayOfSlider.append(scene.mySlider!)
    scene.view?.addSubview(scene.mySlider!)
    scene.arrayOfSliderHeight.append(scene.sliderHeight!)
    scene.view?.addSubview(scene.sliderHeight!)
    scene.arrayOfSliderRotationLine.append(scene.sliderRotationLine!)
    scene.view?.addSubview(scene.sliderRotationLine!)
    scene.arrayOfLabel.append(scene.myLabel!)
    scene.view?.addSubview(scene.myLabel!)
    scene.arrayOfLabelHeight.append(scene.labelHeight!)
    scene.view?.addSubview(scene.labelHeight!)
    scene.arrayOfLabelRotation.append(scene.labelRotation!)
    scene.view?.addSubview(scene.labelRotation!)
}

}
