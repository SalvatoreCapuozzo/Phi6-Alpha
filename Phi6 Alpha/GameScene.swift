//
//  GameScene.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import SpriteKit
import GameplayKit
import CircularSlider
import MTCircularSlider

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var phisphere: SKSpriteNode!
    var triangle: SKSpriteNode!
    var block: SKSpriteNode!
    var numTriangle: Int = 0
    var arrayTriangle: Array<SKSpriteNode> = Array<Any>(repeating: SKSpriteNode(), count: 100) as! Array<
        SKSpriteNode>
    
//    let rotateRec = UIRotationGestureRecognizer
    
    let triangleTexture = SKTexture(imageNamed: "Triangle")

    var triangleClass = Triangle()
    
    var pausePosition: CGPoint!
    var pauseDiameter: CGFloat!
    var pauseMass: CGFloat!
    
    var pauseScale: CGFloat!
    var pauseYScale: CGFloat!
    var pausePhiScale: CGFloat!
    var pauseTexture: SKTexture!
    var pause = true
    
    var pauseXScale: CGFloat!
    
    var selectedNode: SKSpriteNode!
    var myNode: SKSpriteNode!
    var mySlider: UISlider!
    var sliderHeight: UISlider!
    var sliderRotation: CircularSlider!
    var sliderRotation2: MTCircularSlider!
    var sliderRotationLine: UISlider!
    var myLabel: UILabel!
    var labelHeight: UILabel!
    var labelRotation: UILabel!
    var arrayOfSlider = [UISlider]()
    var arrayOfSliderHeight = [UISlider]()
    var arrayOfSliderRotation = [CircularSlider]()
    var arrayOfSliderRotation2 = [MTCircularSlider]()
    var arrayOfSliderRotationLine = [UISlider]()
    var arrayOfSensors = [Sensor]()
    var arrayOfLabel = [UILabel]()
    var arrayOfLabelHeight = [UILabel]()
    var arrayOfLabelRotation = [UILabel]()
    var arrayOfLabelSensors = [UILabel]()
    
    var number: Int = 0
    var firstWidth: CGFloat!
    var deleteMode: Bool = false
    
    // Alternative method
    var objectWidth: CGFloat! = 50
    var objectHeight: CGFloat! = 50
    
    var firstScene: SKView? = nil
    var levelSelected: String?
    
//    let phisphereCategory: UInt32 = 0x1 << 0
//    let sensorCategory: UInt32 = 0x1 << 1
    
    var counter = 0.0
    var timer = Timer()
    var timer2 = Timer()
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        /*
        // Questa è la parte da correggere per poter implementare correttamente i livelli mediante il JSON
        self.firstScene = self.view
        
        if let asset = NSDataAsset(name: "level_0", bundle: .main) {
            do {
                if let json = try JSONSerialization.jsonObject(with: asset.data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
                    let character = Character(imageNamed: json["character"] as! String, xPosition:
                        json["character_coordinate_x"] as! Double, yPosition: json["character_coordinate_y"] as! Double)
                    Singleton.shared.addNewObject(anObject: character)
                    self.addChild(character)
                    character.setScale()
                    phisphere = character
                    pauseDiameter = phisphere.size.width
                    
                    let obstacles = json["obstacles"] as! [Any]
                    
                    for obstacle in obstacles {
                        if let object = obstacle as? [String: Any] {
                            print(object["obj"])
                            
                            let obj = Obstacle(imageNamed: object["obj"] as! String, scene: self, xPosition: object["obj_coordinate_x"] as! Double, yPosition: object["obj_coordinate_y"] as! Double)
                            self.addChild(obj)
                        }
                    }
                }
            } catch let error {
                print(error)
            }
        }
        */
        
