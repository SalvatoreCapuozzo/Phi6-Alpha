//
//  LessonsViewController.swift
//  Phi6 Alpha
//
//  Created by Giuseppe Sannino on 07/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit
import iCarousel

class LessonsViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    @IBOutlet var CategoryView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    var mode: String?
    var category: Int?
    var lessonSelected: Int = 0
    
    var maxLessonNumbers: Int?
    var i = 0
    let images = ["Group 24", "argumentschoice", "Group 2"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let carousel = iCarousel(frame: CategoryView.frame)
        carousel.delegate = self
        carousel.dataSource = self
        carousel.type = .linear
        view.addSubview(carousel)
        pageControl.numberOfPages = numberOfItems(in: carousel)
        carousel.bounceDistance = 0.3
        
        self.maxLessonNumbers = Lesson[self.category!].count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backPressed(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)

    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return maxLessonNumbers!
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: CategoryView.frame.width - 160, height: CategoryView.frame.height))
        
        let newLabel = UILabel(frame: CGRect(x: -50, y: 10, width: 300, height: 100))
        newLabel.text = "Lesson \(i)"
        newLabel.textColor = UIColor.white
        newLabel.font = UIFont(name: "Zapfino", size: 30)
        myView.addSubview(newLabel)
        
        let newTextView = UITextView(frame: CGRect(x: -90, y: newLabel.frame.height, width: CategoryView.frame.width/1.3, height: CategoryView.frame.height/1.5))
        newTextView.font = UIFont(name: "System Italic", size: 30)
        newTextView.textColor = UIColor.white
        newTextView.backgroundColor = UIColor.clear
        newTextView.isEditable = false
        newTextView.textAlignment = .justified
        myView.addSubview(newTextView)
        
        if i <= self.maxLessonNumbers!{
            newTextView.text = Lesson[self.category!][i]
            i = i + 1
        }
        
        return myView
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        
        print(index)
        
        self.lessonSelected = index
        self.performSegue(withIdentifier: "loadLesson", sender: carousel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "loadLesson"{
            
            let lesson = segue.destination as! GameViewController
            lesson.mode = self.mode
            lesson.category = self.category
            lesson.levelNumber = self.lessonSelected
        }
    }
}