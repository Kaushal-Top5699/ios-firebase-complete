//
//  DateCollection.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 23/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import UIKit

class DateCollection: UICollectionViewCell {
    
    @IBOutlet weak var outterCircle: UIView!
    
    @IBOutlet weak var innserCircle: UIView!
    
    @IBOutlet weak var numDate: UILabel!
    
    @IBOutlet weak var daylabel: UILabel!
    
    @IBOutlet weak var egdamInner: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outterCircle.layer.cornerRadius = outterCircle.bounds.height / 2
        innserCircle.layer.cornerRadius = innserCircle.bounds.height / 2
        egdamInner.layer.cornerRadius = egdamInner.bounds.height / 2
        
    }
}
