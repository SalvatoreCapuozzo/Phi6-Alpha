//
//  ObjectTableViewCell.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 23/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import UIKit

class ObjectTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        Singleton.shared.selectedPath = objectPath
        print(Singleton.shared.selectedPath)

        // Configure the view for the selected state
    }

    
    @IBOutlet weak var objectName: UILabel!
    @IBOutlet weak var objectImage: UIImageView!
    
    var objectPath = IndexPath()
}
