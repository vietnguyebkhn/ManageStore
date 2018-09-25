//
//  ProductTableViewController.swift
//  ManageStore
//
//  Created by Apple on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ProductTableViewController: UITableViewController {
   
    
    @IBOutlet var mTableViewProduct: UITableView!
    var mShoeVOsAdidas = [ShoeVO]()
    var mShoeVOsNike = [ShoeVO]()
    var mShoeVOsJordan = [ShoeVO]()


    struct StoryBoard{
        static let productCell = "ProductCell"
        static let collectionProductCell = "CollectionProductCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()

        
    }
    func requestData(){
        ProductService.getAdidasData { (arrProduct) in
            self.mShoeVOsAdidas = arrProduct!
            self.mTableViewProduct.reloadData()

            
            
        }
        ProductService.getNikeData { (arrProduct) in
            self.mShoeVOsNike = arrProduct!
            self.mTableViewProduct.reloadData()
            
            
            
        }
        
    }
}
extension ProductTableViewController{
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 3
        }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section
        {
        case 0:
            return "Adidas"
        case 1:
            return "Nike"
        default:
            return "Jordan"
        }
    }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 1
        }
    section
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableViewProduct.dequeueReusableCell(withIdentifier: StoryBoard.productCell) as! ProductTableViewCell
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }
    
   override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
  
    if let cell = cell as? ProductTableViewCell{
        cell.mProductCollectionView.dataSource = self
        cell.mProductCollectionView.reloadData()
        
    }
        
    }
    
    
    }
extension ProductTableViewController: UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("mShoeVOs.count = \(mShoeVOsAdidas.count)")
        return mShoeVOsAdidas.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.collectionProductCell, for: indexPath) as? ProductCollectionViewCell
        cell?.mProductName?.text = mShoeVOsAdidas[indexPath.row].name
        cell?.setData(data: mShoeVOsAdidas[indexPath.row])
        
        return cell!
        
    }
    
    
}




