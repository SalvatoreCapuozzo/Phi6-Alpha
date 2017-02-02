//
//  SensorTableViewCell.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 31/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit

class SensorTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        Singleton.shared.selectedPath = sensorPath
        print(Singleton.shared.selectedPath)

        // Configure the view for the selected state
    }

    @IBOutlet weak var sensorName: UILabel!
    @IBOutlet weak var sensorImage: UIImageView!
    
    var sensorPath = IndexPath()
}
