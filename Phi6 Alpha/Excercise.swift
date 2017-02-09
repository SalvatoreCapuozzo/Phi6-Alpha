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
        "Lesson 0",
        "Alberto e Biagio fanno una gara sui 200 metri piani.\nSi sa che Alberto corre in 22′′, mentre Biagio corre in 23′′,5.\nAlberto parte pero` 10 metri dietro a Biagio.\nChi tagliera` per primo il traguardo?",
        "Una biglia viene lanciata oltre il bordo del tavolo con una velocità v=0.6 m/s.\nIl tavolo è alto 1.25m.\nQuando atterra la biglia? A che distanza?"
    ],
    [
        //Dynamics
        "Lesson 0",
        "Un corpo di massa m = 6.3 kg si muove con velocità uniforme v0 = 3.7 m/s quando comincia ad agire su di esso una forza F di modulo F = 54 N nella direzione del moto ma in verso contrario.\ndeterminare il quanto tempo il corpo si ferma e quanto spazio percorre da quando é iniziata l’azione della forza."
    ],
    [
        //Statics
        "Lesson 0",
        "Si vuole spingere un corpo di 150kg fermo, appoggiato sul pavimento, con una forza di 350N.\nTra il corpo ed il pavimento esiste un attrito con coefficiente di attrito statico pari a 0.3.\nIn base alla forza esercitata, è possibile spostare il corpo?"
    ],
]

var Solutions = [
    [
        //Cinematics
        "Solution 0",
        "Velocità Alberto = 9.09 m/s\nAlberto taglia il traguardo in 23.1s.\nAlberto Vince la gara.",
        "Atterra in 0.5s\nAtterra ad una distanza di 0.2m"
    ],
    [
        //Dynamics
        "Solution 0",
        "E\' possibile determinare l’accelerazione del corpo, che risulta costante e il cui modulo e\' a=F/m.\nLa forza ha il verso opposto al moto e così anche l’accelerazione; quindi si tratta di una decelerazione. Il moto è dunque uniformemente accelerato con accelerazione negativa. Scegliendo come istante zero quello in cui comincia ad agire la forza, la legge del moto e la legge della velocità diventano:\nx(t) = v0t − 1/2 at2 , v(t) = v0 − at\nDalla seconda si ottiene l’istante t1 in cui il corpo si ferma, cioè in cui la sua velocità è zero:\nt1=v0 =mv0 =0.43s.\nSostituendo questo risultato nella prima si trova la posizione all’istante dell’arresto e quindi lo spazio percorso:\nv02 mv02 x(t1)=2a= 2F =0.80m."
    ],
    [
        //Statics
        "Solution 0",
        "Per muovere il corpo è necessario imporre una forza superiore alla forza di attrito statico.\nLa forza di attrito statico è pari a:\nFs = us*m*a = 0.3*150kg*9.8m/s^2 = 441.45N.\nLa forza impressa sul corpo è pari a 350N, inferiore alla forza di attrito, per cui il corpo non si muove."
    ]


]
