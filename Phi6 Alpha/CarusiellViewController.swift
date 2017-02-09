//
//  CarusiellViewController.swift
//  Phi6
//
//  Created by Armando Ariemma on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit
import iCarousel

class CarusiellViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    @IBOutlet weak var CategoryView: UIView!
    @IBOutlet weak var backButton: UIButton!
    var i = 0
    var selectedIndex : Int = 0
    @IBOutlet weak var pageControl: UIPageControl!
    let images = [#imageLiteral(resourceName: "Cinematic_Card"), #imageLiteral(resourceName: "Group 2@1x"), #imageLiteral(resourceName: "Dynamic_Card")]
    
    var mode: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carousel = iCarousel(frame: CategoryView.frame)
        carousel.delegate = self
        carousel.dataSource = self
        carousel.type = .linear
        view.addSubview(carousel)
        pageControl.numberOfPages = numberOfItems(in: carousel)
        carousel.bounceDistance = 0.3
        
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
