//
//  SimpleStateMachine.swift
//  Phi6 Alpha
//
//  Created by Gennaro Nappi on 24/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit

enum StateType
{
    case FOCUS
    case POINT
    case MOVE_TO_POINT
    case ADD
    case ROTATE
    case ACTIVATE
}

class SimpleFSM_State
{
    let type: StateType
    let action: () -> ()
    
    init(stateType: StateType, action: @escaping () -> ())
    {
        type = stateType
        self.action = action
    }
    
    func Gesture(object: NSObject, sender: UITapGestureRecognizer) -> Bool
    {
        switch(type)
        {
            case .FOCUS, .POINT, .ADD, .ROTATE, .ACTIVATE:
                // Se il tap è stato concluso
                if sender.state == .ended
                {
                    return true
                }
            default:
                return false
        }
        
        return false
    }
}
