//
//  OderManagementViewController.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 9/25/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class OderManagementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var mTableView: UITableView!
    var dataOrder = [OrderVO]()
    
    func RequestGetDataOrder() {
        ProductService.getInfoOrder{[weak self] (dataResponse) in
            guard let strongSelf  = self else {
                return
            }
            if dataResponse != nil {
                strongSelf.dataOrder = dataResponse as! [OrderVO]
               
                strongSelf.mTableView.reloadData()
            }
        }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  Utils.SHOW_LOG(title: "dataOrder.count", content: dataOrder.count)
        return dataOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OderItemManagementTableViewCell", for: indexPath) as! OderItemManagementTableViewCell
        cell.setData(data: dataOrder[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.register(UINib(nibName: "OderItemManagementTableViewCell", bundle: nil), forCellReuseIdentifier: "OderItemManagementTableViewCell")
        RequestGetDataOrder()
     //   Utils.SHOW_LOG(title: "dataOrder.count", content: dataOrder.count)

        // Do any additional setup after loading the view.
    }
    

}
