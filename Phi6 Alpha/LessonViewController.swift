//
//  LessonsViewController.swift
//  Phi6 Alpha
//
//  Created by Giuseppe Sannino on 07/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit
import iCarousel
import AVFoundation

class LessonsViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    @IBOutlet var CategoryView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    var buttonPlayer = AVAudioPlayer()

    
    var backPlayer = AVAudioPlayer()

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
        
        var path3 = Bundle.main.path(forResource:
            "button-27", ofType: "mp3")
        var path2 = Bundle.main.path(forResource: "button-37", ofType: "mp3")
        var audioFileUrl2 = NSURL(fileURLWithPath: path2!)

        var audioFileUrl3 = NSURL(fileURLWithPath: path3!)
        
        do  {
            try backPlayer = AVAudioPlayer(contentsOf: audioFileUrl3 as URL)
            try buttonPlayer = AVAudioPlayer(contentsOf: audioFileUrl2 as URL)
        } catch {
            print("dio cane")
        }
        
        self.maxLessonNumbers = Lesson[self.category!].count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backPressed(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
        backPlayer.play()
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return maxLessonNumbers!
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: CategoryView.frame.width, height: CategoryView.frame.height))
        
        let newLabel = UILabel(frame: CGRect(x: 20 , y: 0, width: 647, height: 104))
        newLabel.text = "Lesson \(i)"
        newLabel.textColor = UIColor.white
        newLabel.font = UIFont(name: "SourceSansPro-Regular", size: 32)
        newLabel.textAlignment = .left      

        myView.addSubview(newLabel)
        
        let newTextView = UITextView(frame: CGRect(x: 20, y: 101, width: 479, height: 208))
        newTextView.font = UIFont(name: "SourceSansPro-Light", size: 17)
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
        
        if index != 0{
            self.lessonSelected = index
            self.performSegue(withIdentifier: "loadLesson", sender: carousel)
        }
        
        buttonPlayer.play()
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
