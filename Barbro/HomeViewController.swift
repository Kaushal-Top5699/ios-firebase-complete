//
//  HomeViewController.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 19/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var NearMeCollectionView: UICollectionView!
    
    @IBOutlet weak var TipsCollectionView: UICollectionView!
    
    var shops = [ShopHolder]()
    
    var databaseHandle:DatabaseHandle?
    
    var ref:DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        let cellNib = UINib(nibName: "NearMeCollection", bundle: nil)
        
        NearMeCollectionView.register(cellNib, forCellWithReuseIdentifier: "shopCell")
        
        view.addSubview(NearMeCollectionView)
        
        var layOutGuide: UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            
            layOutGuide = view.safeAreaLayoutGuide //only for iOS 11
            
        } else {
            //Give the feedback
            layOutGuide = view.layoutMarginsGuide
            
        }
        
        observeShops()
        
    }
    
    @objc func observeShops() {
        
        let userID = Auth.auth().currentUser?.uid
        
        let postsRef = Database.database().reference().child("barber_shops")
        
        postsRef.observeSingleEvent(of: .value, with: { snapshot in
            
            var tempShops = [ShopHolder]()
            
            for child2 in snapshot.children {
                
                let childSnapshot = child2 as? DataSnapshot
                let dict = childSnapshot?.value as? [String:Any]
                let sAdd = dict!["sAdd"] as? String
                let sName = dict!["sName"] as? String
                let sOwner = dict!["sOwner"] as? String
                let sCountry = dict!["sCountry"] as? String
                let sState = dict!["sState"] as? String
                let sCity = dict!["sCity"] as? String
                let sArea = dict!["sArea"] as? String
                let ownerEmail = dict!["ownerEmail"] as? String
                let uUid = dict!["uUid"] as? String
                let shopImage = dict!["shopImage"] as? String
                let url = URL(string: shopImage!)
                
                let shop = ShopHolder(id: (childSnapshot?.key)!, uUid: uUid!, sName: sName!, sOwner: sOwner!, sCountry: sCountry!, sState: sState!, sCity: sCity!, sArea: sArea!, sAdd: sAdd!, ownerEmail: ownerEmail!, shopImage: url!)
                
                tempShops.append(shop)
                
            }
            
            self.shops = tempShops
            self.NearMeCollectionView.reloadData()
            
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.NearMeCollectionView {
            
            return shops.count
            
        } else if collectionView == self.TipsCollectionView {
            
            return 10
            
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.NearMeCollectionView {
            
            let cell = NearMeCollectionView.dequeueReusableCell(withReuseIdentifier: "NearMe", for: indexPath)
                as? NearMeCollection
            
            cell?.set(shopholder: shops[indexPath.row])
            
            return cell!
            
        } else if collectionView == self.TipsCollectionView {
            
            let cell = TipsCollectionView.dequeueReusableCell(withReuseIdentifier: "Tips", for: indexPath)
                as? TipsCollection
            
            return cell!
            
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let key = shops[indexPath.row].id as String
        
        print(key)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let DVC = storyboard.instantiateViewController(withIdentifier: "InsideShopViewController") as! InsideShopViewController
        
        DVC.myString = key
        
        self.present(DVC, animated: true, completion: nil)
        
    }
    
}
