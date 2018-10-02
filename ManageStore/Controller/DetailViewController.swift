//
//  DetailViewController.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/27/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mStatusLb: UILabel!
    @IBOutlet weak var mTotalPrice: UILabel!
    @IBOutlet weak var mAddress: UILabel!
    @IBOutlet weak var mPhoneNumber: UILabel!
    @IBOutlet weak var mNameCus: UILabel!
    var idOrder = ""
    var DataOrder = [OrderVO]()
    var ref: DatabaseReference!
  
    @IBOutlet weak var mStatusLabel: UILabel!
    
    @IBOutlet weak var mHandingOutlet: UIButton!
    @IBAction func mHanding(_ sender: Any) {
        for item in DataOrder {
            if idOrder == item.key {
                  ref = Database.database().reference()
                 let key = item.key
                
                if item.status == 0 {
                    ref.child("orders").child("\(item.key)").updateChildValues(["status" : 1])
                    mStatusLb.text = "Đã xử lý"
                    mStatusLb.textColor = .green
                    mStatusLb.font = UIFont.boldSystemFont(ofSize: 18)
                    mStatusLabel.backgroundColor = UIColor(red: 149/255, green: 254/255, blue: 105/255, alpha: 1)
                    mStatusLabel.text = "Huỷ xử lý"
                    mStatusLabel.textColor = .red
                    item.status = 1
                    
                } else {
                    ref.child("orders").child("\(item.key)").updateChildValues(["status" : 0])

                    mStatusLb.textColor = .red
                    mStatusLb.text = "Chưa xử lý"
                    mStatusLabel.backgroundColor = .red
                    mStatusLabel.text = "Xử lý"
                    mStatusLabel.textColor = .white

                    item.status = 0
                }
               
            }
            
        }
        
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
                    mStatusLb.text = "Chưa xử lý"
                    mStatusLb.textColor = .red
                    mStatusLabel.backgroundColor = .red
                    mStatusLabel.text = "Xử lý"
                    mStatusLabel.textColor = .white

                } else {
                    mStatusLb.textColor = .green
                    mStatusLb.font = UIFont.boldSystemFont(ofSize: 18)
                    mStatusLb.text = "Đã xử lý"
                    mStatusLabel.backgroundColor = UIColor(red: 149/255, green: 254/255, blue: 105/255, alpha: 1)
                    mStatusLabel.text = "Huỷ xử lý"
                    mStatusLabel.textColor = .red
                    
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
