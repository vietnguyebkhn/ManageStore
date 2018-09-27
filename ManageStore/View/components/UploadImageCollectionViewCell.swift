//
//  UploadImageCollectionViewCell.swift
//  ManageStore
//
//  Created by Apple on 9/26/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class UploadImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mProductmage: UIImageView!
    func setData(data: UIImage){
        mProductmage.image = data
    }
}
