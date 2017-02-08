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
import iOSContextualMenu

class GameViewController: UIViewController, SKSceneDelegate, UIGestureRecognizerDelegate, BAMContextualMenuDelegate, BAMContextualMenuDataSource {
    
    @IBOutlet var topView: SKView?
    
    @IBOutlet weak var pauseButton: UIButton!
    var scene: GameScene!
    
    @IBOutlet var diameterSlider: VerticalSlider!
    @IBOutlet weak var diameterLabel: UILabel!
    
    @IBOutlet var massSlider: VerticalSlider!
    @IBOutlet weak var massLabel: UILabel!
    
    @IBOutlet weak var deleteSwitch: UISwitch!
    
    @IBOutlet weak var objectListView: ObjectTableViewController!
    
    @IBOutlet weak var gravityButton: UIButton!
    
    var selectedNode: SKSpriteNode!
    var myNode: SKSpriteNode!
    
    var mode: String?
    var category: Int?
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
    
    @IBOutlet var excerciseTextView: UITextView!
    var adder = Adder()
    var centerOriginView: CGPoint?
    
    let arrayOfSensors = [
        "PhotoCellDefault",
        "SpeedCamera",
        "Circle",
        "Rectangle",
        "LoadCell",
        "Chronometer",
        "LaserRangefinder(H)",
        "LaserAccelerometer(V)",
        "Lever",
        "Pendulum"
    ]
    
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
                scene.viewController = self
                
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
        
        
        centerOriginView = excerciseTextView.frame.origin
        
