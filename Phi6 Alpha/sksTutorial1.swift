//
//  sksTutorial1.swift
//  Phi6 Alpha
//
//  Created by Gennaro Nappi on 23/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import SpriteKit
import GameplayKit
import MTCircularSlider

class sksTutorial1 : GameScene
{
    /*******************************************************/
    private var tut1_Steps = [SimpleFSM_State]()
    
    func InitStates()
    {
        let step1 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "perdindirindina", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        let step2 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "daghediogan", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        tut1_Steps.append(step1)
        tut1_Steps.append(step2)
    }
    /*******************************************************/
    //private var currentState: SimpleFSM_State!
    private var current: Int = 0
    private var loaded: Bool = false
    
    /*func SetCurrentState(state: SimpleFSM_State)
    {
        currentState = state
    }*/
    
    override func didMove(to view: SKView)
    {
        super.didMove(to: view)
        
        if !loaded
        {
            InitStates()
            loaded = true
            
            tut1_Steps[current].action()
        }
 
        /*let blurNode = CreateBlurEffectNode(position: CGPoint(x: 0, y: 0), blurAmount: 6.66)
        
        if let bgNode = self.childNode(withName: "background")
        {
            bgNode.removeFromParent()
            blurNode.addChild(bgNode)
        }
        
        self.addChild(blurNode)*/
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        var stepCompleted = false
        
        if current < tut1_Steps.count - 1
        {
            switch(tut1_Steps[current].type)
            {
                case .FOCUS, .POINT:
                    stepCompleted = true
                case .MOVE_TO_POINT:
                    // Qui devo controllare se lo slider ha superato un certo threshold
                    stepCompleted = false
                default:
                    stepCompleted = false
            }
            
            if stepCompleted
            {
                current += 1
                tut1_Steps[current].action()
            }
        }
        else
        {
            self.viewController.tutorialInfoView.isHidden = true
        }
    }
    
    func ChangeState(newState: SimpleFSM_State)
    {
        
    }
}
