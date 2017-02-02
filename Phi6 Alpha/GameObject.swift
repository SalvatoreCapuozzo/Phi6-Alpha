//
//  GameObject.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 27/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

protocol GameObject {
    var resizable: Bool {get set}
    var imgName: String {get set}
}