        let gestureRight = UISwipeGestureRecognizer(target: self, action: #selector(moveViewGesture))
        //        gestureRight.delegate = self
        gestureRight.direction = .right
        excerciseTextView.addGestureRecognizer(gestureRight)
        
        let gestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(returnViewGesture))
        //        gestureLeft.delegate = self
        gestureLeft.direction = .left
        excerciseTextView.addGestureRecognizer(gestureLeft)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        BAMContextualMenu.add(to: topView, delegate: self, dataSource: self, activateOption: kBAMContextualMenuActivateOptionLongPress)
    }
    
    func numberOfContextualMenuItems() -> UInt {
        return UInt(arrayOfSensors.count)
    }
    
    func contextualMenu(_ contextualMenu: BAMContextualMenu!, viewForMenuItemAt index: UInt) -> UIView! {
        
        let image = UIImage(named: arrayOfSensors[Int(index)])
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = (imageView.image?.size.height)! / 2
        imageView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        
        return imageView
    }
    
    func contextualMenu(_ contextualMenu: BAMContextualMenu!, didSelectItemAt index: UInt) {
        
        let selected = arrayOfSensors[Int(index)]
        
        switch selected {
        case "SpeedCamera":
            addSpeedCamera()
        case "LoadCell":
            addLoadCell()
        case "PhotoCellDefault":
            addPhotoCell()
        case "Circle":
            addCircle()
        case "Rectangle":
            addRectangle()
        case "Chronometer":
            addChronometer()
        case "LaserRangefinder(H)":
            addLaserRangefinder()
        case "LaserAccelerometer(V)":
            addLaserAccelerometer()
        case "Lever":
            addLever()
        case "Pendulum":
            addPendulum()
        default:
            print("dio cane")
        }
    }
    
    func contextualMenuActivated(_ contextualMenu: BAMContextualMenu!) {
        
        print("menu attivo")
    }
    
    func moveViewGesture(){
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            
            let offsetX = (UIScreen.main.bounds.width - 30)
            
            self.excerciseTextView.frame = CGRect(x: offsetX, y: self.excerciseTextView.frame.origin.y, width: self.excerciseTextView.frame.width, height: self.excerciseTextView.frame.height)
            
        }, completion: nil)
    }
    
    func returnViewGesture(){
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            
            self.excerciseTextView.frame = CGRect(x: (self.centerOriginView?.x)!, y: self.excerciseTextView.frame.origin.y, width: self.excerciseTextView.frame.width, height: self.excerciseTextView.frame.height)
            
        }, completion: nil)
    }
    
    func setTextInView(text: String){
        excerciseTextView.text = text
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
            scene.timer2 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction2), userInfo: nil, repeats: true)
            
        } else {
            scene.stop()
            scene.timer.invalidate()
            scene.timer2.invalidate()
            scene.counter = 0
            pauseButton?.setTitle("Play", for: UIControlState(rawValue: 0))
            diameterSlider.value = Float(scene.pauseDiameter)
            diameterLabel.text! = String(describing: round((scene.pauseDiameter/145)*100)/100)
        }
    }
    
    @IBAction func setDiameter() {
        scene.phisphere.position.x = scene.phisphere.position.x - (scene.phisphere.size.width - CGFloat(diameterSlider.value))/2
        //scene.phisphere.size.width = CGFloat(diameterSlider.value)
        scene.phisphere.position.y = scene.phisphere.position.y - (scene.phisphere.size.height - CGFloat(diameterSlider.value))/2
        //scene.phisphere.size.height = CGFloat(diameterSlider.value)
        
        scene.phisphere.xScale = CGFloat(diameterSlider.value)/scene.pauseDiameter
        scene.phisphere.yScale = CGFloat(diameterSlider.value)/scene.pauseDiameter
        
        diameterLabel.text! = String(describing: round((scene.phisphere.size.width/145)*100)/100)
        
    }
    
    @IBAction func setMass() {
        scene.phisphere.physicsBody?.mass = CGFloat(massSlider.value)
        massLabel.text! = String(describing: round((scene.phisphere.physicsBody?.mass)!*10)/10)
    }
    
    @IBAction func addRectangle() {
        adder.addRectangle(scene: scene)
    }
    
    @IBAction func addCircle() {
        adder.addCircle(scene: scene)
    }
    
    @IBAction func addPhotoCell() {
        adder.addPhotoCell(scene: scene)
    }
    
    @IBAction func addSpeedCamera() {
        adder.addSpeedCamera(scene: scene)
    }
    
    @IBAction func addLoadCell() {
        adder.addLoadCell(scene: scene)
    }
    
    @IBAction func addChronometer() {
        adder.addChronometer(scene: scene)
    }
    
    @IBAction func addLaserAccelerometer() {
        adder.addLaserAccelerometer(scene: scene)
    }
    
    @IBAction func addLaserRangefinder() {
        adder.addLaserRangefinder(scene: scene)
    }
    
    @IBAction func addLever() {
        adder.addLever(scene: scene)
    }
    
    @IBAction func addPendulum() {
        adder.addPendulum(scene: scene)
    }
    
    @IBAction func showObjects(_ sender: Any) {
        // self.showPausedMenu()
        
    }
    
    @IBAction func deleteSwitch(_ sender: Any) {
        scene.deleteSwitch()
    }
    
    @IBAction func setGravity() {
        if scene.gravity {
            scene.gravity = false
            gravityButton.setBackgroundImage(UIImage(named: "nogravity"), for: UIControlState(rawValue: 0))
        } else {
            scene.gravity = true
            gravityButton.setBackgroundImage(UIImage(named: "gravity"), for: UIControlState(rawValue: 0))
        }
    }

    
    func timerAction() {
        //scene.counter += Double(scene.deltaTime)
        //scene.counter = round(scene.counter * 1000) / 1000
        //print("Running time: \(scene.counter)")
        if scene.beforeAfterPosition["final"] == 0 {
            scene.beforeAfterPosition["final"] = scene.phisphere.position.y
        }
         scene.beforeAfterPosition["initial"] = scene.beforeAfterPosition["final"]
         scene.beforeAfterPosition["final"] = scene.phisphere.position.y
         
        
         scene.beforeAfterTime["initial"] = scene.beforeAfterTime["final"]
         scene.beforeAfterTime["final"] = scene.currentTime
        scene.deltaTime = CGFloat(scene.beforeAfterTime["final"]! - scene.beforeAfterTime["initial"]!)
        //print("--DeltaTime: \((scene.deltaTime)!)")
        
         
         scene.phisphereVel = CGFloat((scene.beforeAfterPosition["final"]! - scene.beforeAfterPosition["initial"]!) / (scene.deltaTime))
        //print("--Programmatic velocity: \(round(scene.phisphereVel*10)/10)")
        //print("--SpriteKit velocity: \(round((scene.phisphere.physicsBody?.velocity.dy)!*10)/10)")
        //print("----------")
        
        // The old final velocity becomes the new initial velocity
        scene.beforeAfterVelocityDx["initial"] = scene.beforeAfterVelocityDx["final"]
        scene.beforeAfterVelocityDy["initial"] = scene.beforeAfterVelocityDy["final"]
        // The new final velocity is the current velocity of the phisphere
        scene.beforeAfterVelocityDx["final"] = scene.phisphere.physicsBody?.velocity.dx
        scene.beforeAfterVelocityDy["final"] = scene.phisphere.physicsBody?.velocity.dy
        
        // Definition of derivative
        scene.phisphereAccDx = CGFloat(((scene.beforeAfterVelocityDx["final"]!) - (scene.beforeAfterVelocityDx["initial"]!)) / (scene.deltaTime))
        scene.phisphereAccDy = CGFloat(((scene.beforeAfterVelocityDy["final"]!) - (scene.beforeAfterVelocityDy["initial"]!)) / (scene.deltaTime))
        //print("--Programmatic acceleration: \(round(scene.phisphereAcc*1000)/1000)")
        //print("----------")
        
    }
    
    func timerAction2() {
        scene.counter += 0.1
        print("Running time: \(scene.counter)")
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showAlert(){
        print("ciao")
        
        var alert = UIAlertController()
        var action = UIAlertAction()
            alert = UIAlertController(title: "Great!", message: "Result: \(scene.alertMessage!)", preferredStyle: .alert)
            action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
    }
    
//    func createExcerciseTextView(position: CGPoint){
//        
//        let myView = UIView(frame: CGRect(x: position.x, y: position.y, width: 200, height: 130))
//        myView.backgroundColor = UIColor.darkGray
//        myView.center = position
//        self.scene.view?.addSubview(myView)
////        myView.bringSubview(toFront: self.scene.view!)
//        
//        setViewTextField(view: myView)
//    }
//    
//    func setViewTextField(view: UIView){
//        
//        let width = view.frame.width - 1
//        let height = view.frame.height - 1
//        
//        let frame = CGRect(x: 0, y: 0, width: width, height: height)
//        
//        let textField = UITextField(frame: frame)
//        textField.textColor = UIColor.red
//        textField.text = "VAFAMMOCC A MAAAAAAAAAAAMMT"
//        textField.center = view.center
//        
//        textField.sizeThatFits(textField.frame.size)
//        
//        self.scene.view?.addSubview(textField)
//        
//    }
    
}
