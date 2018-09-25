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
    
        
}
