//
//  BaseTutorialScene.swift
//  Phi6 Alpha
//
//  Created by Gennaro Nappi on 24/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import SpriteKit

protocol TutorialScene
{
    var tutorialSteps: [SimpleFSM_State] { get set }
    var currentStep: Int { get set }
    
    func InitStates()
}

class BaseTutorialScene : GameScene, TutorialScene
{
    
    internal var tutorialSteps: [SimpleFSM_State] = [SimpleFSM_State]()
    internal var currentStep: Int = 0
    
    // DA OVERRIDARE PER LE TUTORIAL SCENE
    internal func InitStates()
    {
        
    }
    
    private var loaded: Bool = false
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        var stepCompleted = false
        
        if currentStep < tutorialSteps.count - 1
        {
            switch(tutorialSteps[currentStep].type)
            {
                case .FOCUS, .POINT:
                    stepCompleted = true
                // Qui devo controllare se lo slider ha superato un certo threshold
                case .MOVE_TO_POINT:
                    stepCompleted = false
                    /*case .CREATE_OBJECT:
                     if search(nome)
                     {
                     stepCompleted = true
                     }*/
                case .ADD:
                    if Search(name: neededObject) {
                        stepCompleted = true
                    } else {
                        stepCompleted = false
                    }
                case .ROTATE:
                    if Rotate(name: neededObject) {
                        stepCompleted = true
                    } else {
                        stepCompleted = false
                    }
                case .ACTIVATE:
                    if Activate(name: neededObject) {
                        stepCompleted = true
                    } else {
                        stepCompleted = false
                    }
                case .CONDITION:
                    stepCompleted = tutorialSteps[currentStep].ConditionSatisfied()
                default:
                    stepCompleted = false
            }
            
            if stepCompleted
            {
                currentStep += 1
                self.viewController.tutorialInfoView.isHidden = true
                self.viewController.pointerImg.isHidden = true
                self.viewController.pointerTapImg.isHidden = true
                self.viewController.pointerHoldImg.isHidden = true
                for subview in (self.view?.subviews)! {
                    if subview.tag == 100 || subview.tag == 101 {
                        // 100 is ContMenu, 101 is Selector
                        subview.removeFromSuperview()
                    }
                }
                tutorialSteps[currentStep].action()
            }
        }
        else
        {
            self.viewController.tutorialInfoView.isHidden = true
            self.viewController.pointerImg.isHidden = true
            self.viewController.pointerTapImg.isHidden = true
            self.viewController.pointerHoldImg.isHidden = true
            for subview in (self.view?.subviews)! {
                if subview.tag == 100 || subview.tag == 101 {
                    // 100 is ContMenu, 101 is Selector
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    override func didMove(to view: SKView)
    {
        super.didMove(to: view)
        
        if !loaded
        {
            // Blocca le modifiche alle sfera
            self.locked = true
            self.editable = false
            // Inizializza l'FSM
            InitStates()
            loaded = true
            
            tutorialSteps[currentStep].action()
        }
    }
}
