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
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                self.scene = scene
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
        } else {
            scene.stop()
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
    
    @IBAction func showObjects(_ sender: Any) {
        // self.showPausedMenu()
        
    }
    
    @IBAction func deleteSwitch(_ sender: Any) {
        scene.deleteSwitch()
    }
    
}
