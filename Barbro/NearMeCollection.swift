//
//  NearMeCollection.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 19/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import UIKit

class NearMeCollection: UICollectionViewCell {
    
    @IBOutlet weak var nearMeCollectionHolder: UIView!
    
    @IBOutlet weak var shopPhoto: UIImageView!
    
    @IBOutlet weak var shopName: UILabel!
    
    @IBOutlet weak var shopAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nearMeCollectionHolder.layer.cornerRadius = 8
        nearMeCollectionHolder.clipsToBounds = true
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.shopPhoto.frame
        rectShape.position = self.shopPhoto.center
        rectShape.path = UIBezierPath(roundedRect: self.shopPhoto.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 8, height: 8)).cgPath
        
        self.shopPhoto.layer.backgroundColor = UIColor(red: 117, green: 155, blue: 250, alpha: 0.25).cgColor
        
        self.shopPhoto.layer.mask = rectShape
        
        nearMeCollectionHolder.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        nearMeCollectionHolder.layer.shadowOffset = CGSize(width: 0, height: 5)
        nearMeCollectionHolder.layer.shadowOpacity = 1.0
        nearMeCollectionHolder.layer.shadowRadius = 5.0
        nearMeCollectionHolder.layer.masksToBounds = false
        
    }
    
    func set(shopholder: ShopHolder) {
        
        ImageService.getImage(withURL: shopholder.shopImage) { image in
            
            self.shopPhoto.image = image
            
        }
        
        self.shopName.text = shopholder.sName
        self.shopAddress.text = shopholder.sAdd
        
    }
    
    
    
}
