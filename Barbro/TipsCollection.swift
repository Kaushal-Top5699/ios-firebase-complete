//
//  TipsCollection.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 19/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import UIKit

class TipsCollection: UICollectionViewCell {
    
    @IBOutlet weak var OutterBox: UIView!
    
    @IBOutlet weak var InnerBox: UIView!
    
    @IBOutlet weak var LCornerBox: UIView!
    
    @IBOutlet weak var LCornerImage: UIImageView!
    
    @IBOutlet weak var tipName: UILabel!
    
    @IBOutlet weak var tipIntro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        InnerBox.layer.cornerRadius = 8
        InnerBox.clipsToBounds = true
        self.InnerBox.layer.borderWidth = 1.0;
        self.InnerBox.layer.borderColor = UIColor(red: 229/255, green: 236/255, blue: 237/225, alpha: 1).cgColor
        
        OutterBox.layer.cornerRadius = 8
        OutterBox.clipsToBounds = true
        
        
    }
}
