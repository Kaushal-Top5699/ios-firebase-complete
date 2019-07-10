//
//  ServiceTypes.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 23/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import Foundation
import UIKit

class ServiceTypes: UICollectionViewCell {
    
    @IBOutlet weak var outterBlueBox: UIView!
    
    @IBOutlet weak var innerGreyBox: UIView!
    
    @IBOutlet weak var serviceTypeImage: UIImageView!
    
    @IBOutlet weak var serviceName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outterBlueBox.layer.cornerRadius = 8
        outterBlueBox.clipsToBounds = true
        
        innerGreyBox.layer.cornerRadius = 8
        innerGreyBox.clipsToBounds = true
        
        innerGreyBox.layer.cornerRadius = 8
        innerGreyBox.clipsToBounds = true
        self.innerGreyBox.layer.borderWidth = 1.0;
        self.innerGreyBox.layer.borderColor = UIColor(red: 229/255, green: 236/255, blue: 237/225, alpha: 1).cgColor
        
    }
    
}
