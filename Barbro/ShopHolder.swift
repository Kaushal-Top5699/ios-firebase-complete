//
//  ShopHolder.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 23/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import Foundation

class ShopHolder {
    
    var id: String
    var uUid: String
    var sName: String
    var sOwner: String
    var sCountry: String
    var sState: String
    var sCity: String
    var sArea: String
    var sAdd: String
    var ownerEmail: String
    var shopImage:URL
    
    init(id:String, uUid:String, sName:String, sOwner:String, sCountry:String, sState:String, sCity:String, sArea:String, sAdd:String, ownerEmail:String, shopImage:URL) {
        
        self.id = id
        self.uUid = uUid
        self.sName = sName
        self.sOwner = sOwner
        self.sCountry = sCountry
        self.sState = sState
        self.sCity = sCity
        self.sArea = sArea
        self.sAdd = sAdd
        self.ownerEmail = ownerEmail
        self.shopImage = shopImage
        
    }
    
}