//        rotateRec = UIRotationGestureRecognizer(target: self, action: #selector(rotated))
//        self.view?.addGestureRecognizer(rotateRec)
        
        
        
        phisphere = childNode(withName: "phisphere") as! SKSpriteNode
        
        phisphere.physicsBody?.collisionBitMask = 1
        phisphere.physicsBody?.categoryBitMask = PhysicsCategory.Phisphere
        phisphere.physicsBody?.contactTestBitMask = PhysicsCategory.Sensor
        
        phisphere.physicsBody?.mass = 10
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        pausePosition = phisphere.position
        pauseDiameter = phisphere.size.width
        pausePhiScale = phisphere.xScale
        pauseMass = phisphere.physicsBody?.mass
        print("PauseMass: \(pauseMass)")
        
        Singleton.shared.createList()
        Singleton.shared.createSensorList()
        Singleton.shared.fillList()
        
        
        
        /*for object in Singleton.shared.objects {
            self.addChild(object as! SKNode)
        }*/
        
        if Singleton.shared.selectedPath != IndexPath() {
            switch Singleton.shared.selectedPath {
            case [0, 0]:
                addTriangle()
            case [0, 1]:
                addRectangle()
            case [0, 2]:
                addCircle()
            default: print("Oops, something went wrong")
            }
        }
        
    }
    
    func rotated(sender: UIRotationGestureRecognizer) {
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pause {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchedWhere = nodes(at: touchLocation)
                
                if !touchedWhere.isEmpty {
                    for node in touchedWhere {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == phisphere {
                                phisphere.position = touchLocation
                            } else {
                                for object in Singleton.shared.objects {
                                    if sprite == object {
                                        if !deleteMode {
                                            if object.name == "sensor" {
                                                object.physicsBody?.collisionBitMask = 1
                                                object.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
                                                object.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
                                            } else if object.name == "speedCamera" {
                                                object.physicsBody?.collisionBitMask = 1
                                                object.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
                                                object.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
                                            } else if object.name == "loadCell" {
                                                object.physicsBody?.collisionBitMask = 2
                                            }
//                                            print("Col: \(object.physicsBody?.collisionBitMask)")
                                            object.position = touchLocation
                                            selectedNode = object
                                            
                                            addSlider(node: object)
                                            myNode = object
                                        } else {
                                            self.removeChildren(in: [object])
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pause {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchedWhere = nodes(at: touchLocation)
                
                if !touchedWhere.isEmpty {
                    for node in touchedWhere {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == phisphere {
                                phisphere.position = touchLocation
                            } else {
                                for object in Singleton.shared.objects {
                                    if sprite == object {
                                        object.position = touchLocation
                                        selectedNode = object
                                        
                                        addSlider(node: object)
                                        myNode = object
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    var shapeLayerV = CAShapeLayer()
    var shapeLayerA = CAShapeLayer()
    
    var beforeAfterPosition: [String: CGFloat] = ["final": 0, "initial": 0]
    var beforeAfterVelocityDx: [String: CGFloat] = ["final": 0, "initial": 0]
    var beforeAfterVelocityDy: [String: CGFloat] = ["final": 0, "initial": 0] // Aggiungere dy al nome
    var beforeAfterTime: [String: TimeInterval] = ["final": 0, "initial": 0]
    var currentTime: TimeInterval! = 0.04
    var deltaTime: CGFloat! = 0.04
    var phisphereVel: CGFloat = 0
    var phisphereAccDx: CGFloat = 0
    var phisphereAccDy: CGFloat = 0 // Aggiungere dy al nome
    
    // Update function
    override func update(_ currentTime: TimeInterval) {
        if !pause {
//            phisphere.physicsBody?.affectedByGravity = true
            
            // Da utilizzare in caso di assenza di gravità e velocità iniziale diversa da zero
            phisphere.physicsBody?.velocity.dx = CGFloat(27.7*163)
            phisphere.physicsBody?.velocity.dy = CGFloat(0)
            phisphere.physicsBody?.affectedByGravity = false
            phisphere.physicsBody?.collisionBitMask = 0
            phisphere.physicsBody?.categoryBitMask = PhysicsCategory.Phisphere
            phisphere.physicsBody?.contactTestBitMask = PhysicsCategory.Sensor
            
            
            for object in Singleton.shared.objects {
                object.physicsBody?.affectedByGravity = false
                if object.name == "sensor" {
                    object.physicsBody?.collisionBitMask = 1
                }
            }
            self.currentTime = currentTime
            // print(phisphere.physicsBody?.velocity.dy)
            
            // Vettore velocità
            let startV = CGPoint(x: phisphere.position.x + (self.frame.size.width / 2), y: -phisphere.position.y + (self.frame.size.height / 2))
            
            let endV = CGPoint(x: phisphere.position.x + (self.frame.size.width / 2) + (phisphere.physicsBody?.velocity.dx)!/15, y: -phisphere.position.y + (self.frame.size.height / 2) - (phisphere.physicsBody?.velocity.dy)!/15)
            
            let pathV = UIBezierPath.arrow(from: startV, to: endV,
                                          tailWidth: 2.0, headWidth: 5.0, headLength: 5.0)
            
            // Vettore accelerazione (Alla faccia tua, SpriteKit di merda!!!)
            /*
             ________________$$$$
             ______________$$____$$
             ______________$$____$$
             ______________$$____$$
             ______________$$____$$
             ______________$$____$$
             __________$$$$$$____$$$$$$
             ________$$____$$____$$____$$$$
             ________$$____$$____$$____$$__$$
             $$$$$$__$$____$$____$$____$$____$$
             $$____$$$$________________$$____$$
             $$______$$______________________$$
             __$$____$$______________________$$
             ___$$$__$$______________________$$
             ____$$__________________________$$
             _____$$$________________________$$
             ______$$______________________$$$
             _______$$$____________________$$
             ________$$____________________$$
             _________$$$________________$$$
             __________$$________________$$
             __________$$$$$$$$$$$$$$$$$$$$
            */
            let startA = CGPoint(x: phisphere.position.x + (self.frame.size.width / 2), y: -phisphere.position.y + (self.frame.size.height / 2))
            
            //var endG = CGPoint(x: phisphere.position.x + (self.frame.size.width / 2), y: -phisphere.position.y + (self.frame.size.height / 2) + 9.81*5)
            
            let endA = CGPoint(x: phisphere.position.x + (self.frame.size.width / 2) + phisphereAccDx/15, y: -phisphere.position.y + (self.frame.size.height / 2) - phisphereAccDy/15)
            
            let pathA = UIBezierPath.arrow(from: startA, to: endA,
                                          tailWidth: 2.0, headWidth: 5.0, headLength: 5.0)
            
            // Inserimento nel layer
            
            shapeLayerV.path = pathV.cgPath
            shapeLayerV.strokeColor = UIColor.green.cgColor
            shapeLayerV.lineWidth = 2.0
            
            shapeLayerA.path = pathA.cgPath
            shapeLayerA.strokeColor = UIColor.red.cgColor
            shapeLayerA.lineWidth = 2.0
            
            self.view?.layer.addSublayer(shapeLayerV)
            self.view?.layer.addSublayer(shapeLayerA)
            
            // Cancello il vettore quando la velocita è zero
            
            if abs(Double((phisphere.physicsBody?.velocity.dx)!)) < 0.1 &&  abs(Double((phisphere.physicsBody?.velocity.dy)!)) < 0.1{
                shapeLayerV.removeFromSuperlayer()
            }
            
            // Cancello il vettore quando l'accelerazione è zero
            
            if abs(Double(phisphereAccDx)) < 0.1 &&  abs(Double(phisphereAccDy)) < 0.1{
                shapeLayerA.removeFromSuperlayer()
            }
            
        }
    }
    
    func play() {
        self.pause = false
    }
    
    func stop() {
        self.pause = true
        reset()
    }
    
    func isStopped() -> Bool {
        if self.pause == true {
            return true
        } else {
            return false
        }
    }
    
    func reset() {
        phisphere.physicsBody?.affectedByGravity = false
        
        phisphere.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        phisphere.physicsBody?.angularVelocity = 0
        phisphere.position = pausePosition
        phisphere.zRotation = 0

        phisphere.xScale = pausePhiScale
        phisphere.yScale = pausePhiScale
        phisphere.physicsBody?.mass = pauseMass
        
        shapeLayerV.removeFromSuperlayer()
        shapeLayerA.removeFromSuperlayer()
        
        if arrayOfLabelSensors.count >= 0 {
            for label in arrayOfLabelSensors {
                label.removeFromSuperview()
            }
            arrayOfLabelSensors.removeAll()
        }
        
        for sensor in arrayOfSensors {
            sensor.unset()
        }
    }
    
    func addTriangle() {
        let sprite = Triangle.triangle(location: CGPoint(x: self.frame.maxX/2, y: self.frame.maxY/2))
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        sprite.physicsBody?.usesPreciseCollisionDetection = true
        physicsWorld.contactDelegate = self
        sprite.xScale = 0.1
        repeat {
            sprite.xScale += 0.001
        } while (sprite.size.width < 50)
        sprite.size.width = 54
        sprite.yScale = 0.1
        repeat {
            sprite.yScale += 0.001
        } while (sprite.size.height < 50)
        sprite.size.height = 54
        //sprite.xScale = scale
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
        
        if sprite.name == nil {
            sprite.name = "object" //+ String(number)
            number += 1
        }
        print(sprite.name!)
    }
    
    func addPhotoCell() {
        let sprite = PhotoCell.photoCell(location: CGPoint(x: self.frame.maxX/2, y: self.frame.maxY/2))
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        
        sprite.physicsBody?.collisionBitMask = 0
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        
        sprite.size.width = objectWidth
        sprite.size.height = objectHeight
        sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -objectWidth/2, y: -objectHeight/2, width: objectWidth, height: objectHeight))
        print(sprite.xScale)
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
        arrayOfSensors.append(sprite)
        
        if sprite.name == nil {
            sprite.name = "sensor"// + String(number)
            number += 1
        }
        print(sprite.name!)
    }
    
    func addSpeedCamera() {
        let sprite = SpeedCamera.speedCamera(location: CGPoint(x: self.frame.maxX/2, y: self.frame.maxY/2))
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        
        sprite.physicsBody?.collisionBitMask = 0
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        
        sprite.size.width = objectWidth
        sprite.size.height = objectHeight
        sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -objectWidth/2, y: -objectHeight/2, width: objectWidth, height: objectHeight))
        print(sprite.xScale)
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
        arrayOfSensors.append(sprite)
        
        if sprite.name == nil {
            sprite.name = "speedCamera"// + String(number)
            number += 1
        }
        print(sprite.name!)
    }

    func addLoadCell() {
        let sprite = LoadCell.loadCell(location: CGPoint(x: self.frame.maxX/2, y: self.frame.maxY/2))
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        
        sprite.physicsBody?.collisionBitMask = 0
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
        
        sprite.size.width = objectWidth
        sprite.size.height = objectHeight
        sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -objectWidth/2, y: -objectHeight/2, width: objectWidth, height: objectHeight/2 + 1))
        print(sprite.xScale)
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
        arrayOfSensors.append(sprite)
        
        if sprite.name == nil {
            sprite.name = "loadCell"// + String(number)
            number += 1
        }
        print(sprite.name!)
    }
    
    func addRectangle() {
        let sprite = Rectangle.rectangle(location: CGPoint(x: self.frame.maxX/2, y: self.frame.maxY/2))
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        sprite.physicsBody?.usesPreciseCollisionDetection = true
        
        sprite.size.width = objectWidth
        sprite.size.height = objectHeight
        sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -objectWidth/2, y: -objectHeight/2, width: objectWidth, height: objectHeight))
        print(sprite.xScale)
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
        
        if sprite.name == nil {
            sprite.name = "object"// + String(number)
            number += 1
        }
        print(sprite.name!)
    }
    
    func addCircle() {
        let sprite = Circle.circle(location: CGPoint(x: self.frame.maxX/2, y: self.frame.maxY/2))
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        sprite.physicsBody?.usesPreciseCollisionDetection = true
        
        sprite.size.width = objectWidth
        sprite.size.height = objectWidth
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: objectWidth/2)
        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = false
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
        
        if sprite.name == nil {
            sprite.name = "objectCircle" //+ String(number)
            number += 1
        }
        print(sprite.name!)
    }
    
    func addSlider(node: SKSpriteNode) {
        myNode = nil
        deleteSliders()
        
        // Set Width Slider
        mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        mySlider?.layer.position = CGPoint(x: (self.view?.frame.width)!/4 - ((mySlider?.frame.width)!/8) , y: (self.view?.frame.height)!-45)
        mySlider?.backgroundColor = UIColor.clear
        mySlider?.layer.cornerRadius = 15.0
        mySlider?.layer.shadowOpacity = 0.5
        mySlider?.layer.masksToBounds = false
        mySlider?.maximumValue = 326
        mySlider?.minimumValue = 0.2
        mySlider?.value = Float(node.size.width)
        
        // Set Height Slider
        sliderHeight = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        sliderHeight?.layer.position = CGPoint(x: (self.view?.frame.width)!/4 - ((mySlider?.frame.width)!/8) , y: (self.view?.frame.height)!-15)
        sliderHeight?.backgroundColor = UIColor.clear
        sliderHeight?.layer.cornerRadius = 15.0
        sliderHeight?.layer.shadowOpacity = 0.5
        sliderHeight?.layer.masksToBounds = false
        sliderHeight?.maximumValue = 326
        sliderHeight?.minimumValue = 0.2
        sliderHeight?.value = Float(node.size.height)
        
        // Set Rotation Slider
        sliderRotationLine = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        sliderRotationLine?.layer.position = CGPoint(x: (self.view?.frame.width)!/2 + ((mySlider?.frame.width)!/2) , y: (self.view?.frame.height)!-15)
        sliderRotationLine?.backgroundColor = UIColor.clear
        sliderRotationLine?.layer.cornerRadius = 15.0
        sliderRotationLine?.layer.shadowOpacity = 0.5
        sliderRotationLine?.layer.masksToBounds = false
        sliderRotationLine?.maximumValue = 360
        sliderRotationLine?.minimumValue = 0
        sliderRotationLine?.value = Float(node.zRotation)
        
        // Set Width Label
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        myLabel.layer.position = CGPoint(x: (self.view?.frame.width)!/4 + ((mySlider?.frame.width)!/1.2), y: (self.view?.frame.height)!-45)
        myLabel.textColor! = UIColor.black
        myLabel?.text = String(describing: (round((mySlider.value/163)*100)/100)) + " m"
        if myLabel.text != nil {
            myLabel.text! = String(describing: (round((mySlider.value/163)*100)/100)) + " m"
        }
        
        // Set Height Label
        labelHeight = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        labelHeight.layer.position = CGPoint(x: (self.view?.frame.width)!/4 + ((mySlider?.frame.width)!/1.2), y: (self.view?.frame.height)!-15)
        labelHeight.textColor! = UIColor.black
        labelHeight?.text = String(describing: (round((sliderHeight.value/163)*100)/100)) + " m"
        if labelHeight.text != nil {
            labelHeight.text! = String(describing: (round((sliderHeight.value/163)*100)/100)) + " m"
        }
        
        // Set Rotation Label
        labelRotation = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        labelRotation.layer.position = CGPoint(x: (self.view?.frame.width)!/2 + ((mySlider?.frame.width)!*1.5), y: (self.view?.frame.height)!-15)
        labelRotation.textColor! = UIColor.black
        labelRotation?.text = String(describing: round(sliderRotationLine.value*10)/10) + "°"
        if labelRotation.text != nil {
            labelRotation.text! = String(describing: round(sliderRotationLine.value*10)/10) + "°"
        }
        
        if(node.name == "phisphere"){
            mySlider?.addTarget(self, action: #selector(setDiameter2), for: UIControlEvents.valueChanged)
        }
        else if(node.name == "triangle") || (node.name == "block") {
            mySlider?.addTarget(self, action: #selector(setWidth2), for: UIControlEvents.valueChanged)
            sliderHeight?.addTarget(self, action: #selector(setHeight2), for: UIControlEvents.valueChanged)
            //sliderRotation?.addTarget(self, action: #selector(setRotation), for: UIControlEvents.valueChanged)
        } else if (node.name == "object") {
            mySlider?.addTarget(self, action: #selector(setWidth2), for: UIControlEvents.valueChanged)
            sliderHeight?.addTarget(self, action: #selector(setHeight2), for: UIControlEvents.valueChanged)
            //sliderRotation?.addTarget(self, action: #selector(setRotation), for: UIControlEvents.valueChanged)
            //sliderRotation?.target(forAction: #selector(setRotation), withSender: self)
            sliderRotationLine?.addTarget(self, action: #selector(setRotation), for: UIControlEvents.valueChanged)
        } else if (node.name == "objectCircle") {
            mySlider?.addTarget(self, action: #selector(setWidth2), for: UIControlEvents.valueChanged)
        }
        
            arrayOfSlider.append(mySlider!)
            self.view?.addSubview(mySlider!)
            arrayOfSliderHeight.append(sliderHeight!)
            self.view?.addSubview(sliderHeight!)
            arrayOfSliderRotationLine.append(sliderRotationLine!)
            self.view?.addSubview(sliderRotationLine!)
            arrayOfLabel.append(myLabel!)
            self.view?.addSubview(myLabel!)
            arrayOfLabelHeight.append(labelHeight!)
            self.view?.addSubview(labelHeight!)
            arrayOfLabelRotation.append(labelRotation!)
            self.view?.addSubview(labelRotation!)
        }

        func deleteSliders(){
        
            if arrayOfSlider.count >= 0{
                for slider in arrayOfSlider{
                    slider.removeFromSuperview()
                }
                arrayOfSlider.removeAll()
            }
            if arrayOfLabel.count >= 0{
                for label in arrayOfLabel{
                    label.removeFromSuperview()
                }
                arrayOfLabel.removeAll()
            }
            if arrayOfSliderHeight.count >= 0{
                for slider in arrayOfSliderHeight{
                    slider.removeFromSuperview()
                }
                arrayOfSliderHeight.removeAll()
            }
            if arrayOfLabelHeight.count >= 0{
                for label in arrayOfLabelHeight{
                    label.removeFromSuperview()
                }
                arrayOfLabelHeight.removeAll()
            }
            if arrayOfSliderRotationLine.count >= 0{
                for slider in arrayOfSliderRotationLine{
                    slider.removeFromSuperview()
                }
                arrayOfSliderRotation.removeAll()
            }
            if arrayOfLabelRotation.count >= 0{
                for label in arrayOfLabelRotation{
                    label.removeFromSuperview()
                }
                arrayOfLabelRotation.removeAll()
            }
        }
    
    func setWidth2() {
        print("SelectedNode is: " + selectedNode.name!)
        
        print("Set width to " + myNode.name!)
        removeChildren(in: [myNode])
        
        if (myNode.name! == "object") {
            
            //myNode.xScale = 0.2 * CGFloat(mySlider.value) / 50
            myNode.size.width = CGFloat(mySlider.value)
            myNode.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -CGFloat(mySlider.value)/2, y: -CGFloat(sliderHeight.value)/2, width: CGFloat(mySlider.value), height: CGFloat(sliderHeight.value)))
            print("New width: " + String(describing: myNode.size.width))
        } else if (myNode.name! == "objectCircle") {
            myNode.size.width = CGFloat(mySlider.value)
            myNode.size.height = CGFloat(mySlider.value)
            myNode.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(mySlider.value)/2)
            myNode.physicsBody?.affectedByGravity = false
            myNode.physicsBody?.isDynamic = false

            print("New height: " + String(describing: myNode.size.height))
        }
        //myNode.position.x = myNode.position.x - (myNode.size.width - CGFloat((mySlider?.value)!))/2
        
        myLabel.text! = String(describing: (round((myNode.size.width/163)*100)/100)) + " m"
        
        addChild(myNode)
        
    }
    
    func setHeight2() {
        print("SelectedNode is: " + selectedNode.name!)
        
        print("Set height to " + myNode.name!)
        removeChildren(in: [myNode])
        
        if (myNode.name! == "object") {
            
            //myNode.yScale = 0.2 * CGFloat(sliderHeight.value) / 50
            myNode.size.height = CGFloat(sliderHeight.value)
            myNode.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -CGFloat(mySlider.value)/2, y: -CGFloat(sliderHeight.value)/2, width: CGFloat(mySlider.value), height: CGFloat(sliderHeight.value)))
            print("New height: " + String(describing: myNode.size.height))
        }
        //myNode.position.y = myNode.position.y - (myNode.size.height - CGFloat((sliderHeight?.value)!))/2
        
        labelHeight.text! = String(describing: (round((myNode.size.height/163)*100)/100)) + " m"
        
        addChild(myNode)
        
    }
    
    func setDiameter2() {
        if (myNode.name! == "phisphere") {
            phisphere.position.x = phisphere.position.x - (phisphere.size.width - CGFloat(mySlider.value))/2
            //scene.phisphere.size.width = CGFloat(diameterSlider.value)
            phisphere.position.y = phisphere.position.y - (phisphere.size.height - CGFloat(mySlider.value))/2
            //scene.phisphere.size.height = CGFloat(diameterSlider.value)
            
            phisphere.xScale = CGFloat(mySlider.value)/pauseDiameter
            phisphere.yScale = CGFloat(mySlider.value)/pauseDiameter
            
            //diameterLabel.text! = String(describing: round(scene.phisphere.size.width*10)/10)
        } else if (myNode.name! == "objectCircle") {
            myNode.size.width = CGFloat(mySlider.value)
            myNode.size.height = CGFloat(mySlider.value)
            myNode.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -CGFloat(mySlider.value)/2, y: -CGFloat(mySlider.value)/2, width: CGFloat(mySlider.value), height: CGFloat(mySlider.value)))
            print("New height: " + String(describing: myNode.size.height))
        }
        //myNode.position.y = myNode.position.y - (myNode.size.height - CGFloat((sliderHeight?.value)!))/2
        
        myLabel.text! = String(describing: (round((myNode.size.height/163)*100)/100)) + " m"
        
        addChild(myNode)
        
    }
    
    func setRotation() {
        if (myNode.name! == "object") {
            myNode.zRotation = CGFloat(-sliderRotationLine.value/360*2*Float(M_PI))
        }
        labelRotation.text! = String(describing: round(sliderRotationLine.value*10)/10) + "°"
    }
    
    func deleteSwitch() {
        if deleteMode {
            deleteMode = false
            print("Delete Mode Off")
        } else {
            deleteMode = true
            print("Delete Mode On")
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        //2
        if ((firstBody.categoryBitMask & PhysicsCategory.Phisphere != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Sensor != 0)) {
            print("Body: \(secondBody.node?.position.y)")
            print("Body: \((firstBody.node?.position.y)! - ((secondBody.node?.frame.height)! / 2))")
            if secondBody.node?.name! == "speedCamera" {
                //timer.invalidate()
                if let phisphereNode = firstBody.node as? SKSpriteNode, let
                    Sensor = secondBody.node as? SpeedCamera {
                    let velocity = (sqrt(pow((phisphereNode.physicsBody?.velocity.dx)!, 2) + pow((phisphereNode.physicsBody?.velocity.dy)!, 2))/163)
                    Sensor.setSpeedCameraValue(velocity)
                    //print("Position: \(phisphereNode.position)")
                    print(Sensor.value)
                    setValueDisplaySC(Sensor)
                }
            } else if (secondBody.node?.name)! == "loadCell" && (secondBody.node?.position.y)! < (firstBody.node?.position.y)! - 10 {
                if let phisphereNode = firstBody.node as? SKSpriteNode, let Sensor = secondBody.node as? LoadCell {
                    let force = (phisphereNode.physicsBody?.mass)! * ((sqrt(pow(phisphereAccDx, 2)+pow(phisphereAccDy, 2)))/163)
                    Sensor.setLoadCellValue(force)
                    print(Sensor.value)
                    setValueDisplayLC(Sensor)
                }
            }
            if let phisphere = firstBody.node as? SKSpriteNode, let
                Sensor = secondBody.node as? PhotoCell {
                Sensor.setPhotoCellValue()
            }
        }
    }
    
    func setValueDisplaySC(_ object: SpeedCamera) {
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        myLabel.layer.position = CGPoint(x: object.position.x + (self.frame.size.width / 2) + 30, y: -object.position.y + (self.frame.size.height / 2) - 15)
        myLabel.textColor! = UIColor.green
        myLabel?.text = String(describing: round(object.value*10)/10)
        if myLabel.text != nil {
            myLabel.text! = String(describing: round(object.value*10)/10)
        }
        myLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 10)

        arrayOfLabelSensors.append(myLabel)
        self.view?.addSubview(myLabel)
        print("Running time: ok")
    }
    
    func setValueDisplayLC(_ object: LoadCell) {
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        myLabel.layer.position = CGPoint(x: object.position.x + (self.frame.size.width / 2) + 30, y: -object.position.y + (self.frame.size.height / 2) + 15)
        myLabel.textColor! = UIColor.green
        myLabel?.text = String(describing: round(object.value*10)/10)
        if myLabel.text != nil {
            myLabel.text! = String(describing: round(object.value*10)/10)
        }
        myLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 10)
        
        arrayOfLabelSensors.append(myLabel)
        self.view?.addSubview(myLabel)
    }
    
    
    /*
    func derivativeOf(fn: (Double)->Double, atX x: Double) -> Double {
        let h = 0.0000001
        return (fn(x + h) - fn(x))/h
    }
    
    func x_squared(x: Double) -> Double {
        return x * x
    }
    
    func velocity(v: Float, t: Float) -> Float {
        return
    }
    
    func saveSpace() -> CGFloat {
        
    }*/
}
