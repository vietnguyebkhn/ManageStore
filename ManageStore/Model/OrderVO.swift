//
//  OderVO.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class OrderVO {
    var address = ""
    var date = ""
    var key = ""
    var namePeople = ""
    var phonenum = ""
    var status = 0
    var time = ""
    var totalPrice = ""
    var products = [DetailVO]()
    var size = 0
    var nameShoe = ""
    var count = 0
    var price = 0
    var represent_image = ""
    init() {
    }
    
    init(data: [String: AnyObject]) {
        address = data["address"] as? String ?? ""
        date = data["date"] as? String ?? ""
        key = data["key"] as? String ?? ""
        namePeople = data["customer_name"] as? String ?? ""
        phonenum = data["phonenum"] as? String ?? ""
        status = data["status"] as? Int ?? 0
        time = data["time"] as? String ?? ""
        guard let productArr = data["product"] as? [String: AnyObject] else {
            print("hon the doc")
            return
        }
        
        for item in productArr.values {
            print("item = \(item)")
            do {
            let jsonData = try  JSONSerialization.data(withJSONObject: item, options: .prettyPrinted)
            let DataJson = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
            let result = DataJson as? [String: AnyObject] ?? nil
            
            let product = DetailVO.init(data: result!)
            products.append(product)
            } catch {
                
            }
        }
       totalPrice = data["totalPrice"] as? String ?? ""
//        size = products.size
//        nameShoe = products.nameShoe
//        count = product.count
//        price = product.price
//       represent_image = product.represent_image
//     //   product = data["product"] as! DetailVO
        //product = data["product"] as? [String] ?? [""]
      
    }
    
}
//address:
//"Asia’s"
//date:
//"2018/09/26"
//key:
//"-LNJo5CdFbaRPWeVrzhh"
//name:
//"test 3"
//phonenum:
//"0965444555"
//product
//-LNJo5CdFbaRPWeVrzhi
//count:
//1
//name:
//"Nike Rise React Flyknit LMTD"
//price:
//5000000
//represent_image:
//"https://c.static-nike.com/a/images/t_PDP_864_v1..."
//size:
//39
//-LNJo5CeoVZ2G07NOaIS
//count:
//1
//name:
//"Nike Rise React Flyknit LMTD"
//price:
//5000000
//represent_image:
//"https://c.static-nike.com/a/images/t_PDP_864_v1..."
//size:
//41
//-LNJo5CeoVZ2G07NOaIT
//count:
//1
//name:
//"Nike Air Force 270"
//price:
//4500000
//represent_image:
//"https://c.static-nike.com/a/images/t_PDP_864_v1..."
//size:
//40
//-LNJo5CeoVZ2G07NOaIU
//status:
//0
//time:
//"14:38"
//totalPrice:
//"19.000.000"
////
