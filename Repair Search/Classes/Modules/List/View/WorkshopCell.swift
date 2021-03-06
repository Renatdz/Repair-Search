//
//  WorkshopCell.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

class WorkshopCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_address: UILabel!
    @IBOutlet weak var lbl_isOpen: UILabel!
    @IBOutlet weak var viw_isOpenIcon: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Setups
    
    func setup(with workshop: Workshop) {
        lbl_name.text    = workshop.name
        lbl_address.text = workshop.vicinity
        
        if workshop.isOpenNow == true {
            lbl_isOpen.text                = "Aberto"
            lbl_isOpen.textColor           = UIColor.green
            viw_isOpenIcon.backgroundColor = UIColor.green
        }
    }

}
