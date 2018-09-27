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
        static let productAdidasCell = "ProductAdidasCell"
        static let productNikeCell = "ProductNikeCell"
        static let productJordanCell = "ProductJordanCell"

        static let collectionProductCell = "CollectionProductCell"
        static let segueToAddProduct = "ToAddProduct"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.segueToAddProduct{
            if let addProductVC = segue.destination as? AddProductViewController {
                addProductVC.mShoeVOsAdidas = self.mShoeVOsAdidas
                addProductVC.mShoeVOsNike = self.mShoeVOsNike
                addProductVC.mShoeVOsJordan = self.mShoeVOsJordan
            }
        }
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
        ProductService.getJordanData { (arrProduct) in
            self.mShoeVOsJordan = arrProduct as! [ShoeVO]
            
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
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor(red: 5/255.0, green: 140/255.0, blue: 255/255.0, alpha: 1.0).withAlphaComponent(0.5)
        
    }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if(section == 0){
                return mShoeVOsAdidas.count

            }
            if(section == 1){
                return mShoeVOsNike.count
                
            }
            else{
                return mShoeVOsJordan.count
                
            }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = mTableViewProduct.dequeueReusableCell(withIdentifier: StoryBoard.productAdidasCell) as! ProductTableViewCell
            cell.setData(data: mShoeVOsAdidas[indexPath.row])
            
            return cell
        }
        if indexPath.section == 1{
            let cell = mTableViewProduct.dequeueReusableCell(withIdentifier: StoryBoard.productAdidasCell) as! ProductTableViewCell
            cell.setData(data: mShoeVOsNike[indexPath.row])

            return cell
        }
        else {
         
                let cell = mTableViewProduct.dequeueReusableCell(withIdentifier: StoryBoard.productAdidasCell) as! ProductTableViewCell
            cell.setData(data: mShoeVOsJordan[indexPath.row])
                return cell
            
        }
        
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }
    
}
