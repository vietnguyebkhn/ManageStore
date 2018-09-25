//
//  ProductCollectionViewCell.swift
//  ManageStore
//
//  Created by Apple on 9/24/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import Nuke
class ProductAdidasCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mProductImage: UIImageView?
    @IBOutlet weak var mProductName: UILabel?
    func setData(data: ShoeVO){
        var url: String?
        url = data.representImage
        
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: url!)!))
        Nuke.loadImage(with: request, into: mProductImage!)
    }
    
}
