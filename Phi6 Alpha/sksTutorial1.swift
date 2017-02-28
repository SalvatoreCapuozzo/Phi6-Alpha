//
//  sksTutorial1.swift
//  Phi6 Alpha
//
//  Created by Gennaro Nappi on 23/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit

class sksTutorial1 : BaseTutorialScene
{
    private var phiSpherePosition: CGPoint!
    private var phiVelInitialPos: CGFloat!
    
    override func InitStates()
    {
        phiSpherePosition = self.viewController.scene.phisphere.position
        phiVelInitialPos = self.viewController.scene.phisphere.physicsBody?.velocity.dx
        
        self.viewController.BlockAllInteractions()
        
        let step0 = SimpleFSM_State(stateType: .FOCUS)
        {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "Hey, you! Yes, you!\nWelcome to Phi6's Basics Tutorial!\nI'm going to guide you through the interface and the interactions you can accomplish within the simulator.\nTap to proceed.", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0), scene: self)
        }
        
        let step1 = SimpleFSM_State(stateType: .FOCUS)
        {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "This right here is the PhiSphere, you're going to be familiar with it soon.", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0), scene: self)
            
            Point(pointer: self.viewController.pointerImg, obj: self.childNode(withName: "phisphere")!, offset: CGPoint(x: self.frame.size.width / 2 + 7, y: 40))
            
            let startingPointerPos = self.viewController.pointerImg.frame.origin
            
            UIView.animate(withDuration: 1.5, animations:
            {
                self.viewController.pointerImg.frame.origin.y = startingPointerPos.y - 70
            })
        }
        
        let step2 = SimpleFSM_State(stateType: .FOCUS)
        {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "By tapping here, you can find help about the current simulation.\nTry it!", offset: CGPoint(x: 0, y: 0), scene: self)
            
            self.viewController.infoButton.isEnabled = true
        }
        
        let step3 = SimpleFSM_State(stateType: .FOCUS)
        {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.slowMotionButton, text: "This one right here allows you to slow the simulation's time.\nIt's turned OFF by default.", offset: CGPoint(x: 0, y: self.viewController.slowMotionButton.frame.height/4 + 5), scene: self)
            
            self.viewController.slowMotionButton.isEnabled = true
        }
        
        let step4 = SimpleFSM_State(stateType: .FOCUS)
        {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.gravityButton, text: "Fancy using no gravity at all? Fear no more!\nTapping this, you can switch gravity ON and OFF.", offset: CGPoint(x: self.frame.size.width - 2*self.viewController.gravityButton.frame.width + 5, y: 2), scene: self)
            
            self.viewController.gravityButton.isEnabled = true
        }
        
        let step5 = SimpleFSM_State(stateType: .FOCUS)
        {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.slowMotionButton, text: "These 2 neat arrow buttons allow you to turn ON and OFF the graphical visualization of the acceleration and velocity vectors.", offset: CGPoint(x: 2*self.viewController.gravityButton.frame.width - 5, y: self.viewController.slowMotionButton.frame.height/4 + 5 - 2*self.viewController.gravityButton.frame.height + 10), scene: self)
            
            
            //CGPoint(x: self.frame.size.width - 2*self.viewController.velButton.frame.width, y: -self.frame.size.height + 2*self.viewController.velButton.frame.height)
            //self.viewController.accButton.isEnabled = true
            //self.viewController.velButton.isEnabled = true
        }
        
        let step6 = SimpleFSM_State(stateType: .FOCUS)
        {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.pauseButton, text: "You can run the current simulation with this button!", offset: CGPoint(x: self.frame.size.width - 2*self.viewController.pauseButton.frame.width + 5, y: -self.frame.size.height + 2*self.viewController.pauseButton.frame.height + 9), scene: self)
            
            self.viewController.pauseButton.isEnabled = true
        }
        
        let step7 = SimpleFSM_State(stateType: .CONDITION)
        {
        }
        step7.SetCondition()
        {
            return self.viewController.simulatorTest.started && self.viewController.simulatorTest.stopped
        }
        
        let step8 = SimpleFSM_State(stateType: .FOCUS)
        {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "Nice try!", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0))
        }
        
        let step9 = SimpleFSM_State(stateType: .FOCUS)
        {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "Let's make things a bit more fun, shall we?\nI'll make the PhiSphere editable. Just. For. YOU!", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0))
            
            
        }
        
        let step10 = SimpleFSM_State(stateType: .FOCUS)
        {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "Tap and hold on the PhiSphere to move it around!", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0))
            
            Point(pointer: self.viewController.pointerImg, obj: self.childNode(withName: "phisphere")!, offset: CGPoint(x: self.frame.size.width / 2 + 7, y: 40))
            
            let startingPointerPos = self.viewController.pointerImg.frame.origin
            
            UIView.animate(withDuration: 1.5, animations:
            {
                self.viewController.pointerImg.frame.origin.y = startingPointerPos.y - 75
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                Tap(pointer: self.viewController.pointerImg, pointerTap: self.viewController.pointerTapImg, offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
                self.viewController.pointerImg.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.viewController.pointerTapImg.isHidden = true
            })
            self.viewController.scene.locked = false
            self.viewController.scene.editable = true
        }
        
        let step11 = SimpleFSM_State(stateType: .CONDITION)
        {
        }
        step11.SetCondition()
        {
            let phiPos = self.viewController.scene.phisphere.position
            
            if Int(phiPos.x) != Int(self.phiSpherePosition.x) || Int(phiPos.y) != Int(self.phiSpherePosition.y)
            {
                return true
            }
            
            return false
        }
        
        let step12 = SimpleFSM_State(stateType: .FOCUS)
        {
            self.viewController.scene.deleteSliders()
            
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "Good job!\nNow tap again on it to edit it.\nI'll show you how!\nJust tap onto the slider's handle and move it on its line to change PhiSphere's properties.", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0), scene: self)
            print(self.viewController.scene.sliderInitV.frame.origin)
        }
        
        let step13 = SimpleFSM_State(stateType: .POINT)
        {
            self.viewController.adder.addInitSlider(scene: self.viewController.scene)
            /*
            Point(pointer: self.viewController.pointerImg, obj: self.viewController.scene.phisphere, offset: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height/2))
            
            self.viewController.pointerImg.frame.origin = CGPoint(x: self.viewController.pointerImg.frame.origin.x + 7 + 2*self.viewController.scene.phisphere.frame.size.width + 74, y: self.viewController.pointerImg.frame.origin.y + 40)
            
            */
            Point(pointer: self.viewController.pointerImg, obj: self.viewController.scene.sliderInitV, offset: CGPoint(x: self.frame.size.width / 2, y: 0))
           // let startingPointerPos = self.viewController.pointerImg.frame.origin
            self.viewController.pointerImg.frame.origin = CGPoint(x: self.viewController.scene.sliderInitV.frame.origin.x + 28, y: self.viewController.scene.sliderInitV.frame.origin.y + 38)
            let startingPointerPos = self.viewController.pointerImg.frame.origin

            
            UIView.animate(withDuration: 1.5, animations:
            {
                self.viewController.pointerImg.frame.origin.y = startingPointerPos.y - 40
            }, completion:
            {
                done in
                
                if done
                {
                    UIView.animate(withDuration: 1, animations:
                    {
                        self.viewController.pointerImg.frame.origin.x = startingPointerPos.x + 50
                    })
                }
            })
        }
        
        let step14 = SimpleFSM_State(stateType: .CONDITION)
        {
            
        }
        step14.SetCondition()
        {
            return self.viewController.scene.sliderInitV.value > Float(self.phiVelInitialPos)
        }
        
        let step15 = SimpleFSM_State(stateType: .FOCUS)
        {
            self.viewController.simulatorTest = (false, false)
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.pauseButton, text: "Try the changes by running the simulation again!", offset: CGPoint(x: self.frame.size.width - 2*self.viewController.pauseButton.frame.width + 5, y: -self.frame.size.height + 2*self.viewController.pauseButton.frame.height + 9), scene: self)
            
            self.viewController.pauseButton.isEnabled = true
        }
        
        let step16 = SimpleFSM_State(stateType: .CONDITION)
        {
        }
        step16.SetCondition()
            {
                
                return self.viewController.simulatorTest.started && self.viewController.simulatorTest.stopped
        }

        
        let step17 = SimpleFSM_State(stateType: .FOCUS)
        {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "Congratulations!\nNow you know the basics of Phi6's simulator.\nOn the left you can find a blocknote on which you can copy and paste stuff as needed, simply drag it from its position!", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0))
        }
        
        let step18 = SimpleFSM_State(stateType: .FOCUS)
        {
            self.neededObject = "object"
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "Now get ready for the juicy part of this tutorial:...", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0))
        }
        
        let step19 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "... the Object Contextual Menu!\nOpen in by holding your finger on whatever part of the screen for 2 seconds and select the 'Rectangular Block' by releasing the finger.", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            
        }
        
        let step20 = SimpleFSM_State(stateType: .ADD) {
            Point(pointer: self.viewController.pointerImg, offset: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), scene: self)
            
            let startingPointerPos = self.viewController.pointerImg.frame.origin
            
            UIView.animate(withDuration: 1.5, animations: {
                self.viewController.pointerImg.frame.origin.y = startingPointerPos.y - 60
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.75, execute: {
                Hold(pointer: self.viewController.pointerImg, pointerHold: self.viewController.pointerHoldImg, offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
                self.viewController.pointerImg.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                let startingPointerPos = self.viewController.pointerHoldImg.frame.origin
                
                UIView.animate(withDuration: 1, animations: {
                    self.viewController.pointerHoldImg.frame.origin.x = startingPointerPos.x - 35
                    self.viewController.pointerHoldImg.frame.origin.y = startingPointerPos.y - 60
                })
            })
            
        }
        
        let step21 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "object")!, text: "This object is a static block. If you tap on it, sliders for width, height, rotation and friction of the block will appear.\nHave fun with these sliders in the Sandbox!", offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
        }
        
        let step22 = SimpleFSM_State(stateType: .FOCUS)
        {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "One last thing: remember the Info button on top left? It had a hint ;)\nGo and have fun!", offset: CGPoint(x: self.frame.size.width / 2 + self.phisphere.size.width, y: 0))
        }
        
        tutorialSteps.append(step0)
        tutorialSteps.append(step1)
        tutorialSteps.append(step2)
        tutorialSteps.append(step3)
        tutorialSteps.append(step4)
        tutorialSteps.append(step5)
        tutorialSteps.append(step6)
        tutorialSteps.append(step7)
        tutorialSteps.append(step8)
        tutorialSteps.append(step9)
        tutorialSteps.append(step10)
        tutorialSteps.append(step11)
        tutorialSteps.append(step12)
        tutorialSteps.append(step13)
        tutorialSteps.append(step14)
        tutorialSteps.append(step15)
        tutorialSteps.append(step16)
        tutorialSteps.append(step17)
        tutorialSteps.append(step18)
        tutorialSteps.append(step19)
        tutorialSteps.append(step20)
        tutorialSteps.append(step21)
        tutorialSteps.append(step22)
    }
}
