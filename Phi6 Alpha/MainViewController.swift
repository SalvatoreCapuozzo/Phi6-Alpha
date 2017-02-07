//
//  MainViewController.swift
//  Phi6
//
//  Created by Armando Ariemma on 25/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var pendulumBase: UIImageView!
    @IBOutlet weak var pendulumGroup: UIImageView!
    
    let arcade = "arcade"
    let learning = "learning"
    let sandbox = "sandbox"
    //let learning = "learning"
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        var rotationPoint = pendulumBase.center // The point we are rotating around
        rotationPoint.x = rotationPoint.x - 2
            
        let minX   = view.frame.minX;
        let minY   = view.frame.minY;
        let width  = view.frame.width;
        let height = view.frame.height;
        
        let anchorPoint =  CGPoint(x: (rotationPoint.x-minX)/width,
                                   y: (rotationPoint.y-minY)/height);
        
        pendulumGroup.layer.anchorPoint = anchorPoint;
        pendulumGroup.layer.position = rotationPoint;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        swing()
    }
    
    func swing() {
        UIView.animateAndChain(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: {
            self.pendulumGroup.transform = CGAffineTransform(rotationAngle: CGFloat.pi * (45/180))
        }, completion: nil).animate(withDuration: 2, delay: 0, options: [.repeat, .curveEaseInOut ], animations: {
            self.pendulumGroup.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi * (45/180)))

        }, completion: nil)   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerF(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainViewController.getRandomColor), userInfo: nil, repeats: true)
    }
    
    func getRandomColor() {
        let red   = Float((arc4random() % 256)) / 255.0
        let green = Float((arc4random() % 256)) / 255.0
        let blue  = Float((arc4random() % 256)) / 255.0
        let alpha = Float(1.0)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
            self.view.backgroundColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        }, completion:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch(segue.identifier!){
            case "arcade":
                let selectCategory = segue.destination as! CarusiellViewController
                selectCategory.mode = self.arcade
                print(selectCategory.mode ?? "niente")
            case "learning":
                let selectCategory = segue.destination as! CarusiellViewController
                selectCategory.mode = self.learning
                print(selectCategory.mode ?? "niente")
            case "sandbox":
                let selectCategory = segue.destination as! CarusiellViewController
                selectCategory.mode = self.sandbox
                print(selectCategory.mode ?? "niente")
            default:
                print("error")
        }
    }

    // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
