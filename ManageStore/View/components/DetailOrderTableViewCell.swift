//
//  DetailOrderTableViewCell.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/26/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import Nuke

class DetailOrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mImageShoe: UIImageView!
    
    @IBOutlet weak var mAmount: UILabel!
    @IBOutlet weak var mSize: UILabel!
    @IBOutlet weak var mPriceItem: UILabel!
    @IBOutlet weak var mNameShoe: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data: DetailVO){
        var url = data.represent_image
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: url)!))
        Nuke.loadImage(with: request, into: mImageShoe)
        mAmount.text = "\(data.count)"
        mSize.text = "\(data.size)"
        mNameShoe.text = data.nameShoe
        mPriceItem.text = "\(data.price)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
