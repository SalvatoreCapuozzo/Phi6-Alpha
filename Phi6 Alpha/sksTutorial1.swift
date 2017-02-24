//
//  sksTutorial1.swift
//  Phi6 Alpha
//
//  Created by Gennaro Nappi on 23/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import CoreGraphics

class sksTutorial1 : BaseTutorialScene
{
    override func InitStates()
    {
        let step1 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.childNode(withName: "phisphere")!, text: "perdindirindina", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        let step2 = SimpleFSM_State(stateType: .FOCUS) {
            Focus(view: self.viewController.tutorialInfoView as! viewTutorialInfo, obj: self.viewController.infoButton, text: "daghediogan", offset: CGPoint(x: self.frame.size.width / 2, y: 0))
        }
        
        tutorialSteps.append(step1)
        tutorialSteps.append(step2)
    }
}
