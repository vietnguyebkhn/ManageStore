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
    var sortDataOrder = [OrderVO]()
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    func RequestGetDataOrder() {
        ProductService.getInfoOrder{[weak self] (dataResponse) in
            guard let strongSelf  = self else {
                return
            }
            if dataResponse != nil {
                self!.activityIndicator.stopAnimating()
                strongSelf.dataOrder = dataResponse.sorted(by: {$0!.date > ($1!.date) && $0!.time > $1!.time}) as! [OrderVO]
                strongSelf.sortDataOrder = dataResponse.sorted(by: {$0!.time > $1!.time}) as! [OrderVO]
                strongSelf.mTableView.reloadData()
            }
        }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  Utils.SHOW_LOG(title: "dataOrder.count", content: dataOrder.count)
        return sortDataOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OderItemManagementTableViewCell", for: indexPath) as! OderItemManagementTableViewCell
        if sortDataOrder != nil {
        cell.setData(data: sortDataOrder[indexPath.row])
        return cell
        } else {
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            if Utils.isConnectedToNetwork() {
            Utils.remove(child1: "orders", child2: sortDataOrder[indexPath.row].key)
            sortDataOrder.remove(at: indexPath.row)
            tableView.deleteRows(at:[indexPath], with: .automatic)
        }
         else {
            let alert = UIAlertController(title: "Thông báo", message: "Internet không khả dụng", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (action) in
                    
                }))
                self.present(alert, animated: true, completion: nil)
        }
        } else {
            print("khong the xoa")
        }
        
        mTableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ManageOrder", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.idOrder = sortDataOrder[indexPath.row].key
        detailVC.DataOrder = sortDataOrder
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mTableView.reloadData()
        RequestGetDataOrder()
        activityIndicator.color = .red
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.register(UINib(nibName: "OderItemManagementTableViewCell", bundle: nil), forCellReuseIdentifier: "OderItemManagementTableViewCell")
        RequestGetDataOrder()
        
        
        
     //   Utils.SHOW_LOG(title: "dataOrder.count", content: dataOrder.count)

        // Do any additional setup after loading the view.
    }
    

}
