//
//  TheoryViewController.swift
//  Phi6 Alpha
//
//  Created by Giovanni Prota on 07/02/17.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit
import AVFoundation

class TheoryViewController: UIViewController {
    
    var category: Int?
    var mode: String?
    var Titoli = [String]()
    var Testi = [String]()
    var TestiInglese = [String]()
    var Immagini = [UIImage]()
    var backPlayer = AVAudioPlayer()
    var buttonPlayer = AVAudioPlayer()


    
    @IBOutlet var imageTheory: UIImageView!
    @IBOutlet var titleTheory: UILabel!
//    @IBOutlet var textTheory: UILabel!
    @IBOutlet var textTheory: UITextView!

    override func viewDidLoad() {
  
        super.viewDidLoad()
        
        var path3 = Bundle.main.path(forResource:
            "button-27", ofType: "mp3")
        var audioFileUrl3 = NSURL(fileURLWithPath: path3!)
        
        do  {
            try backPlayer = AVAudioPlayer(contentsOf: audioFileUrl3 as URL)
        } catch {
            print("dio cane")
        }

        
        self.Titoli = ["Cinematics","Dynamics","Statics"]
        self.Testi = [
            "La cinematica (dal termine francese cinématique, coniato dal fisico André-Marie Ampère e derivato dal greco κίνημα -ατος, kinema -atos = «movimento», derivato a sua volta dal verbo κινέω, kineo = «muovo») è quel ramo della meccanica che si occupa di descrivere quantitativamente il moto dei corpi, indipendentemente dalle cause del moto stesso. È significativa la sua definizione di geometria del movimento: in effetti la cinematica del punto si può pensare come geometria dello spazio vettoriale quadridimensionale formato dalle tre coordinate spaziali e dalla coordinata temporale.",
            "La dinamica è il ramo della meccanica che si occupa dello studio del moto dei corpi e delle sue cause o, in termini più concreti, delle circostanze che lo determinano e lo modificano. Lo studio completo della meccanica comprende anche la statica e la cinematica: la dinamica si differenzia dalla prima che studia le configurazioni di equilibrio meccanico, dalla seconda che studia, in astratto, tutti i moti concepibili ma non si occupa di determinare quali moti possono avvenire in un determinato contesto sperimentale.",
            "In fisica la statica è la parte della meccanica che studia le condizioni di equilibrio di un corpo materiale, ovvero le condizioni necessarie affinché un corpo, inizialmente in quiete, resti in equilibrio anche dopo l'intervento di azioni esterne dette forze. Queste derivano dalla legge di conservazione della quantità di moto e dalla legge di conservazione del momento angolare."
        ]
        
        self.TestiInglese = [
        "Kinematics is the branch of classical mechanics which describes the motion of points (alternatively <<particles>>), bodies (objects), and systems of bodies without consideration of the masses of those objects nor the forces that may have caused the motion. Kinematics as a field of study is often referred to as the <<<geometry of motion>> and as such may be seen as a branch of mathematics. Kinematics begins with a description of the geometry of the system and the initial conditions of known values of the position, velocity and or acceleration of various points that are a part of the system, then from geometrical arguments it can determine the position, the velocity and the acceleration of any part of the system.",
         "Dynamics is a branch of applied mathematics (specifically classical mechanics) concerned with the study of forces and torques and their effect on motion, as opposed to kinematics, which studies the motion of objects without reference to its causes. Isaac Newton defined the fundamental physical laws which govern dynamics in physics, especially his second law of motion. Generally speaking, researchers involved in dynamics study how a physical system might develop or alter over time and study the causes of those changes.",
          "Statics is the branch of mechanics that is concerned with the analysis of loads (force and torque, or <<moment>>) acting on physical systems that do not experience an acceleration (a=0), but rather, are in static equilibrium with their environment. When in static equilibrium, the acceleration of the system is zero and the system is either at rest, or its center of mass moves at constant velocity."]
        
        
        
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
        backPlayer.play()
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
