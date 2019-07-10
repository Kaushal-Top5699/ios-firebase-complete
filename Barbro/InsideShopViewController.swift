//
//  InsideShopViewController.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 23/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import UIKit

class InsideShopViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var myString = String()
    
    var selectedIndex = Int()
    
    @IBOutlet weak var uid: UILabel!
    
    @IBOutlet weak var shopName: UILabel!
    
    @IBOutlet weak var serviceCollectionView: UICollectionView!
    
    @IBOutlet weak var dateTimeView: UIView!
    
    @IBOutlet weak var dateTimeBox: UIView!
    
    @IBOutlet weak var dateTimeCollectionView: UICollectionView!
    
    @IBOutlet weak var currentMonthYearLabel: UILabel!
    
    @IBOutlet weak var timeSlotCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        dateTimeView.layer.cornerRadius = 8
        dateTimeView.clipsToBounds = true
        
        dateTimeView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        dateTimeView.layer.shadowOffset = CGSize(width: 0, height: 5)
        dateTimeView.layer.shadowOpacity = 1.0
        dateTimeView.layer.shadowRadius = 5.0
        dateTimeView.layer.masksToBounds = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == serviceCollectionView {
            
            return 5
            
        } else if collectionView == dateTimeCollectionView {
            
            return 30
            
        } else if collectionView == timeSlotCollectionView {
            
            return 5
            
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == serviceCollectionView {
            
            let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "services", for: indexPath)
                as? ServiceTypes
            
            return cell!
            
        } else if collectionView == dateTimeCollectionView {
            
            let cell = dateTimeCollectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath)
                as? DateCollection
            
            
            
            if selectedIndex == indexPath.row {
                
                cell?.egdamInner.backgroundColor = UIColor(red: 0.45, green: 0.60, blue: 0.98, alpha: 1)
                
                cell?.numDate.textColor = UIColor.white
                
                print(indexPath.row)
                
            } else {
                
                cell?.egdamInner.backgroundColor = UIColor(red: 0.96, green: 0.972, blue: 0.976, alpha: 1)
                
                cell?.numDate.textColor = UIColor.black
                
            }
            
            return cell!
            
        } else if collectionView == timeSlotCollectionView {
            
            let cell = timeSlotCollectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath)
                as? TimeSlotCollection
            
            return cell!
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == dateTimeCollectionView {
            
            selectedIndex = indexPath.row
            
            self.dateTimeCollectionView.reloadData()
            
        }
        
    }
    
}
