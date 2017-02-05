//
//  GameViewController.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import VerticalSlider

class GameViewController: UIViewController {
    
    @IBOutlet weak var pauseButton: UIButton!
    var scene: GameScene!
    
    @IBOutlet var diameterSlider: VerticalSlider!
    @IBOutlet weak var diameterLabel: UILabel!
    
    @IBOutlet var massSlider: VerticalSlider!
    @IBOutlet weak var massLabel: UILabel!
    
    @IBOutlet weak var deleteSwitch: UISwitch!
    
    @IBOutlet weak var objectListView: ObjectTableViewController!
    
    var selectedNode: SKSpriteNode!
    var myNode: SKSpriteNode!
    
    var levelNumber: Int?
    // Da inserire programmaticamente come menù degli oggetti
    /* 
     Gli oggetti del menù sono:
     - Simple Objects
     - Linkers
     - Simple Machines
     - Vectors
     - Sensors
     - Special Objects
     
     */
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
//        print("level number: \(levelNumber!)")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                self.scene = scene
                scene.levelSelected = String(describing: self.levelNumber)
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            view.showsPhysics = true
            view.showsFields = true
        }
        if (selectedNode) != nil {
            selectedNode = scene.selectedNode
        } else {
            selectedNode = scene.triangle
        }
        
        
        //setWidth()
        //setHeight()
        setDiameter()
        setMass()
        diameterSlider.slider.addTarget(self, action: #selector(setDiameter), for: .valueChanged)
        massSlider.slider.addTarget(self, action: #selector(setMass), for: .valueChanged)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .landscape
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func pressPlay(_ sender: UIButton) {
        if scene.isStopped() {
            scene.play()
            pauseButton?.setTitle("Reset", for: UIControlState(rawValue: 0))
            scene.timer.invalidate()
            if scene.deltaTime == 0 {
                scene.timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            } else {
                scene.timer = Timer.scheduledTimer(timeInterval: TimeInterval(scene.deltaTime), target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            }
        } else {
            scene.stop()
            scene.timer.invalidate()
            scene.counter = 0
            pauseButton?.setTitle("Play", for: UIControlState(rawValue: 0))
            diameterSlider.value = Float(scene.pauseDiameter)
            diameterLabel.text! = String(describing: round(scene.pauseDiameter*10)/10)
        }
        
    }
    
    @IBAction func setDiameter() {
        scene.phisphere.position.x = scene.phisphere.position.x - (scene.phisphere.size.width - CGFloat(diameterSlider.value))/2
        //scene.phisphere.size.width = CGFloat(diameterSlider.value)
        scene.phisphere.position.y = scene.phisphere.position.y - (scene.phisphere.size.height - CGFloat(diameterSlider.value))/2
        //scene.phisphere.size.height = CGFloat(diameterSlider.value)
        
        scene.phisphere.xScale = CGFloat(diameterSlider.value)/scene.pauseDiameter
        scene.phisphere.yScale = CGFloat(diameterSlider.value)/scene.pauseDiameter
        
        diameterLabel.text! = String(describing: round(scene.phisphere.size.width*10)/10)
        
    }
    
    @IBAction func setMass() {
        scene.phisphere.physicsBody?.mass = CGFloat(massSlider.value)
        massLabel.text! = String(describing: round((scene.phisphere.physicsBody?.mass)!*10)/10)
    }
    
    @IBAction func addTriangle() {
        scene.addTriangle()
    }
    
    @IBAction func addRectangle() {
        scene.addRectangle()
    }
    
    @IBAction func addCircle() {
        scene.addCircle()
    }
    
    @IBAction func addPhotoCell() {
        scene.addPhotoCell()
    }
    
    @IBAction func addSpeedCamera() {
        scene.addSpeedCamera()
    }
    
    @IBAction func addLoadCell() {
        scene.addLoadCell()
    }
    
    @IBAction func showObjects(_ sender: Any) {
        // self.showPausedMenu()
        
    }
    
    @IBAction func deleteSwitch(_ sender: Any) {
        scene.deleteSwitch()
    }
    
    func timerAction() {
        scene.counter += 1
        scene.counter = round(scene.counter * 1000) / 1000
        //print("Running time: \(scene.counter)")
        if scene.beforeAfterPosition["final"] == 0 {
            scene.beforeAfterPosition["final"] = scene.phisphere.position.y
        }
         scene.beforeAfterPosition["initial"] = scene.beforeAfterPosition["final"]
         scene.beforeAfterPosition["final"] = scene.phisphere.position.y
         
        
         scene.beforeAfterTime["initial"] = scene.beforeAfterTime["final"]
         scene.beforeAfterTime["final"] = scene.currentTime
        scene.deltaTime = CGFloat(scene.beforeAfterTime["final"]! - scene.beforeAfterTime["initial"]!)
         print("--DeltaTime: \((scene.deltaTime)!)")
        
         
         scene.phisphereVel = CGFloat((scene.beforeAfterPosition["final"]! - scene.beforeAfterPosition["initial"]!) / (scene.deltaTime))
        //print("--Programmatic velocity: \(round(scene.phisphereVel*10)/10)")
        //print("--SpriteKit velocity: \(round((scene.phisphere.physicsBody?.velocity.dy)!*10)/10)")
        //print("----------")
        
        // The old final velocity becomes the new initial velocity
        scene.beforeAfterVelocity["initial"] = scene.beforeAfterVelocity["final"]
        // The new final velocity is the current velocity of the phisphere
        scene.beforeAfterVelocity["final"] = scene.phisphere.physicsBody?.velocity.dy
        
        // Definition of derivative
        scene.phisphereAcc = CGFloat((abs(scene.beforeAfterVelocity["final"]!) - abs(scene.beforeAfterVelocity["initial"]!)) / (scene.deltaTime))
        print("--Programmatic acceleration: \(round(scene.phisphereAcc*1000)/1000)")
        print("----------")
        

    }
}
