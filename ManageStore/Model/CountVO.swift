//
//  CountVO.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class CountVO {
    var count = 0
    init() {
        
    }
    
    init(data: [String: AnyObject]) {
        count = data["conut"] as? Int ?? 0
    }
}
