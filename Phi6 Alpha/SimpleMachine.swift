//
//  SimpleMachine.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 07/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

protocol SimpleMachine: GameObject {
    var resizable: Bool {get set}
    var imgName: String {get set}
    var simpleMachineName: String {get set}
    // Inserire variabile che distingue SimpleObject da Logic
}
