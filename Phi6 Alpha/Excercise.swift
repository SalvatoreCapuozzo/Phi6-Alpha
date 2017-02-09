//
//  Excercise.swift
//  Phi6 Alpha
//
//  Created by Giuseppe Sannino on 08/02/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation

var Excercise = [
    [
        //Cinematics
        "Lezione 0",
        "Alberto e Biagio fanno una gara sui 200 metri piani.\nSi sa che Alberto corre in 22′′, mentre Biagio corre in 23′′,5.\nAlberto parte pero` 10 metri dietro a Biagio.\nChi tagliera` per primo il traguardo?",
        "Una biglia viene lanciata oltre il bordo del tavolo con una velocità v=0.6 m/s.\nIl tavolo è alto 1.25m.\nQuando atterra la biglia? A che distanza?"
    ],
    [
        //Dynamics
        "Lezione 1",
        "Un corpo di massa m = 6.3 kg si muove con velocità uniforme v0 = 3.7 m/s quando comincia ad agire su di esso una forza F di modulo F = 54 N nella direzione del moto ma in verso contrario.\ndeterminare il quanto tempo il corpo si ferma e quanto spazio percorre da quando é iniziata l’azione della forza."
    ],
    [
        //Statics
        "Lezione 2",
        "Si vuole spingere un corpo di 150kg fermo, appoggiato sul pavimento, con una forza di 350N.\nTra il corpo ed il pavimento esiste un attrito con coefficiente di attrito statico pari a 0.3.\nIn base alla forza esercitata, è possibile spostare il corpo?"
    ],
    
]

var exerciseEnglish = [
    [
        "Lesson 0",
        "Alberto and Biagio race on the 200-meter track. \n Alberto runs the race in 22 seconds, while Biagio runs it in 23.5 seconds \n Alberto starts  10 meters behind Biagio. \n Who will win the race?",
        "A ball is thrown beyond the edge of the table with a velocity v = 0.6 m / s. \n The table is 1.25m tall. \n When does the ball land? At what distance?"
    ],
    [
        "Lesson 1 ",
        "A body of mass m = 6.3 kg moves with uniform velocity v0 = 3.7 m / s when a force F = 54N starts acting on it in the same direction of motion but in opposite sense.\n Determine in how much time the body stops and how distance it has covered since the force has begun acting. "
    ],
    [
        "Lesson 2",
        "You want to push a 150kg body, resting on the floor, with a force of 350N. \n Between the body and the floor there is a friction with a static friction coefficient of 0.3. \n Based on the force exerted, can you move the body ? "

    ]

]

var solutionsEnglish = [
    [
        "Solution 0",
        "Alberto's' speed = 9.09 m / s \n Alberto crosses the finish line in 23.1s. \n Alberto wins the race.",
        "It lands in 0.5s \n It lands at a distance of 0.2m"

    ],
    
    [
        "Solution 1",
    "You can determine the acceleration of the body, that is constant and whose form and is a = F / m. \n The force has  direction opposite to the motion, so it is a deceleration. The motion is therefore uniformly accelerated with negative acceleration. We choose zero as the moment that the force begins acting, so the law of motion and the law of speed become: \n x (t) = v0t - 1/2 at2, v ( t) = v0 - at \n From the second equation you get the instant t1 in which the body stops, that is, when its velocity is zero: \n t1 = v0 = mv0 = 0.43s. \n Substituting this result in the first equation you get the position after stopping and then the distance traveled:\n v02 MV02 x (t1) = 2a = 2F = 0.80m."
        
    ],
    
    [
        "Solution 2",
        "To move the body it is necessary to impose a force exceeding the force of static friction. \n The static friction force is equal to: \n FS = us * m * a = 0.3 * 150kg * 9.8m / s ^ 2 = 441.45N. \n The force impressed on the body is equal to 350N, lower than the frictional force, by which the body does not move."
        
    ],
    
    


]

var Solutions = [
    [
        //Cinematics
        "Soluzione 0",
        "Velocità Alberto = 9.09 m/s\nAlberto taglia il traguardo in 23.1s.\nAlberto Vince la gara.",
        "Atterra in 0.5s\nAtterra ad una distanza di 0.2m"
    ],
    [
        //Dynamics
        "Soluzione 1",
        "E\' possibile determinare l’accelerazione del corpo, che risulta costante e il cui modulo e\' a=F/m.\nLa forza ha il verso opposto al moto e così anche l’accelerazione; quindi si tratta di una decelerazione. Il moto è dunque uniformemente accelerato con accelerazione negativa. Scegliendo come istante zero quello in cui comincia ad agire la forza, la legge del moto e la legge della velocità diventano:\nx(t) = v0t − 1/2 at2 , v(t) = v0 − at\nDalla seconda si ottiene l’istante t1 in cui il corpo si ferma, cioè in cui la sua velocità è zero:\nt1=v0 =mv0 =0.43s.\nSostituendo questo risultato nella prima si trova la posizione all’istante dell’arresto e quindi lo spazio percorso:\nv02 mv02 x(t1)=2a= 2F =0.80m."
    ],
    [
        //Statics
        "Soluzione 2",
        "Per muovere il corpo è necessario imporre una forza superiore alla forza di attrito statico.\nLa forza di attrito statico è pari a:\nFs = us*m*a = 0.3*150kg*9.8m/s^2 = 441.45N.\nLa forza impressa sul corpo è pari a 350N, inferiore alla forza di attrito, per cui il corpo non si muove."
    ]


]
