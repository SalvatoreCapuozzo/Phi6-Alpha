//
//  CarusiellViewController.swift
//  Phi6
//
//  Created by Armando Ariemma on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit
import iCarousel
import AVFoundation

class CarusiellViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    @IBOutlet weak var CategoryView: UIView!
    @IBOutlet weak var backButton: UIButton!
    var buttonPlayer = AVAudioPlayer()
    var backPlayer = AVAudioPlayer()
    var i = 0
    var selectedIndex : Int = 0
    @IBOutlet weak var pageControl: UIPageControl!
    let images = [#imageLiteral(resourceName: "Cinematics@1x-1"), #imageLiteral(resourceName: "Dynamics@1x"), #imageLiteral(resourceName: "StaticsCard@1x")]
    
    var mode: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var path2 = Bundle.main.path(forResource: "button-37", ofType: "mp3")
        var audioFileUrl2 = NSURL(fileURLWithPath: path2!)
        var path3 = Bundle.main.path(forResource:
            "button-27", ofType: "mp3")
        var audioFileUrl3 = NSURL(fileURLWithPath: path3!)

        let carousel = iCarousel(frame: CategoryView.frame)
        carousel.delegate = self
        carousel.dataSource = self
        carousel.type = .linear
        view.addSubview(carousel)
        pageControl.numberOfPages = numberOfItems(in: carousel)
        carousel.bounceDistance = 0.3
        
        do  {
            try buttonPlayer = AVAudioPlayer(contentsOf: audioFileUrl2 as URL)
            try backPlayer = AVAudioPlayer(contentsOf: audioFileUrl3 as URL)
        } catch {
            print("dio cane")
        }

    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        backPlayer.play()
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIImageView
        
        if view != nil {
            imageView = view as! UIImageView
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: CategoryView.frame.width - 160, height: CategoryView.frame.height))
        }
        imageView.image = images[i]
        imageView.contentMode = .scaleAspectFit
        i = i+1
        
        return imageView
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        self.selectedIndex = index
        if self.mode == "arcade"{
            self.performSegue(withIdentifier: "levelSegue", sender: carousel)
        } else if self.mode == "learning"{
            self.performSegue(withIdentifier: "showTheory", sender: carousel)
        }
        buttonPlayer.play()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "levelSegue" {
            let livelli = segue.destination as! LevelViewController
            livelli.category = self.selectedIndex
            livelli.mode = self.mode
            print(self.selectedIndex)
        } else if segue.identifier == "showTheory" {
            let teoria = segue.destination as! TheoryViewController
            teoria.category = self.selectedIndex
            teoria.mode = self.mode
        }
        
    }
}
