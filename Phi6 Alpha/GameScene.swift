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
    
    var rotateRec = UIRotationGestureRecognizer()
    
    
    
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
    var arrayOfLabel = [UILabel]()
    var arrayOfLabelHeight = [UILabel]()
    var arrayOfLabelRotation = [UILabel]()
    
    var number: Int = 0
    var firstWidth: CGFloat!
    var deleteMode: Bool = false
    
    // Alternative method
    var objectWidth: CGFloat! = 50
    var objectHeight: CGFloat! = 50
    
    var firstScene: SKView? = nil
    
    override func didMove(to view: SKView) {
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
                    character.setScale(<#T##scale: CGFloat##CGFloat#>)
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
        
        rotateRec = UIRotationGestureRecognizer(target: self, action: #selector(rotated))
        self.view?.addGestureRecognizer(rotateRec)
        
        phisphere = childNode(withName: "phisphere") as! SKSpriteNode
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        pausePosition = phisphere.position
        pauseDiameter = phisphere.size.width
        pausePhiScale = phisphere.xScale
        pauseMass = phisphere.physicsBody?.mass
        
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
                                            object.position = touchLocation
                                            selectedNode = object
                                            //Singleton.shared.setWidth(myNode: object, scene: self)
                                            print(selectedNode)
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
                                        //Singleton.shared.setWidth(myNode: object, scene: self)
                                        print(selectedNode)
                                        
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
    var shapeLayer = CAShapeLayer()
    
    override func update(_ currentTime: TimeInterval) {
        if !pause {
            phisphere.physicsBody?.affectedByGravity = true
            for object in Singleton.shared.objects {
                object.physicsBody?.affectedByGravity = false
            }
            
            // Costruzione del vettore velocità
            var path = UIBezierPath()
            path.move(to: CGPoint(x: phisphere.position.x + (self.frame.size.width / 2), y: -phisphere.position.y + (self.frame.size.height / 2)))
            path.addLine(to: CGPoint(x: phisphere.position.x + (self.frame.size.width / 2) + (phisphere.physicsBody?.velocity.dx)!/5, y: -phisphere.position.y + (self.frame.size.height / 2) - (phisphere.physicsBody?.velocity.dy)!/5))
            
            // Inserimento nel layer
            
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.blue.cgColor
            shapeLayer.lineWidth = 4.0
            
            self.view?.layer.addSublayer(shapeLayer)
            
            /*
            var path = UIBezierPath()
            path.move(to: phisphere.position)
            path.addLine(to: CGPoint(x: phisphere.position.x + 10, y: phisphere.position.y + 10))
            path.close()
            UIColor.blue.set()
            path.stroke()
            path.fill()
            */
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
        
        shapeLayer.removeFromSuperlayer()
        
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
        sprite.physicsBody?.usesPreciseCollisionDetection = true
        
        sprite.size.width = objectWidth
        sprite.size.height = objectHeight
        sprite.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -objectWidth/2, y: -objectHeight/2, width: objectWidth, height: objectHeight))
        print(sprite.xScale)
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
        
        if sprite.name == nil {
            sprite.name = "sensor"// + String(number)
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
        mySlider?.maximumValue = 300
        mySlider?.minimumValue = 0.2
        mySlider?.value = Float(node.size.width)
        
        // Set Height Slider
        sliderHeight = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        sliderHeight?.layer.position = CGPoint(x: (self.view?.frame.width)!/4 - ((mySlider?.frame.width)!/8) , y: (self.view?.frame.height)!-15)
        sliderHeight?.backgroundColor = UIColor.clear
        sliderHeight?.layer.cornerRadius = 15.0
        sliderHeight?.layer.shadowOpacity = 0.5
        sliderHeight?.layer.masksToBounds = false
        sliderHeight?.maximumValue = 300
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
        myLabel?.text = String(describing: round(mySlider.value*10)/10) + " m"
        if let label = myLabel.text {
            myLabel.text! = String(describing: round(mySlider.value*10)/10) + " m"
        }
        
        // Set Height Label
        labelHeight = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        labelHeight.layer.position = CGPoint(x: (self.view?.frame.width)!/4 + ((mySlider?.frame.width)!/1.2), y: (self.view?.frame.height)!-15)
        labelHeight.textColor! = UIColor.black
        labelHeight?.text = String(describing: round(sliderHeight.value*10)/10) + " m"
        if let label = labelHeight.text {
            labelHeight.text! = String(describing: round(sliderHeight.value*10)/10) + " m"
        }
        
        // Set Rotation Label
        labelRotation = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        labelRotation.layer.position = CGPoint(x: (self.view?.frame.width)!/2 + ((mySlider?.frame.width)!*1.5), y: (self.view?.frame.height)!-15)
        labelRotation.textColor! = UIColor.black
        labelRotation?.text = String(describing: round(sliderRotationLine.value*10)/10) + "°"
        if let label = labelRotation.text {
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
        
        if (myNode.name! == "triangle") {
            print(myNode.xScale)
            myNode.xScale = CGFloat((mySlider?.value)!)/pauseTriangleWidth
        } else if (myNode.name! == "block") {
            print("MySlider: " + String(describing: mySlider.value))
            print(pauseBlockWidth)
            print("xScale: " + String(describing: myNode.xScale))
            print("Actual value / Default value")
            print(CGFloat(mySlider.value) / pauseBlockWidth)
            print("slider.val\(mySlider.value)")
            myNode.xScale = pauseXScale * CGFloat(mySlider.value) / pauseBlockWidth
            print("New width: " + String(describing: myNode.size.width))
        } else if (myNode.name! == "object") {
            
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
        
        myLabel.text! = String(describing: round(myNode.size.width*10)/10) + " m"
        
        addChild(myNode)
        
    }
    
    func setHeight2() {
        print("SelectedNode is: " + selectedNode.name!)
        
        print("Set height to " + myNode.name!)
        removeChildren(in: [myNode])
        
        if (myNode.name! == "triangle") {
            print(myNode.yScale)
            myNode.yScale = CGFloat((sliderHeight?.value)!)/pauseTriangleHeight
        } else if (myNode.name! == "block") {
            print("MySlider: " + String(describing: sliderHeight.value))
            print(pauseBlockHeight)
            print("yScale: " + String(describing: myNode.yScale))
            print("Actual value / Default value")
            print(CGFloat(sliderHeight.value) / pauseBlockHeight)
            print("slider.val\(sliderHeight.value)")
            myNode.yScale = pauseXScale * CGFloat(sliderHeight.value) / pauseBlockHeight
            print("New height: " + String(describing: myNode.size.height))
        } else if (myNode.name! == "object") {
            
            //myNode.yScale = 0.2 * CGFloat(sliderHeight.value) / 50
            myNode.size.height = CGFloat(sliderHeight.value)
            myNode.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -CGFloat(mySlider.value)/2, y: -CGFloat(sliderHeight.value)/2, width: CGFloat(mySlider.value), height: CGFloat(sliderHeight.value)))
            print("New height: " + String(describing: myNode.size.height))
        }
        //myNode.position.y = myNode.position.y - (myNode.size.height - CGFloat((sliderHeight?.value)!))/2
        
        labelHeight.text! = String(describing: round(myNode.size.height*10)/10) + " m"
        
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
        
        myLabel.text! = String(describing: round(myNode.size.height*10)/10) + " m"
        
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

}
