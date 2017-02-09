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
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
        let sprite = PhotoCell.photoCell(location: position)
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
        //addChronometer(scene: scene, sensor: sprite)
    
        print(sprite.name!)
    }

    func addSpeedCamera(scene: GameScene) {
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
        let sprite = SpeedCamera.speedCamera(location: position)
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
    
        sprite.physicsBody?.collisionBitMask = 1
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
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
    let sprite = LoadCell.loadCell(location: position)
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
    
    func addChronometer(scene: GameScene) {
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
        let sprite = Chronometer.chronometer(location: position)
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        
        sprite.physicsBody?.collisionBitMask = 0
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        
        sprite.size.width = scene.objectWidth
        sprite.size.height = scene.objectHeight
        sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -scene.objectWidth/2, y: -scene.objectHeight/2, width: scene.objectWidth, height: scene.objectHeight/2))
        print(sprite.xScale)
        Singleton.shared.addNewObject(anObject: sprite)
        scene.addChild(sprite)
        scene.arrayOfSensors.append(sprite)
        
        if sprite.name == nil {
            sprite.name = "chronometer"// + String(number)
        }
        /*
         let fixedPosition = (location: CGPoint(x: scene.frame.maxX/2, y: scene.frame.maxY/2))
         let fixedJoint = SKPhysicsJointFixed.joint(withBodyA: sensor.physicsBody!, bodyB: sprite.physicsBody!, anchor: fixedPosition)
         scene.physicsWorld.add(fixedJoint)
         */
        print(sprite.name!)
    }
    
    func addLaserAccelerometer(scene: GameScene) {
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
        let sprite = LaserAccelerometer.vertical(location: position)
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
            sprite.name = "laserAccelerometer"// + String(number)
        }
        print(sprite.name!)
    }
    
    func addLaserRangefinder(scene: GameScene) {
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
        let sprite = LaserRangefinder.horizontal(location: position)
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
            sprite.name = "laserRangefinder"// + String(number)
        }
        print(sprite.name!)
    }
    
    func addLever(scene: GameScene) {
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
        let circle = Fulcrum.circle(location: position)
        circle.physicsBody?.isDynamic = false
        
        let rectangle = Beam.rectangle(location: position)
        Singleton.shared.addNewObject(anObject: circle)
        scene.addChild(circle)
        
        Singleton.shared.addNewObject(anObject: rectangle)
        scene.addChild(rectangle)
        
        let jointLever = SKPhysicsJointPin.joint(withBodyA: rectangle.physicsBody!, bodyB: circle.physicsBody!, anchor: rectangle.position)
        scene.physicsWorld.add(jointLever)
    }
    
    func addPendulum(scene: GameScene) {
        scene.deleteSliders()
        let position = Singleton.shared.getPosition()
        let circle = Pendulum.circle(location: position)
        circle.physicsBody?.isDynamic = true
        circle.physicsBody?.affectedByGravity = true
        
        Singleton.shared.addNewObject(anObject: circle)
        scene.addChild(circle)
        /*
        let fulcrum = Fulcrum.circle(location: CGPoint(x: 0, y: circle.length))
        fulcrum.physicsBody?.isDynamic = false
        fulcrum.name! = "pendulumFulcrum"
        
        Singleton.shared.addNewObject(anObject: fulcrum)
        scene.addChild(fulcrum)
*/
        let startRope = CGPoint(x: circle.position.x + scene.frame.maxX, y: -circle.position.y + scene.frame.maxY /*- circle.size.height/2*/)
        let endRope = CGPoint(x: circle.position.x + scene.frame.maxX, y: -circle.position.y + scene.frame.maxY - 145)
        let pathRope = UIBezierPath.arrow(from: startRope, to: endRope,
                                          tailWidth: 0.5, headWidth: 0.5, headLength: 5.0)
        scene.pendulumFulcrum = endRope
        scene.shapeLayerRope.path = pathRope.cgPath
        scene.shapeLayerRope.strokeColor = UIColor(colorLiteralRed: 103/255, green: 165/255, blue: 242/255, alpha: 1).cgColor
        scene.shapeLayerRope.lineWidth = 0.5
        scene.view?.layer.addSublayer(scene.shapeLayerRope)
        
        let jointPendulum = SKPhysicsJointLimit.joint(withBodyA: circle.physicsBody!, bodyB: scene.physicsBody!, anchorA: circle.position, anchorB: CGPoint(x: circle.position.x, y: circle.position.y + circle.length))
        scene.physicsWorld.add(jointPendulum)
    }

    func addRectangle(scene: GameScene) {
        let position = Singleton.shared.getPosition()
    let sprite = Rectangle.rectangle(location: position)
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
    let position = Singleton.shared.getPosition()
    let sprite = Circle.circle(location: position)
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
    scene.sliderInitV?.maximumValue = 725
    scene.sliderInitV?.minimumValue = -725
    scene.sliderInitV?.value = Float((scene.phisphere.physicsBody?.velocity.dx)!)
    
    scene.sliderInitV.addTarget(scene, action: #selector(scene.setInitialV), for: UIControlEvents.valueChanged)
    
    scene.arrayOfSliderInitV.append(scene.sliderInitV)
    scene.view?.addSubview(scene.sliderInitV)
    scene.arrayOfLabelInitV.append(scene.labelInitV)
    scene.view?.addSubview(scene.labelInitV)
    
    // Set Acceleration Text Field
    scene.labelInitA = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelInitA.layer.position = CGPoint(x: scene.phisphere.position.x + (scene.frame.size.width / 2) + 140, y: -scene.phisphere.position.y + (scene.frame.size.height / 2) + 75)
    scene.labelInitA.textColor! = UIColor.black
    scene.labelInitA?.text = String(describing: round((scene.phisphereAccDx)*10)/10)
    if scene.labelInitA.text != nil {
        scene.labelInitA.text! = String(describing: round((scene.phisphereAccDx)*10)/10)
    }

    scene.sliderInitA = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.sliderInitA?.layer.position = CGPoint(x: scene.phisphere.position.x + (scene.frame.size.width / 2) + 100, y: -scene.phisphere.position.y + (scene.frame.size.height / 2) + 50)
    scene.sliderInitA?.backgroundColor = UIColor.clear
    scene.sliderInitA?.tintColor = UIColor.red
    scene.sliderInitA?.layer.cornerRadius = 15.0
    scene.sliderInitA?.layer.shadowOpacity = 0.5
    scene.sliderInitA?.layer.masksToBounds = false
    scene.sliderInitA?.maximumValue = 725
    scene.sliderInitA?.minimumValue = -725
    scene.sliderInitA?.value = Float((scene.phisphereAccDx))
    
    scene.sliderInitA.addTarget(scene, action: #selector(scene.setInitialA), for: UIControlEvents.valueChanged)
    
    scene.arrayOfSliderInitA.append(scene.sliderInitA)
    scene.view?.addSubview(scene.sliderInitA)
    scene.arrayOfLabelInitA.append(scene.labelInitA)
    scene.view?.addSubview(scene.labelInitA)
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
    scene.mySlider?.maximumValue = 290
    scene.mySlider?.minimumValue = 0.2
    if node.name! == "pendulum" {
        let pendulum = node as? Pendulum
        scene.mySlider?.value = Float((pendulum?.length)!)
    } else {
        scene.mySlider?.value = Float(node.size.width)
    }
    
    // Set Height Slider
    scene.sliderHeight = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    scene.sliderHeight?.layer.position = CGPoint(x: (scene.view?.frame.width)!/4 - ((scene.mySlider?.frame.width)!/8) , y: (scene.view?.frame.height)!-15)
    scene.sliderHeight?.backgroundColor = UIColor.clear
    scene.sliderHeight?.layer.cornerRadius = 15.0
    scene.sliderHeight?.layer.shadowOpacity = 0.5
    scene.sliderHeight?.layer.masksToBounds = false
    scene.sliderHeight?.maximumValue = 290
    scene.sliderHeight?.minimumValue = 0.2
    scene.sliderHeight?.value = Float(node.size.height)
    
    // Set Rotation Slider
    scene.sliderRotationLine = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    scene.sliderRotationLine?.layer.position = CGPoint(x: (scene.view?.frame.width)!/2 + ((scene.mySlider?.frame.width)!/2) , y: (scene.view?.frame.height)!-15)
    scene.sliderRotationLine?.backgroundColor = UIColor.clear
    scene.sliderRotationLine?.layer.cornerRadius = 15.0
    scene.sliderRotationLine?.layer.shadowOpacity = 0.5
    scene.sliderRotationLine?.layer.masksToBounds = false
    scene.sliderRotationLine?.maximumValue = 180
    scene.sliderRotationLine?.minimumValue = -180
    scene.sliderRotationLine?.value = Float(node.zRotation)
    
    // Set Friction Slider
    scene.sliderFriction = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    scene.sliderFriction?.layer.position = CGPoint(x: (scene.view?.frame.width)!/2 + ((scene.mySlider?.frame.width)!/2) , y: (scene.view?.frame.height)!-45)
    scene.sliderFriction?.backgroundColor = UIColor.clear
    scene.sliderFriction?.layer.cornerRadius = 15.0
    scene.sliderFriction?.layer.shadowOpacity = 0.5
    scene.sliderFriction?.layer.masksToBounds = false
    scene.sliderFriction?.maximumValue = 290
    scene.sliderFriction?.minimumValue = 0
    scene.sliderFriction?.value = Float((node.physicsBody?.friction)!)

    
    // Set Width Label
    scene.myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.myLabel.layer.position = CGPoint(x: (scene.view?.frame.width)!/4 + ((scene.mySlider?.frame.width)!/1.2), y: (scene.view?.frame.height)!-45)
    scene.myLabel.textColor! = UIColor.black
    if node.name! == "beam" {
        scene.myLabel?.text = String(describing: (round((scene.mySlider.value/(145*2))*100)/100)) + " x 2 m"
    } else {
        scene.myLabel?.text = String(describing: (round((scene.mySlider.value/145)*100)/100)) + " m"
        if scene.myLabel.text != nil {
            scene.myLabel.text! = String(describing: (round((scene.mySlider.value/145)*100)/100)) + " m"
        }
    }
    
    // Set Height Label
    scene.labelHeight = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelHeight.layer.position = CGPoint(x: (scene.view?.frame.width)!/4 + ((scene.mySlider?.frame.width)!/1.2), y: (scene.view?.frame.height)!-15)
    scene.labelHeight.textColor! = UIColor.black
    scene.labelHeight?.text = String(describing: (round((scene.sliderHeight.value/145)*100)/100)) + " m"
    if scene.labelHeight.text != nil {
        scene.labelHeight.text! = String(describing: (round((scene.sliderHeight.value/145)*100)/100)) + " m"
    }
    
    // Set Rotation Label
    scene.labelRotation = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelRotation.layer.position = CGPoint(x: (scene.view?.frame.width)!/2 + ((scene.mySlider?.frame.width)!*1.5), y: (scene.view?.frame.height)!-15)
    scene.labelRotation.textColor! = UIColor.black
    scene.labelRotation?.text = String(describing: round(-scene.sliderRotationLine.value*10)/10) + "°"
    if scene.labelRotation.text != nil {
        if (scene.sliderRotationLine.value != 0) {
            scene.labelRotation.text! = String(describing: round(-scene.sliderRotationLine.value*10)/10) + "°"
        } else {
            scene.labelRotation.text! = String(describing: 0) + "°"
        }
    }
    
    // Set Friction Label
    scene.labelFriction = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelFriction.layer.position = CGPoint(x: (scene.view?.frame.width)!/2 + ((scene.mySlider?.frame.width)!*1.5), y: (scene.view?.frame.height)!-45)
    scene.labelFriction.textColor! = UIColor.black
    scene.labelFriction?.text = String(describing: round(scene.sliderFriction.value*10)/10)
    if scene.labelFriction.text != nil {
        scene.labelFriction.text = String(describing: round(scene.sliderFriction.value*10)/10)
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
        scene.sliderFriction?.addTarget(scene, action: #selector(scene.setFriction), for: UIControlEvents.valueChanged)
    } else if (node.name == "objectCircle") /*|| (node.name == "pendulum") */{
        scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
    } else if (node.name == "beam") {
        scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
        scene.sliderRotationLine?.addTarget(scene, action: #selector(scene.setRotation), for: UIControlEvents.valueChanged)
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
    scene.arrayOfSliderFriction.append(scene.sliderFriction!)
    scene.view?.addSubview(scene.sliderFriction!)
    scene.arrayOfLabelFriction.append(scene.labelFriction!)
    scene.view?.addSubview(scene.labelFriction!)

}

}
