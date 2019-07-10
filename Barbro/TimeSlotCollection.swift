//
//  TimeSlotCollection.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 23/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import UIKit

class TimeSlotCollection: UICollectionViewCell {
    
    @IBOutlet weak var outterBox: UIView!
    
    @IBOutlet weak var innerBox: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outterBox.layer.cornerRadius = 8
        outterBox.clipsToBounds = true
        
        innerBox.layer.cornerRadius = 8
        innerBox.clipsToBounds = true
        
    }
    
}
