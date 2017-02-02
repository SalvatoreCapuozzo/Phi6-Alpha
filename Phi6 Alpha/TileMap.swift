//
//  TileMap.swift
//  Phi6
//
//  Created by Gennaro Nappi on 25/01/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class TileMap
{
    private var mapName: String!
    private var mapSize: CGSize!
    private var tileset: Tileset!
    private var tiles = [Tile]()
    
    init(filename: String) throws
    {
        try LoadMap(filename: filename)
    }
    
    func LoadMap(filename: String) throws
    {
        // Apro il file dalla cartella Assets
        guard let asset = NSDataAsset(name: filename, bundle: Bundle.main)
        else
        {
            throw TileMapErrors.UnavailableFile
        }
        // Parso i dati JSON
        guard let json = try JSONSerialization.jsonObject(with: asset.data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : Any]
        else
        {
            throw TileMapErrors.InvalidData
        }
        // Assegno le varie proprietà della mappa in base ai dati letti
        mapName = json["mapName"] as! String
        let width = json["width"] as! Int
        let height = json["height"] as! Int
        mapSize = CGSize(width: width, height: height)
        
        tileset = Tileset(name: json["tileset"] as! String, tSize: 32)
        // Carica i tiles
        let loadedTiles = json["tiles"] as! [Int]
        var currentID: Int
        var x = 0
        var y = 0
        var i = 0
        
        while y < height
        {
            while x < width
            {
                currentID = loadedTiles[i]
                
                if currentID >= 0
                {
                    tiles.append(Tile(tSet: tileset, pos: CGPoint(x: x, y: y), id: currentID))
                }
                //print(x, y, loadedTiles[i])
                x += tileset.GetTileSize()
                i += 1
            }
            
            x = 0
            y += tileset.GetTileSize()
        }
        
        print(mapName, mapSize)
    }
    
    func SaveMap(filename: String)
    {
    }
    
    func Render(_ scene: SKScene)
    {
        for t in tiles
        {
            scene.addChild(t)
        }
    }
    
    /*** ***/
    func GetTileset() -> Tileset        { return tileset }
}
