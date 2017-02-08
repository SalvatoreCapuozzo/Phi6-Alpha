//
//  GameScene.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import SpriteKit
import GameplayKit
//import CircularSlider
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
    var sliderRotation2: MTCircularSlider!
    var sliderRotationLine: UISlider!
    var sliderFriction: UISlider!
    var myLabel: UILabel!
    var labelHeight: UILabel!
    var labelRotation: UILabel!
    var labelFriction: UILabel!
    var arrayOfSlider = [UISlider]()
    var arrayOfSliderHeight = [UISlider]()
    var arrayOfSliderRotation2 = [MTCircularSlider]()
    var arrayOfSliderRotationLine = [UISlider]()
    var arrayOfSliderFriction = [UISlider]()
    var arrayOfSensors = [Sensor]()
    var arrayOfLabel = [UILabel]()
    var arrayOfLabelHeight = [UILabel]()
    var arrayOfLabelRotation = [UILabel]()
    var arrayOfLabelFriction = [UILabel]()
    var arrayOfLabelSensors = [UILabel]()
    var arrayOfLabelTimer = [UILabel]()
    var arrayOfLabelLaser = [UILabel]()
    
    var labelInitV: UILabel!
    var sliderInitV: UISlider!
    var labelInitA: UILabel!
    var sliderInitA: UISlider!
    var arrayOfLabelInitV = [UILabel]()
    var arrayOfSliderInitV = [UISlider]()
    var arrayOfLabelInitA = [UILabel]()
    var arrayOfSliderInitA = [UISlider]()
    
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
    
    //costante della velocità della sfera
    let sphereVelocityConstant: Double = 30
    var sphereSpeedI: Double = 0
    var sphereSpeedF: Double = 27.78
    
    //variabile temporanea per il completamento dell'esercizio per il calcolo dello spazio percorso
    var timing: Double = 13.8
    var viewController: GameViewController!
    var alertMessage: Any?
    var adder = Adder()
    
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
        
        if let mode = viewController.mode{
            if mode == "learning"{
                //                let excerciseViewPosition: CGPoint = self.convertPoint(toView: CGPoint(x: 0, y: 0))
                //                viewController.createExcerciseTextView(position: excerciseViewPosition)
                let string = "vjhasddfbajsdbhasdbvkjhbsjhvbskhskhvhsdbvasvbsjkhvbsfhbvhasbvhabsvfsvbkfhsbfsbvhbfshvbasvbasbhasbhvbaskhvbsjhbkjhsbkjhsbdjkhfnajfnbxsbncjsbnvansbxfgbcfsbfvhasvbdndjfcbasdkhbfxnjasbnfjkabsjncabsdvjkfcbnbdfjsdbnfjnbsfncbjkxsbnfucbnsdfbnsjkdbnfcsdbcbjhsdbn"
                viewController.setTextInView(text: string)
            }
            else{
                viewController.excerciseTextView.isHidden = true
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
                        print(touchedWhere)
                        if let sprite = node as? SKSpriteNode {
                            if sprite == phisphere {
                                deleteSliders()
                                phisphere.position = touchLocation
                                adder.addInitSlider(scene: self)
                                myNode = sprite
                            } else {
                                for object in Singleton.shared.objects {
                                    if sprite == object {
                                        if !deleteMode {
                                            if object.name == "chronometer" {
                                                deleteSliders()
                                                object.physicsBody?.collisionBitMask = 1
                                                object.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
                                                object.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
                                                var number = 0
                                                for object in Singleton.shared.objects {
                                                    print(object.name!)
                                                    number += 1
                                                }
                                            } else if object.name == "speedCamera" || object.name == "laserAccelerometer" || object.name == "laserRangefinder" || object.name == "sensor" {
                                                deleteSliders()
                                                object.physicsBody?.collisionBitMask = 1
                                                object.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
                                                object.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
                                            } else if object.name == "loadCell" {
                                                deleteSliders()
                                                object.physicsBody?.collisionBitMask = 2
                                            }
//                                            print("Col: \(object.physicsBody?.collisionBitMask)")
                                            object.position = touchLocation
                                            selectedNode = object
                                            
                                            adder.addSlider(node: object, scene: self)
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
                                adder.addInitSlider(scene: self)
                                myNode = sprite
                            } else {
                                for object in Singleton.shared.objects {
                                    if sprite == object {
                                        object.position = touchLocation
                                        selectedNode = object
                                        
                                        adder.addSlider(node: object, scene: self)
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
    var shapeLayerL = CAShapeLayer()
    var shapeLayerR = CAShapeLayer()
    
    var beforeAfterPosition: [String: CGFloat] = ["final": 0, "initial": 0]
    var beforeAfterVelocityDx: [String: CGFloat] = ["final": 0, "initial": 0]
    var beforeAfterVelocityDy: [String: CGFloat] = ["final": 0, "initial": 0] // Aggiungere dy al nome
    var beforeAfterTime: [String: TimeInterval] = ["final": 0, "initial": 0]
    var currentTime: TimeInterval! = 0.04
    var deltaTime: CGFloat! = 0.04
    var phisphereVel: CGFloat = 0
    var phisphereAccDx: CGFloat = 0
    var phisphereAccDy: CGFloat = 0 // Aggiungere dy al nome
    var gravity: Bool = true
    
    // Update function
    override func update(_ currentTime: TimeInterval) {
        if !pause {
            //phisphere.physicsBody?.affectedByGravity = true
            
            // Da utilizzare in caso di assenza di gravità e velocità iniziale diversa da zero
            //phisphere.physicsBody?.velocity.dx = CGFloat(27.7*145)
            if sliderInitV != nil {
                if sliderInitA.value == 0 {
                    if counter < 0.2 {
                        phisphere.physicsBody?.velocity.dx = CGFloat(Float(sliderInitV.value))
                        print("Initial velocity: \((phisphere.physicsBody?.velocity.dx)!/145)")
                    }
                } else if sliderInitV.value == 0 {
                    phisphere.physicsBody?.velocity.dx = CGFloat(sliderInitA.value) * CGFloat(counter)
                    print(counter)
                } else {
                    sliderInitA.value = 0
                }
            }
            
            if gravity {
                phisphere.physicsBody?.affectedByGravity = true
            } else {
                phisphere.physicsBody?.affectedByGravity = false
            }
            phisphere.physicsBody?.collisionBitMask = 1
            phisphere.physicsBody?.categoryBitMask = PhysicsCategory.Phisphere
            phisphere.physicsBody?.contactTestBitMask = PhysicsCategory.Sensor
            
            
            for object in Singleton.shared.objects {
                object.physicsBody?.affectedByGravity = false
                if object.name == "sensor" {
                    object.physicsBody?.collisionBitMask = 1
                } else if object.name == "chronometer" {
                    object.physicsBody?.collisionBitMask = 1
                    object.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
                    object.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
                    let chronometer = (object as? Chronometer)!
                    chronometer.startTimer()
                    setValueDisplayChr(chronometer)
                } else if object.name == "laserRangefinder" {
                    object.physicsBody?.collisionBitMask = 1
                    object.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
                    object.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
                    let laser = (object as? LaserRangefinder)!
                    laser.setDistance(scene: self)
                    laser.laser(scene: self)
                    setValueDisplayRangefinder(laser)
                } else if object.name == "speedCamera" {
                    object.physicsBody?.collisionBitMask = 1
                    object.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
                    object.physicsBody?.contactTestBitMask = PhysicsCategory.Phisphere
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
        shapeLayerL.removeFromSuperlayer()
        shapeLayerR.removeFromSuperlayer()
        
        phisphereAccDx = 0
        phisphereAccDy = 0
        
        sliderInitA?.value = 0
        sliderInitV?.value = 0
        
        deleteSliders()
        
        if arrayOfLabelSensors.count >= 0 {
            for label in arrayOfLabelSensors {
                label.removeFromSuperview()
            }
            arrayOfLabelSensors.removeAll()
        }
        
        for sensor in arrayOfSensors {
            sensor.unset()
        }
        
        if arrayOfLabelTimer.count >= 0 {
            for label in arrayOfLabelTimer {
                label.removeFromSuperview()
            }
            arrayOfLabelTimer.removeAll()
        }
        if arrayOfLabelLaser.count >= 0 {
            for label in arrayOfLabelLaser {
                label.removeFromSuperview()
            }
            arrayOfLabelLaser.removeAll()
        }
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
            arrayOfSliderRotationLine.removeAll()
        }
        if arrayOfLabelRotation.count >= 0{
            for label in arrayOfLabelRotation{
                label.removeFromSuperview()
            }
            arrayOfLabelRotation.removeAll()
        }
        if arrayOfSliderInitV.count >= 0 {
            for slider in arrayOfSliderInitV {
                slider.removeFromSuperview()
            }
            arrayOfSliderInitV.removeAll()
        }
        if arrayOfLabelInitV.count >= 0 {
            for label in arrayOfLabelInitV {
                label.removeFromSuperview()
            }
            arrayOfLabelInitV.removeAll()
        }
        if arrayOfSliderInitA.count >= 0 {
            for slider in arrayOfSliderInitA {
                slider.removeFromSuperview()
            }
            arrayOfSliderInitA.removeAll()
        }
        if arrayOfLabelInitA.count >= 0 {
            for label in arrayOfLabelInitA {
                label.removeFromSuperview()
            }
            arrayOfLabelInitA.removeAll()
        }
        if arrayOfSliderFriction.count >= 0{
            for slider in arrayOfSliderFriction{
                slider.removeFromSuperview()
            }
            arrayOfSliderFriction.removeAll()
        }
        if arrayOfLabelFriction.count >= 0{
            for label in arrayOfLabelFriction{
                label.removeFromSuperview()
            }
            arrayOfLabelFriction.removeAll()
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
        
        myLabel.text! = String(describing: (round((myNode.size.width/145)*100)/100)) + " m"
        
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
        
        labelHeight.text! = String(describing: (round((myNode.size.height/145)*100)/100)) + " m"
        
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
        
        myLabel.text! = String(describing: (round((myNode.size.height/145)*100)/100)) + " m"
        
        addChild(myNode)
        
    }
    
    func setRotation() {
        if (myNode.name! == "object") {
            myNode.zRotation = CGFloat(-sliderRotationLine.value/360*2*Float(M_PI))
        }
        if (sliderRotationLine.value != 0) {
            labelRotation.text! = String(describing: round(-sliderRotationLine.value*10)/10) + "°"
        } else {
            labelRotation.text! = String(describing: 0)  + "°"
        }
    }
    
    func setFriction() {
        if (myNode.name! == "object") {
            myNode.physicsBody?.friction = CGFloat(sliderFriction.value)
        }
        labelFriction.text! = String(describing: round(((myNode.physicsBody?.friction)!/145)*100)/100)
        
        //addChild(myNode)
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
            
            if secondBody.node?.name! == "speedCamera" {
                timer2.invalidate()
                if let phisphereNode = firstBody.node as? SKSpriteNode, let
                    Sensor = secondBody.node as? SpeedCamera {
                    let velocity = (sqrt(pow((phisphereNode.physicsBody?.velocity.dx)!/145, 2) + pow((phisphereNode.physicsBody?.velocity.dy)!/145, 2))) + 0.08 // Margine di errore dovuto alla collisione
                    Sensor.setSpeedCameraValue(velocity)
                    
                    // Serve quando vogliamo una determinata velocità per avviare lo script dell'alert message
                    //Sensor.setSpeedCameraValue(CGFloat(sphereSpeedF))
                    
                    print("x velocity: \((phisphereNode.physicsBody?.velocity.dx)!/145)")
                    print("phi velocity: \(velocity)")

                    setValueDisplaySC(Sensor)
                    
                    //phisphere.physicsBody?.velocity.dx = 0
                    
                    // Alert Message
                    //alertMessage = Int((sphereSpeedF + sphereSpeedI)/2*timing)
                    //print( "la spazio vale: \(Int((sphereSpeedF + sphereSpeedI)/2*timing))")
                }
            } else if (secondBody.node?.name)! == "loadCell" && (secondBody.node?.position.y)! < (firstBody.node?.position.y)! - 10 {
                timer2.invalidate()
                if let phisphereNode = firstBody.node as? SKSpriteNode, let Sensor = secondBody.node as? LoadCell {
                    // Cheating time
                    let force: CGFloat
                    if gravity && phisphere.physicsBody?.velocity.dx == 0 {
                        force = (phisphereNode.physicsBody?.mass)! * 9.81
                    } else {
                        force = (phisphereNode.physicsBody?.mass)! * ((sqrt(pow(phisphereAccDx, 2)+pow(phisphereAccDy, 2)))/145)
                    }
                    Sensor.setLoadCellValue(force)
                    print(Sensor.value)
                    setValueDisplayLC(Sensor)
                }
            } else if secondBody.node?.name! == "laserAccelerometer" {
                timer2.invalidate()
                if let phisphereNode = firstBody.node as? SKSpriteNode, let
                    Sensor = secondBody.node as? LaserAccelerometer {
                    if Sensor.orientation == "Vertical" {
                        // Cheating time
                        let acceleration: CGFloat
                        if gravity && phisphereAccDx == 0 {
                            acceleration = 9.81
                        } else {
                            acceleration = ((sqrt(pow(phisphereAccDx, 2)+pow(phisphereAccDy, 2)))/145)
                        }
                        Sensor.setLaserAccelerometerValue(acceleration)
                        print(Sensor.value)
                        setValueDisplayLA(Sensor)
                    } else if Sensor.orientation == "Horizontal" {
                        let accelerationDx = phisphereAccDx/145
                        Sensor.setLaserAccelerometerValue(accelerationDx)
                        print(Sensor.value)
                        setValueDisplayLA(Sensor)
                    }
                }
            } else if secondBody.node?.name! == "sensor" {
                timer2.invalidate()
                if let phisphere = firstBody.node as? SKSpriteNode, let
                    Sensor = secondBody.node as? PhotoCell {
                    Sensor.setPhotoCellValue()
                }
            }
            //pause = true
            //viewController.showAlert()
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
        print("Velocity: \(object.value)")
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
    
    func setValueDisplayChr(_ object: Chronometer) {
        if arrayOfLabelTimer.count >= 0 {
            for label in arrayOfLabelTimer {
                label.removeFromSuperview()
            }
            arrayOfLabelTimer.removeAll()
        }
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        myLabel.layer.position = CGPoint(x: object.position.x + (self.frame.size.width / 2) + 30, y: -object.position.y + (self.frame.size.height / 2) + 15)
        myLabel.textColor! = UIColor.green
        myLabel?.text = String(describing: round(counter*10)/10)
        if myLabel.text != nil {
            myLabel.text! = String(describing: round(counter*10)/10)
        }
        myLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 10)
        
        arrayOfLabelTimer.append(myLabel)
        self.view?.addSubview(myLabel)
    }
    
    func setValueDisplayLA(_ object: LaserAccelerometer) {
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
    
    func setValueDisplayRangefinder(_ object: LaserRangefinder) {
        if arrayOfLabelLaser.count >= 0 {
            for label in arrayOfLabelLaser {
                label.removeFromSuperview()
            }
            arrayOfLabelLaser.removeAll()
        }
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        myLabel.layer.position = CGPoint(x: object.position.x + (self.frame.size.width / 2) + 30, y: -object.position.y + (self.frame.size.height / 2) - 15)
        myLabel.textColor! = UIColor.green
        myLabel?.text = String(describing: round(object.value*10)/10)
        if myLabel.text != nil {
            myLabel.text! = String(describing: round(object.value*10)/10)
        }
        myLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 10)
        
        arrayOfLabelLaser.append(myLabel)
        self.view?.addSubview(myLabel)
    }

    
    func setInitialV() {
        //print("SelectedNode is: " + selectedNode.name!)
        
        //print("Set width to " + myNode.name!)
        removeChildren(in: [myNode])
        
        //myNode.physicsBody?.velocity.dx = CGFloat(Float(textFieldV.text!)!)
        
        labelInitV.text! = String(describing: round((sliderInitV.value/145)*10)/10)
        if sliderInitV.value != 0 {
            //gravity = false
        }
        
        addChild(myNode)
        
    }
    
    func setInitialA() {
        removeChildren(in: [myNode])
        
        labelInitA.text! = String(describing: round((sliderInitA.value/145)*10)/10)
        if sliderInitA.value != 0 {
            //gravity = false
        }
        
        addChild(myNode)
        
    }
    
}
