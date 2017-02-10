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
        sprite.physicsBody?.collisionBitMask = 0
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
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
 
        /*
        let position = Singleton.shared.getPosition()
        let lever = LeverClass(scene: scene, location: position)
        scene.addChild(lever.leverBeam)
        scene.addChild(lever.leverFulcrum)
        lever.leverFulcrum.physicsBody?.isDynamic = false
        scene.physicsWorld.add(lever.jointLever)
        Singleton.shared.addNewObject(anObject: lever)
        scene.addChild(lever)
        print("List: \(Singleton.shared.objects)")
        */
        /*let lever = Lever(location: position)
        lever.JoinLeverParts(scene: scene)
        Singleton.shared.addNewObject(anObject: lever)
        scene.addChild(lever)*/
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
    scene.sliderInitV = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.sliderInitV.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
    scene.sliderInitV?.layer.position = CGPoint(x: scene.phisphere.position.x + (scene.frame.size.width / 2) + 75, y: -scene.phisphere.position.y + (scene.frame.size.height / 2) + 15)
    scene.sliderInitV?.backgroundColor = UIColor.clear
    scene.sliderInitV?.tintColor = UIColor.green
    scene.sliderInitV?.layer.cornerRadius = 15.0
    scene.sliderInitV?.layer.shadowOpacity = 0.5
    scene.sliderInitV?.layer.masksToBounds = false
    scene.sliderInitV?.maximumValue = 725
    scene.sliderInitV?.minimumValue = -725
    scene.sliderInitV?.value = Float((scene.phisphere.physicsBody?.velocity.dx)!)
    
    scene.sliderInitV.addTarget(scene, action: #selector(scene.setInitialV), for: UIControlEvents.valueChanged)
    
    scene.labelInitV = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    scene.labelInitV.layer.position = CGPoint(x: scene.phisphere.position.x + scene.phisphere.size.width + scene.frame.maxX + (scene.sliderInitV?.frame.width)! * 2 - 50, y: -scene.phisphere.position.y + (scene.frame.size.height / 2) + 15)
    
    scene.labelInitV.textColor! = UIColor.black
    scene.labelInitV?.text = String(describing: round((scene.phisphere.physicsBody?.velocity.dx)!*10)/10)
    if scene.labelInitV.text != nil {
        scene.labelInitV.text! = String(describing: round((scene.phisphere.physicsBody?.velocity.dx)!*10)/10)
    }
    
    scene.arrayOfSliderInitV.append(scene.sliderInitV)
    scene.view?.addSubview(scene.sliderInitV)
    scene.arrayOfLabelInitV.append(scene.labelInitV)
    scene.view?.addSubview(scene.labelInitV)
    
    // Set Acceleration Text Field
    if !scene.gravity
    {
        scene.sliderInitA = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        scene.sliderInitA.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
        scene.sliderInitA?.layer.position = CGPoint(x: scene.phisphere.position.x + (scene.frame.size.width / 2) + 75, y: -scene.phisphere.position.y + (scene.frame.size.height / 2) + 40)
        scene.sliderInitA?.backgroundColor = UIColor.clear
        scene.sliderInitA?.tintColor = UIColor.red
        scene.sliderInitA?.layer.cornerRadius = 15.0
        scene.sliderInitA?.layer.shadowOpacity = 0.5
        scene.sliderInitA?.layer.masksToBounds = false
        scene.sliderInitA?.maximumValue = 725
        scene.sliderInitA?.minimumValue = -725
        scene.sliderInitA?.value = Float((scene.phisphereAccDx))
        
        scene.sliderInitA.addTarget(scene, action: #selector(scene.setInitialA), for: UIControlEvents.valueChanged)
        
        
        scene.labelInitA = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        scene.labelInitA.layer.position = CGPoint(x: scene.phisphere.position.x + scene.phisphere.size.width + scene.frame.maxX + (scene.sliderInitA?.frame.width)! * 2 - 50, y: -scene.phisphere.position.y + (scene.frame.size.height / 2) + 40)
        
        scene.labelInitA.textColor! = UIColor.black
        scene.labelInitA?.text = String(describing: round((scene.phisphereAccDx)*10)/10)
        if scene.labelInitA.text != nil {
            scene.labelInitA.text! = String(describing: round((scene.phisphereAccDx)*10)/10)
        }
        
        
        scene.arrayOfSliderInitA.append(scene.sliderInitA)
        scene.view?.addSubview(scene.sliderInitA)
        scene.arrayOfLabelInitA.append(scene.labelInitA)
        scene.view?.addSubview(scene.labelInitA)
    }
    func setWidth(node: SKSpriteNode) {
        // Set Width Slider
        scene.mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        scene.mySlider.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
        scene.mySlider?.layer.position = CGPoint(x: node.position.x + (scene.frame.size.width / 2) + 75, y: -node.position.y + (scene.frame.size.height / 2) - 35)
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
        // Set Width Label
        scene.myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        scene.myLabel.layer.position = CGPoint(x: scene.mySlider.frame.width * 2 + (scene.mySlider?.layer.position.x)! - 95, y: (scene.mySlider?.layer.position.y)!)
        scene.myLabel.textColor! = UIColor.black
        if node.name! == "beam" || node.name! == "fulcrum" {
            scene.myLabel?.text = String(describing: (round((scene.mySlider.value/(145*2))*100)/100)) + " x 2 m"
        } else {
            scene.myLabel?.text = String(describing: (round((scene.mySlider.value/145)*100)/100)) + " m"
            if scene.myLabel.text != nil {
                scene.myLabel.text! = String(describing: (round((scene.mySlider.value/145)*100)/100)) + " m"
            }
        }
        // Add Subviews
        scene.arrayOfSlider.append(scene.mySlider!)
        scene.view?.addSubview(scene.mySlider!)
        scene.arrayOfLabel.append(scene.myLabel!)
        scene.view?.addSubview(scene.myLabel!)
    }
    
    func setMass(node: SKSpriteNode) {
        // Set Mass Slider
        scene.sliderMass = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        scene.sliderMass.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
        scene.sliderMass?.layer.position = CGPoint(x: node.position.x + (scene.frame.size.width / 2) + 75, y: -node.position.y + (scene.frame.size.height / 2) - 10)
        scene.sliderMass?.backgroundColor = UIColor.clear
        scene.sliderMass?.layer.cornerRadius = 15.0
        scene.sliderMass?.layer.shadowOpacity = 0.5
        scene.sliderMass?.layer.masksToBounds = false
        scene.sliderMass?.maximumValue = 100
        scene.sliderMass?.minimumValue = 0.1
        scene.sliderMass?.value = Float((node.physicsBody?.mass)!)
        // Set Mass Label
        scene.labelMass = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        scene.labelMass.layer.position = CGPoint(x: scene.sliderMass.frame.width * 2 + scene.sliderMass.layer.position.x - 95, y: scene.sliderMass.layer.position.y)
        scene.labelMass.textColor! = UIColor.black
        scene.labelMass?.text = String(describing: (round((scene.sliderMass.value)*100)/100)) + " kg"
        if scene.labelMass.text != nil {
            scene.labelMass.text! = String(describing: (round((scene.sliderMass.value)*100)/100)) + " kg"
        }
        // Add Subviews
        scene.arrayOfSliderMass.append(scene.sliderMass!)
        scene.view?.addSubview(scene.sliderMass!)
        scene.arrayOfLabelMass.append(scene.labelMass!)
        scene.view?.addSubview(scene.labelMass!)
    }
    
    //setWidth(node: scene.phisphere)
    setMass(node: scene.phisphere)
    //scene.mySlider?.addTarget(scene, action: #selector(scene.setDiameter2), for: UIControlEvents.valueChanged)
    scene.sliderMass?.addTarget(scene, action: #selector(scene.setMass), for: UIControlEvents.valueChanged)
    
    //scene.viewController.EnableDeletionButtonAt(position: CGPoint(x: scene.frame.maxX + scene.phisphere.position.x - 10, y: scene.frame.maxY + scene.phisphere.position.y - 10))
    
    //print(scene.phisphere.position)
}


func addSlider(node: SKSpriteNode, scene: GameScene) {
    scene.myNode = nil
    scene.deleteSliders()
    
    let selectedObjID = Singleton.shared.lastSelectedObject
    
    if let object = Singleton.shared.GetObjectAt(index: selectedObjID)
    {
        if object.name != "speedCamera" && object.name != "laserAccelerometer" && object.name != "laserRangefinder" && object.name != "sensor" && object.name != "chronometer" && object.name != "pendulum" && object.name != "loadCell" {
            
            func setWidth(node: SKSpriteNode) {
                // Set Width Slider
                scene.mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.mySlider.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
                scene.mySlider?.layer.position = CGPoint(x: object.position.x + (scene.frame.size.width / 2) + 75, y: -object.position.y + (scene.frame.size.height / 2) - 35)
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
                // Set Width Label
                scene.myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.myLabel.layer.position = CGPoint(x: scene.mySlider.frame.width * 2 + (scene.mySlider?.layer.position.x)! - 95, y: (scene.mySlider?.layer.position.y)!)
                scene.myLabel.textColor! = UIColor.black
                if node.name! == "beam" || node.name! == "fulcrum" {
                    scene.myLabel?.text = String(describing: (round((scene.mySlider.value/(145*2))*100)/100)) + " x 2 m"
                } else {
                    scene.myLabel?.text = String(describing: (round((scene.mySlider.value/145)*100)/100)) + " m"
                    if scene.myLabel.text != nil {
                        scene.myLabel.text! = String(describing: (round((scene.mySlider.value/145)*100)/100)) + " m"
                    }
                }
                // Add Subviews
                scene.arrayOfSlider.append(scene.mySlider!)
                scene.view?.addSubview(scene.mySlider!)
                scene.arrayOfLabel.append(scene.myLabel!)
                scene.view?.addSubview(scene.myLabel!)
            }
            
            func setHeight() {
                // Set Height Slider
                scene.sliderHeight = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.sliderHeight.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
                scene.sliderHeight?.layer.position = CGPoint(x: object.position.x + (scene.frame.size.width / 2) + 75, y: -object.position.y + (scene.frame.size.height / 2) - 10)
                scene.sliderHeight?.backgroundColor = UIColor.clear
                scene.sliderHeight?.layer.cornerRadius = 15.0
                scene.sliderHeight?.layer.shadowOpacity = 0.5
                scene.sliderHeight?.layer.masksToBounds = false
                scene.sliderHeight?.maximumValue = 290
                scene.sliderHeight?.minimumValue = 0.2
                scene.sliderHeight?.value = Float(node.size.height)
                // Set Height Label
                scene.labelHeight = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.labelHeight.layer.position = CGPoint(x: scene.sliderHeight.frame.width * 2 + scene.sliderHeight.layer.position.x - 95, y: scene.sliderHeight.layer.position.y)
                scene.labelHeight.textColor! = UIColor.black
                scene.labelHeight?.text = String(describing: (round((scene.sliderHeight.value/145)*100)/100)) + " m"
                if scene.labelHeight.text != nil {
                    scene.labelHeight.text! = String(describing: (round((scene.sliderHeight.value/145)*100)/100)) + " m"
                }
                // Add Subviews
                scene.arrayOfSliderHeight.append(scene.sliderHeight!)
                scene.view?.addSubview(scene.sliderHeight!)
                scene.arrayOfLabelHeight.append(scene.labelHeight!)
                scene.view?.addSubview(scene.labelHeight!)
            }
        
            func setRotation(node: SKSpriteNode) {
                // Set Rotation Slider
                scene.sliderRotationLine = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.sliderRotationLine.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
                scene.sliderRotationLine?.layer.position = CGPoint(x: object.position.x + (scene.frame.size.width / 2) + 75, y: -object.position.y + (scene.frame.size.height / 2) + 15)
                scene.sliderRotationLine?.backgroundColor = UIColor.clear
                scene.sliderRotationLine?.layer.cornerRadius = 15.0
                scene.sliderRotationLine?.layer.shadowOpacity = 0.5
                scene.sliderRotationLine?.layer.masksToBounds = false
                scene.sliderRotationLine?.maximumValue = 180
                scene.sliderRotationLine?.minimumValue = -180
                scene.sliderRotationLine?.value = -Float(node.zRotation*360)/(2*Float(M_PI))
                print(Float(node.zRotation))
                // Set Rotation Label
                scene.labelRotation = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.labelRotation.layer.position = CGPoint(x: scene.sliderRotationLine.frame.width * 2 + scene.sliderRotationLine.layer.position.x - 95, y: scene.sliderRotationLine.layer.position.y)
                scene.labelRotation.textColor! = UIColor.black
                scene.labelRotation?.text = String(describing: round(-scene.sliderRotationLine.value*10)/10) + "°"
                if scene.labelRotation.text != nil {
                    if (scene.sliderRotationLine.value != 0) {
                        scene.labelRotation.text! = String(describing: round(-scene.sliderRotationLine.value*10)/10) + "°"
                    } else {
                        scene.labelRotation.text! = String(describing: 0) + "°"
                    }
                }
                // Add Subviews
                scene.arrayOfSliderRotationLine.append(scene.sliderRotationLine!)
                scene.view?.addSubview(scene.sliderRotationLine!)
                scene.arrayOfLabelRotation.append(scene.labelRotation!)
                scene.view?.addSubview(scene.labelRotation!)
            }
            
            func setFriction() {
                // Set Friction Slider
                scene.sliderFriction = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.sliderFriction.setThumbImage(UIImage(named: "SliderThumb.png"), for: .normal)
                scene.sliderFriction?.layer.position = CGPoint(x: object.position.x + (scene.frame.size.width / 2) + 75, y: -object.position.y + (scene.frame.size.height / 2) + 40)
                scene.sliderFriction?.backgroundColor = UIColor.clear
                scene.sliderFriction?.layer.cornerRadius = 15.0
                scene.sliderFriction?.layer.shadowOpacity = 0.5
                scene.sliderFriction?.layer.masksToBounds = false
                scene.sliderFriction?.maximumValue = 290
                scene.sliderFriction?.minimumValue = 0
                scene.sliderFriction?.value = Float((node.physicsBody?.friction)!)
                // Set Friction Label
                scene.labelFriction = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                scene.labelFriction.layer.position = CGPoint(x: scene.sliderFriction.frame.width * 2 + scene.sliderFriction.layer.position.x - 95, y: scene.sliderFriction.layer.position.y)
                scene.labelFriction.textColor! = UIColor.black
                scene.labelFriction?.text = String(describing: round(scene.sliderFriction.value*10)/10)
                if scene.labelFriction.text != nil {
                    scene.labelFriction.text = String(describing: round(scene.sliderFriction.value*10)/10)
                }
                // Add Subviews
                scene.arrayOfSliderFriction.append(scene.sliderFriction!)
                scene.view?.addSubview(scene.sliderFriction!)
                scene.arrayOfLabelFriction.append(scene.labelFriction!)
                scene.view?.addSubview(scene.labelFriction!)
            }
            
            if object.name == "object" {
                setWidth(node: object)
                setHeight()
                setRotation(node: object)
                setFriction()
            } else if object.name == "objectCircle" /*|| object.name == "pendulum"*/ {
                setWidth(node: object)
                //setFriction()
            } else if object.name == "beam" {
                //setWidth(node: object)
                setRotation(node: object)
            } else if object.name == "fulcrum" {
                let beam = Singleton.shared.GetObjectAt(index: selectedObjID + 1)
                //setWidth(node: beam!)
                setRotation(node: beam!)
                scene.myNode = beam!
            }
        
            if(node.name == "phisphere"){
                scene.mySlider?.addTarget(scene, action: #selector(scene.setDiameter2), for: UIControlEvents.valueChanged)
            }
            else if(node.name == "triangle") || (node.name == "block") {
                // These nodes are deprecated at the moment, but they can be reused
                scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
                scene.sliderHeight?.addTarget(scene, action: #selector(scene.setHeight2), for: UIControlEvents.valueChanged)
            } else if (node.name == "object") {
                scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
                scene.sliderHeight?.addTarget(scene, action: #selector(scene.setHeight2), for: UIControlEvents.valueChanged)
                scene.sliderRotationLine?.addTarget(scene, action: #selector(scene.setRotation), for: UIControlEvents.valueChanged)
                scene.sliderFriction?.addTarget(scene, action: #selector(scene.setFriction), for: UIControlEvents.valueChanged)
            } else if (node.name == "objectCircle") /*|| (node.name == "pendulum")*/ {
                scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
                scene.sliderFriction?.addTarget(scene, action: #selector(scene.setFriction), for: UIControlEvents.valueChanged)
            } else if (node.name == "beam" || node.name == "fulcrum") {
                scene.mySlider?.addTarget(scene, action: #selector(scene.setWidth2), for: UIControlEvents.valueChanged)
                scene.sliderRotationLine?.addTarget(scene, action: #selector(scene.setRotation), for: UIControlEvents.valueChanged)
            }
        
        
        }
        
        scene.viewController.EnableDeletionButtonAt(position: CGPoint(x: object.position.x + (scene.frame.size.width / 2) - 20, y: -object.position.y + (scene.frame.size.height / 2) + 35))
    }
}

}
