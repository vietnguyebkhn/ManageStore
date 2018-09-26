//
//  OderItemManagementTableViewCell.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class OderItemManagementTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mStatusImage: UIImageView!
    
    @IBOutlet weak var mDateLb: UILabel!
    @IBOutlet weak var mTimeLb: UILabel!
    @IBOutlet weak var mStatusLb: UILabel!
    @IBOutlet weak var mTotalMoney: UILabel!
    @IBOutlet weak var mNumberPhone: UILabel!
    @IBOutlet weak var mNameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data: OrderVO) {
        if data.status == 0 {
            mStatusLb.text = "Chưa xử lý"
            mStatusLb.textColor = .red
            mStatusImage.image = UIImage(named: "cancel")
        } else {
            mStatusLb.text = "Đã xử lý"
            mStatusLb.textColor = .green
            mStatusImage.image = UIImage(named: "checkmark")
        }
        mDateLb.text = data.date
        mTotalMoney.text = data.totalPrice
        mNumberPhone.text = data.phonenum
        mNameLb.text = data.namePeople
        mTimeLb.text = data.time
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
