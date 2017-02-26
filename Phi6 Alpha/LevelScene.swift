//
//  LevelScene.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 24/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import SpriteKit
import GameplayKit
//import CircularSlider
import MTCircularSlider

class LevelScene: GameScene {
    var tutView: UIView!
    var tutLabel: UILabel!
    var created = false
    override func sceneDidLoad() {
        locked = true
        editable = false
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !created {
            tutView = UIView(frame: CGRect(x: self.size.width/2, y: self.size.height/2, width: 300, height: 100))
            tutView.backgroundColor = UIColor.white
            tutView.layer.position = CGPoint(x: 400, y: 100)
            tutView.alpha = 0.5
            self.view?.addSubview(tutView)
            
            tutLabel = UILabel(frame: CGRect(x: self.size.width/2, y: self.size.height/2, width: tutView.frame.size.width - 20, height: tutView.frame.size.height - 20))
            tutLabel.layer.position = tutView.layer.position
            tutLabel.textColor = UIColor.black
            tutLabel?.text = "Hello World!"
            self.view?.addSubview(tutLabel)
            
            created = true
        }
    }
}
