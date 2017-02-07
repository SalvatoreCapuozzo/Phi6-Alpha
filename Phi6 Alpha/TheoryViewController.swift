//
//  TheoryViewController.swift
//  Phi6 Alpha
//
//  Created by Giovanni Prota on 07/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit

class TheoryViewController: UIViewController {
    
    var category: Int?
    var mode: String?
    var Titoli = [String]()
    var Testi = [String]()
    var Immagini = [UIImage]()
    
    @IBOutlet var imageTheory: UIImageView!
    @IBOutlet var titleTheory: UILabel!
    @IBOutlet var textTheory: UILabel!

    override func viewDidLoad() {
  
        super.viewDidLoad()
        
        self.Titoli = ["Cinematica","Meccanica","Altro"]
        self.Testi = ["La cinematica (dal termine francese cinématique, coniato dal fisico André-Marie Ampère e derivato dal greco κίνημα -ατος, kinema -atos = «movimento», derivato a sua volta dal verbo κινέω, kineo = «muovo») è quel ramo della meccanica che si occupa di descrivere quantitativamente il moto dei corpi, indipendentemente dalle cause del moto stesso.[1] È significativa la sua definizione di geometria del movimento: in effetti la cinematica del punto si può pensare come geometria dello spazio vettoriale quadridimensionale formato dalle tre coordinate spaziali e dalla coordinata temporale.", "Altre merdate", "Altre merdate pt2"]
        
        self.Immagini = [#imageLiteral(resourceName: "cinematica"),#imageLiteral(resourceName: "PhiSphere"),#imageLiteral(resourceName: "PhiSphere")]
        
        titleTheory.text = self.Titoli[category!]
        textTheory.text = self.Testi[category!]
        imageTheory.image = self.Immagini[category!]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToExercise(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showExercise", sender: UIButton.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showExercise" {
            let levelSelected = segue.destination as! GameViewController
            levelSelected.mode = self.mode
            levelSelected.category = self.category
        }
    }
}
