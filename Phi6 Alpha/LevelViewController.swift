//
//  LevelViewController.swift
//  Phi6 Alpha
//
//  Created by Giovanni Prota on 06/02/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class LevelViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var type: Int?
    var levelNumberSelected: Int?
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfLevelsPerCategory: Int
        
        switch type!{
        case 0:
            numberOfLevelsPerCategory = 2
        case 1:
            numberOfLevelsPerCategory = 5
        case 2:
            numberOfLevelsPerCategory = 7
        case 3:
            numberOfLevelsPerCategory = 22
        default:
            numberOfLevelsPerCategory = 0
        }
        
        return numberOfLevelsPerCategory
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "level", for: indexPath)
        
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.levelNumberSelected = indexPath.row
        print("in didSelectItemAt: \(self.levelNumberSelected!)")
        self.performSegue(withIdentifier: "levelSelection", sender: self)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "levelSelection" {
            let test = segue.destination as! GameViewController
            test.levelNumber = levelNumberSelected
            print("ciao")
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
