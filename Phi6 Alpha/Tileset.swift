//
//  Tileset.swift
//  Phi6
//
//  Created by Gennaro Nappi on 25/01/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit

class Tileset
{
    private var textureAtlas: SKTexture
    private var tileRects = [CGRect]()
    private var tileSize: Int
    
    init(name: String, tSize: Int)
    {
        textureAtlas = SKTexture(imageNamed: name)
        tileSize = tSize
        
        ClipTileset()
    }
    
    func ClipTileset()
    {
        var x: Int = 0
        var y: Int = Int(textureAtlas.size().height) - tileSize
        
        while(y >= tileSize)
        {
            while(x < Int(textureAtlas.size().width))
            {
                let rect = CGRect(x: CGFloat(x) / textureAtlas.size().width,
                                  y: CGFloat(y) / textureAtlas.size().height,
                                  width: CGFloat(tileSize) / textureAtlas.size().width,
                                  height: CGFloat(tileSize) / textureAtlas.size().height)
                
                print(x, y)
                tileRects.append(rect)
                
                x += tileSize
            }
            
            x = 0
            y -= tileSize
        }
    }
    
    func GetTextureAtlas() -> SKTexture     { return textureAtlas }
    func GetNumberOfTiles() -> Int          { return tileRects.count }
    func GetTileSize() -> Int               { return tileSize }
    func GetTileRect(_ id: Int) /*throws*/ -> CGRect?
    {
        //guard let
        return (id < tileRects.count) ? tileRects[id] : nil
    }
}
