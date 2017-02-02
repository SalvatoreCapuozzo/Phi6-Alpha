//
//  Logic.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 28/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

protocol Logic: GameObject {
    var resizable: Bool {get set}
    var imgName: String {get set}
    var numInputPort: Int {get set}
}
