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
    override func InitStates()
    {
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
    }
}
