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
//    @IBOutlet var textTheory: UILabel!
    @IBOutlet var textTheory: UITextView!

    override func viewDidLoad() {
  
        super.viewDidLoad()
        
        self.Titoli = ["Cinematics","Mechanics","Dynamics"]
        self.Testi = [
            "La cinematica (dal termine francese cinématique, coniato dal fisico André-Marie Ampère e derivato dal greco κίνημα -ατος, kinema -atos = «movimento», derivato a sua volta dal verbo κινέω, kineo = «muovo») è quel ramo della meccanica che si occupa di descrivere quantitativamente il moto dei corpi, indipendentemente dalle cause del moto stesso. È significativa la sua definizione di geometria del movimento: in effetti la cinematica del punto si può pensare come geometria dello spazio vettoriale quadridimensionale formato dalle tre coordinate spaziali e dalla coordinata temporale.",
            "La meccanica classica descrive in modo sostanzialmente accurato gran parte dei fenomeni meccanici osservabili direttamente nella nostra vita quotidiana. La sua branca fondamentale è costituita dalla meccanica del continuo basata sull'ipotesi del corpo continuo. Il campo di validità di tale ipotesi è definito dal numero di Knudsen. Qualora tale ipotesi non possa essere applicata vengono risolti con le leggi della meccanica statistica, di cui fa parte la termodinamica.",
            "La dinamica è il ramo della meccanica che si occupa dello studio del moto dei corpi e delle sue cause o, in termini più concreti, delle circostanze che lo determinano e lo modificano. Lo studio completo della meccanica comprende anche la statica e la cinematica: la dinamica si differenzia dalla prima che studia le configurazioni di equilibrio meccanico, dalla seconda che studia, in astratto, tutti i moti concepibili ma non si occupa di determinare quali moti possono avvenire in un determinato contesto sperimentale."
        ]
        
        self.Immagini = [#imageLiteral(resourceName: "cinematica"),#imageLiteral(resourceName: "PhiSphere"),#imageLiteral(resourceName: "PhiSphere")]
        
        titleTheory.text = self.Titoli[category!]
        textTheory.text = self.Testi[category!]
        imageTheory.image = self.Immagini[category!]
        textTheory.isEditable = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToExercise(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "showLesson", sender: UIButton.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showLesson" {
            let lessonSelected = segue.destination as! LessonsViewController
            lessonSelected.mode = self.mode
            lessonSelected.category = self.category
            lessonSelected.maxLessonNumbers = Lesson[self.category!].count
        }
    }
}
