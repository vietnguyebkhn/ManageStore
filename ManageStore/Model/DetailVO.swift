//
//  OderVO.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class DetailVO {
   
    var size = 0
    var nameShoe = ""
    var count = 0
    var price = 0
    var represent_image = ""
    init() {
    }
    
    init(data: [String: AnyObject]) {
        size = data["size"] as? Int ?? 0
        nameShoe = data["name"] as? String ?? ""
        count = data["count"] as? Int ?? 0
        price = data["price"] as? Int ?? 0
        represent_image = data["represent_image"] as? String ?? ""
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
