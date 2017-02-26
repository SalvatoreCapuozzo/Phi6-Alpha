//
//  StartingViewController.swift
//  Phi6 Alpha
//
//  Created by Armando Ariemma on 24/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {
    
    @IBOutlet weak var phiSphere: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateAndChain(withDuration: 0.5, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.phiSphere.layer.position = self.view.center
            self.phiSphere.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        }, completion: nil).animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.phiSphere.transform = CGAffineTransform(scaleX: 21, y: 21)
            self.phiSphere.alpha = 0
        }, completion: { (finished: Bool) in
            self.performSegue(withIdentifier: "startSegue", sender: self)
        })
    }
    

}
