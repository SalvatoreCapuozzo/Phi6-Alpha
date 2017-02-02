//
//  CustomErrors.swift
//  Phi6
//
//  Created by Gennaro Nappi on 26/01/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation

enum TileMapErrors : Error
{
    case UnavailableFile
    case InvalidData
}

enum TileErrors : Error
{
    case InvalidTile
}
