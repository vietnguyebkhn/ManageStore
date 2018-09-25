//
//  ShoeVO.swift
//  ManageStore
//
//  Created by Apple on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class ShoeVO{
    var name: String
    var price: Int
    var albumImage: [String]
    var representImage: String
    var description: String
    var size: Int = 1
    var shoeId: Int = 0
    var shoeCount: Int = 1
    var brandID: Int!
    
    
    
    
    struct ShoeKeys{
        static let name = "name"
        static let price = "price"
        static let representImage = "represent_image"
        static let size = "size"
        static let description = "description"
        static let albumImage = "album_image"
        static let shoeId = "shoeId"
        static let shoeCount = "shoeCount"
        static let brandID = "brandid"

        
    }
    
    
    
    init(shoeDictionary: [String:AnyObject]) {
        name = shoeDictionary[ShoeKeys.name] as? String ?? ""
        price = shoeDictionary[ShoeKeys.price] as? Int ?? 0
        albumImage = shoeDictionary[ShoeKeys.albumImage] as? [String]  ?? [""]
        
        representImage = shoeDictionary[ShoeKeys.representImage] as? String ?? ""
        description = shoeDictionary[ShoeKeys.description] as? String ?? ""
        //        shoeId = shoeDictionary[ShoeKeys.size] as? Int ?? 0
        shoeId = shoeDictionary[ShoeKeys.shoeId] as? Int ?? 0
        brandID = shoeDictionary[ShoeKeys.brandID] as? Int ?? 0
        //        shoeCount = (shoeDictionary[ShoeKeys.shoeCount] as? Int) ?? 1
        
    }
    
    
    
}
