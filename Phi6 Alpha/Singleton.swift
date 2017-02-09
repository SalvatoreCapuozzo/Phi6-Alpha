//
//  Singleton.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 23/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit

class Singleton: NSObject {
    static let shared = Singleton()
    var objects: [SKSpriteNode] = []
    var lastSelectedObject: Int = -1
    
    func addNewObject(anObject: SKSpriteNode) {
        objects.append(anObject)
        //return countObjects()
    }
    
    func countObjects() -> Int {
        return objects.count
    }
    
    func objectAt(indexPath: IndexPath) -> SKSpriteNode {
        return objects[indexPath.row]
    }
    
    func setWidth(myNode: SKSpriteNode, scene: SKScene) {
        /*
         print("Set width to " + myNode.name!)
         scene.removeChildren(in: [myNode])
         myNode.position.x = myNode.position.x - (myNode.size.width - CGFloat(widthSlider.value))/2
         //scene.triangle.size.width = CGFloat(widthSlider.value)
         myNode.xScale = CGFloat(widthSlider.value)/scene.pauseTriangleWidth
         widthLabel.text! = String(describing: round(myNode.size.width*10)/10) + " m"
         
         scene.addChild(myNode)
         */
    }
    
    //--------------------//--------------------//
    
    var objectList: [SimpleObject] = []
    
    func createList() {
        if objectList.isEmpty {
            objectList.append(Triangle.triangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(Rectangle.rectangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(Circle.circle(location: CGPoint(x: 0, y: 0)))
            // print(objectList)
        } else {
            objectList.removeAll()
            objectList.append(Triangle.triangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(Rectangle.rectangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(Circle.circle(location: CGPoint(x: 0, y: 0)))
            // print(objectList)
        }
        
    }
    
    func countObjectList() -> Int {
        return objectList.count
    }
    
    func objectListAt(indexPath: IndexPath) -> SimpleObject {
        return objectList[indexPath.row]
    }
    
    func GetObjectIndex(object: SKSpriteNode) -> Int?
    {
        return objects.index(of: object)
    }
    
    func DeleteObjectAt(index: Int, scene: SKScene)
    {
        let obj = objects[index]
        
        scene.removeChildren(in: [obj])
        
        objects.remove(at: index)
    }
    
    func GetObjectAt(index: Int) -> SKSpriteNode?
    {
        if index < objects.count
        {
            return objects[index]
        }
        
        return nil
    }
    
    var selectedPath = IndexPath()
    
    //--------------------//--------------------//
    
    var sensorList: [Sensor] = []
    
    func createSensorList() {
        if sensorList.isEmpty {
            sensorList.append(Chronometer.chronometer(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserAccelerometer.horizontal(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserAccelerometer.vertical(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserRangefinder.horizontal(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserRangefinder.vertical(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LoadCell.loadCell(location: CGPoint(x: 0, y: 0)))
            sensorList.append(PhotoCell.photoCell(location: CGPoint(x: 0, y: 0)))
            sensorList.append(SpeedCamera.speedCamera(location: CGPoint(x: 0, y: 0)))
            // print(objectList)
        } else {
            sensorList.removeAll()
            sensorList.append(Chronometer.chronometer(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserAccelerometer.horizontal(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserAccelerometer.vertical(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserRangefinder.horizontal(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LaserRangefinder.vertical(location: CGPoint(x: 0, y: 0)))
            sensorList.append(LoadCell.loadCell(location: CGPoint(x: 0, y: 0)))
            sensorList.append(PhotoCell.photoCell(location: CGPoint(x: 0, y: 0)))
            sensorList.append(SpeedCamera.speedCamera(location: CGPoint(x: 0, y: 0)))
            // print(objectList)
        }
        
    }
    
    func countSensorList() -> Int {
        return sensorList.count
    }
    
    func sensorListAt(indexPath: IndexPath) -> Sensor {
        return sensorList[indexPath.row]
    }
    
    //--------------------//--------------------//
    
    var completeList: [GameObject] = []
    
    func fillList() {
        if completeList.isEmpty {
            completeList.append(Triangle.triangle(location: CGPoint(x: 0, y: 0)))
            completeList.append(Rectangle.rectangle(location: CGPoint(x: 0, y: 0)))
            completeList.append(Circle.circle(location: CGPoint(x: 0, y: 0)))
            completeList.append(Chronometer.chronometer(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserAccelerometer.horizontal(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserAccelerometer.vertical(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserRangefinder.horizontal(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserRangefinder.vertical(location: CGPoint(x: 0, y: 0)))
            completeList.append(LoadCell.loadCell(location: CGPoint(x: 0, y: 0)))
            completeList.append(PhotoCell.photoCell(location: CGPoint(x: 0, y: 0)))
            completeList.append(SpeedCamera.speedCamera(location: CGPoint(x: 0, y: 0)))
        } else {
            completeList.removeAll()
            completeList.append(Triangle.triangle(location: CGPoint(x: 0, y: 0)))
            completeList.append(Rectangle.rectangle(location: CGPoint(x: 0, y: 0)))
            completeList.append(Circle.circle(location: CGPoint(x: 0, y: 0)))
            completeList.append(Chronometer.chronometer(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserAccelerometer.horizontal(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserAccelerometer.vertical(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserRangefinder.horizontal(location: CGPoint(x: 0, y: 0)))
            completeList.append(LaserRangefinder.vertical(location: CGPoint(x: 0, y: 0)))
            completeList.append(LoadCell.loadCell(location: CGPoint(x: 0, y: 0)))
            completeList.append(PhotoCell.photoCell(location: CGPoint(x: 0, y: 0)))
            completeList.append(SpeedCamera.speedCamera(location: CGPoint(x: 0, y: 0)))
            
            //completeList.append(objectList as! GameObject)
            //completeList.append(sensorList as! GameObject)
        }
    }
    
    func countCompleteList() -> Int {
        return completeList.count
    }
    
    func completeListAt(indexPath: IndexPath) -> GameObject {
        return completeList[indexPath.row]
    }
    //var selectedPath = IndexPath()
    
    var position: CGPoint!
    
    func getPosition() -> CGPoint {
        return self.position
    }
    
    func setPosition(position: CGPoint) {
        self.position = position
    }
}
