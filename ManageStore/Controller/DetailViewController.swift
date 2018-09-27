//
//  DetailViewController.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/27/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mStatusLb: UILabel!
    @IBOutlet weak var mTotalPrice: UILabel!
    @IBOutlet weak var mAddress: UILabel!
    @IBOutlet weak var mPhoneNumber: UILabel!
    @IBOutlet weak var mNameCus: UILabel!
    var idOrder = ""
    var DataOrder = [OrderVO]()
    
    @IBAction func mHanding(_ sender: Any) {
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.register(UINib(nibName: "DetailOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailOrderTableViewCell")
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        for item in DataOrder {
            if idOrder == item.key {
                if item.status == 0 {
                    mStatusLb.text = "Chua xu li"
                    mStatusLb.textColor = .red
                } else {
                    mStatusLb.textColor = .green
                    mStatusLb.text = "Da xu ly"
                }
                mTotalPrice.text = item.totalPrice
                mAddress.text = item.address
                mPhoneNumber.text = "\(item.phonenum)"
                mNameCus.text = item.namePeople
            }
            
        }
          mTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if idOrder != "" {
            for item in DataOrder {
                if idOrder == item.key {
                    return item.products.count
                }
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailOrderTableViewCell", for: indexPath) as! DetailOrderTableViewCell
        for item in DataOrder {
            if idOrder == item.key {
                
                cell.setData(data: item.products[indexPath.row])
                return cell
            
            }
        }
        return cell
    }

    

}
