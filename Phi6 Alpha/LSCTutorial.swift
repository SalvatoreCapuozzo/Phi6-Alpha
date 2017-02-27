//
//  LSCTutorial.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 26/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit

class LSCTutorial : BaseTutorialScene {
    override func InitStates() {
        /*
        let step1 = SimpleFSM_State(stateType: .POINT) {
            Point(pointer: self.viewController.pointerImg, obj: self.childNode(withName: "phisphere")!, offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            
            let startingPointerPos = self.viewController.pointerImg.frame.origin
            
            UIView.animate(withDuration: 1.5, animations: {
                self.viewController.pointerImg.frame.origin.y = startingPointerPos.y - 60
            })
        }
        
        let step2 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "perdindirindina", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        let step3 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "daghediogan", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        tutorialSteps.append(step2)
        tutorialSteps.append(step1)
        tutorialSteps.append(step3)
 */
        let step1 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "Now you should be able to create your own path with blocks, but what about PhiSphere properties?", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        let step2 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "In the real world physicists use devices called 'Sensors'...", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        let step3 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "... so do you!", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        neededObject = "sensor"
        
        let step4 = SimpleFSM_State(stateType: .ADD) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "Let's insert your first sensor!", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            
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
                    self.viewController.pointerHoldImg.frame.origin.x = startingPointerPos.x + 70
                    self.viewController.pointerHoldImg.frame.origin.y = startingPointerPos.y - 20
                })
            })
            
        }
        
        let step5 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "sensor")!, text: "This is called 'Laser Photo Cell'.\nThis sensor detects the passage of the PhiSphere and turns its red laser in green, in order to let you know that PhiSphere has been there.", offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
        }
        
        let step6 = SimpleFSM_State(stateType: .ROTATE) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "This sensor can be rotated, just tap the Laser Photo Cell and change sensor orientation with the slider.", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        let step7 = SimpleFSM_State(stateType: .ACTIVATE) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "Now play the simulation and make the PhiSphere cross the Laser Photo Cell.", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            Point(pointer: self.viewController.pointerImg, offset: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), scene: self)
            
            UIView.animate(withDuration: 2, animations: {
                self.viewController.pointerImg.frame.origin.x = self.frame.size.width - 2*self.viewController.pauseButton.frame.size.width - 19
                self.viewController.pointerImg.frame.origin.y = self.frame.size.height - 2*self.viewController.pauseButton.frame.size.height - 2

            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                Tap(pointer: self.viewController.pointerImg, pointerTap: self.viewController.pointerTapImg, offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
                self.viewController.pointerImg.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5, execute: {
                self.viewController.pointerTapImg.isHidden = true
            })

        }

        // Qui termina la prima parte
        
        let step8 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "Great! Now get prepared for the next object:...", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            // Cambia l'oggetto principale
            self.neededObject = "chronometer"
            self.viewController.pressPlay()
        }
        
        let step9 = SimpleFSM_State(stateType: .ADD) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "... the Chronometer!", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            
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
                    self.viewController.pointerHoldImg.frame.origin.x = startingPointerPos.x - 20
                    self.viewController.pointerHoldImg.frame.origin.y = startingPointerPos.y + 80
                })
            })
            
        }
        
        let step10 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "chronometer")!, text: "A 'Chronometer' is an object that allows you to take the time from the beginning of the simulation to the activation of a sensor.", offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
        }
        
        let step11 = SimpleFSM_State(stateType: .ACTIVATE) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "In this case, when the PhiSphere crosses the Laser Photo Cell.\nPlay the simulation again.", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            Point(pointer: self.viewController.pointerImg, offset: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), scene: self)
            
            UIView.animate(withDuration: 2, animations: {
                self.viewController.pointerImg.frame.origin.x = self.frame.size.width - 2*self.viewController.pauseButton.frame.size.width - 19
                self.viewController.pointerImg.frame.origin.y = self.frame.size.height - 2*self.viewController.pauseButton.frame.size.height - 2
                
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                Tap(pointer: self.viewController.pointerImg, pointerTap: self.viewController.pointerTapImg, offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
                self.viewController.pointerImg.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5, execute: {
                self.viewController.pointerTapImg.isHidden = true
            })
            
        }
        
        let step12 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "chronometer")!, text: "As you can see, the timer stopped when the PhiSphere activated the sensor.", offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
        }
        
        // Qui termina la seconda parte
        
        let step13 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "Let's move on the last sensor shown in this tutorial:...", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            // Cambia l'oggetto principale
            self.neededObject = "speedCamera"
            self.viewController.pressPlay()
        }
        
        let step14 = SimpleFSM_State(stateType: .ADD) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "... the Speed Camera!", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            
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
                    self.viewController.pointerHoldImg.frame.origin.x = startingPointerPos.x + 70
                    self.viewController.pointerHoldImg.frame.origin.y = startingPointerPos.y + 10
                })
            })
            
        }
        
        let step15 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "speedCamera")!, text: "A 'Speed Camera' is a sensor of velocity. As soon as the PhiSphere passes by this sensor, it will calculate the instantaneous velocity.", offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
        }
        
        let step16 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "Now, instead of using both a Laser Photo Cell and a Chronometer to calculate velocity, you can use directly this new sensor. Neat!", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        let step17 = SimpleFSM_State(stateType: .ACTIVATE) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "Put the Speed Camera in order to calculate velocity of the PhiSphere and play the simulation again.", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            Point(pointer: self.viewController.pointerImg, offset: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), scene: self)
            
            UIView.animate(withDuration: 2, animations: {
                self.viewController.pointerImg.frame.origin.x = self.frame.size.width - 2*self.viewController.pauseButton.frame.size.width - 19
                self.viewController.pointerImg.frame.origin.y = self.frame.size.height - 2*self.viewController.pauseButton.frame.size.height - 2
                
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                Tap(pointer: self.viewController.pointerImg, pointerTap: self.viewController.pointerTapImg, offset: CGPoint(x: self.frame.size.width / 2, y: 0), scene: self)
                self.viewController.pointerImg.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5, execute: {
                self.viewController.pointerTapImg.isHidden = true
            })
            
        }
        
        let step18 = SimpleFSM_State(stateType: .FOCUS) {
            Tap(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "That is the end of this tutorial: congratulations!", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
            self.viewController.pressPlay()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.viewController.goBack()
            })
        }

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

    }
}
