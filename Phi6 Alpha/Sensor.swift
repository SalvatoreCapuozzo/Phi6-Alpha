//
//  Sensors.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 28/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

protocol Sensor: GameObject {
    var resizable: Bool {get set}
    var imgName: String {get set}
    var orientation: String {get set}
    var value: Float {get set}
    var sensorName: String {get set}
}
