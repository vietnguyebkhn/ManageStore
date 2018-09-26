//
//  ProductService.swift
//  ManageStore
//
//  Created by Apple on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
class ProductService{


    static func getAdidasData(completion: @escaping ([ShoeVO]?)-> Void){
//        DispatchQueue.global().async {
            var ref: DatabaseReference!
            ref = Database.database().reference()
            ref.child("adidas").observeSingleEvent(of: .value, with: { (snapshot) in
                if let data = snapshot.value as? [[String:AnyObject]]{
                    print(data)
                    var arrProductAdidas = [ShoeVO]()
                    for item in data{
                        let productAdidasData = ShoeVO(shoeDictionary: item)
                        arrProductAdidas.append(productAdidasData)
                        
                    }
                    completion(arrProductAdidas)
                }
            })
//        }
        
    }
    
    
    static func getNikeData(completion: @escaping ([ShoeVO?]) -> Void){
//        DispatchQueue.global().async {
            var ref: DatabaseReference!
            ref = Database.database().reference()
            ref.child("nike").observeSingleEvent(of: .value, with: { (snapshot) in
                if let data = snapshot.value as? [[String: AnyObject]]{
                    var arrProductNike = [ShoeVO]()
                    for item in data{
                        let productNikeData = ShoeVO(shoeDictionary: item)
                        arrProductNike.append(productNikeData)
                }
                    completion(arrProductNike)
                }
            })
//        }
    }
    
    static func getDetailOrder(key: String, completion: @escaping(_ resData: [OrderVO?]) -> Void) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        var arrDataOrder = [OrderVO]()
        var arrDataProduct = [DetailVO]()
//var arrDataDetailOrder = [OrderVO]()
        ref.child("orders").observeSingleEvent(of: .value, with: {(snapshot) in
            if let data = snapshot.value as? [String: AnyObject] {
                for item in data {
                    if let currently = item.value as? [String: Any] {
                        do {
                            let product = currently["product"] ?? ""
                            let productData = try  JSONSerialization.data(withJSONObject: product, options: .prettyPrinted)
                            let productJson = try JSONSerialization.jsonObject(with: productData, options: .mutableLeaves)
                            let res = productJson as! [String: AnyObject]
                            for Product in res {
                                let valueProduct = Product.value
                                Utils.SHOW_LOG(title: "ValueProduct", content: valueProduct)
                                let valueproductData = try  JSONSerialization.data(withJSONObject: valueProduct, options: .prettyPrinted)
                                let valueproductJson = try JSONSerialization.jsonObject(with: valueproductData, options: .mutableLeaves)
                                let ValueProductresult = valueproductJson as? [String: AnyObject] ?? nil
                                if ValueProductresult != nil {
                                    let product = DetailVO(data: ValueProductresult!)
                                    arrDataProduct.append(product)
                                }
                                Utils.SHOW_LOG(title: "arrDataProduct", content: arrDataProduct)
                                
                            }
                            
                            
                            let jsonData = try  JSONSerialization.data(withJSONObject: currently, options: .prettyPrinted)
                            let DataJson = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
                            let result = DataJson as? [String: AnyObject] ?? nil
                            if result != nil {
                                let  dataVO = OrderVO(data: result!)
                                arrDataOrder.append(dataVO)
                            }
                        } catch {
                            //handle code
                        }
                    }
                }
                 completion(arrDataOrder)
            }
        })
    }
    
    static func getInfoOrder(completion: @escaping(_ resData: [OrderVO?]) -> Void) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        var arrDataOrder = [OrderVO]()
        var arrDataProduct = [DetailVO]()
      //  var nameShoe = [String]()
        
        ref.child("orders").observeSingleEvent(of: .value, with: {(snapshot) in
          //  Utils.SHOW_LOG(title: "Snapshot", content: snapshot)
            if let data = snapshot.value as? [String: AnyObject] {
                
                for item in data {
                     Utils.SHOW_LOG(title: "data value", content: item.value)
                    if let currently = item.value as? [String: Any] {
                        do {
                            let product = currently["product"] ?? ""
                            let productData = try  JSONSerialization.data(withJSONObject: product, options: .prettyPrinted)
                            let productJson = try JSONSerialization.jsonObject(with: productData, options: .mutableLeaves)
                            let res = productJson as! [String: AnyObject]
                            for Product in res {
                                let valueProduct = Product.value
                                Utils.SHOW_LOG(title: "ValueProduct", content: valueProduct)
                                let valueproductData = try  JSONSerialization.data(withJSONObject: valueProduct, options: .prettyPrinted)
                                let valueproductJson = try JSONSerialization.jsonObject(with: valueproductData, options: .mutableLeaves)
                                let ValueProductresult = valueproductJson as? [String: AnyObject] ?? nil
                                
                                Utils.SHOW_LOG(title: "ValueProductresult", content: ValueProductresult)
                               
                                

                                Utils.SHOW_LOG(title: "arrDataProduct", content: product)
                                
                            }

                            let jsonData = try  JSONSerialization.data(withJSONObject: currently, options: .prettyPrinted)
                            let DataJson = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
                            let result = DataJson as? [String: AnyObject] ?? nil
                            if result != nil {
                                
                                let  dataVO = OrderVO(data: result!)
                                arrDataOrder.append(dataVO)
                            }
                            
                        }
                        catch {
                            //hendle error
                        }
                    }
                }
                completion(arrDataOrder)
               
            }
                
            
        })
    }
    
        
}
