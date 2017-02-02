//
//  SimpleObjectNode-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//


import Foundation
import SpriteKit

protocol SimpleObject: GameObject {
    var resizable: Bool {get set}
    var imgName: String {get set}
    var simpleObjectName: String {get set}
    // Inserire variabile che distingue SimpleObject da Logic
}

