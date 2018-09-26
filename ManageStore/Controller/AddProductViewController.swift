//
//  AddProductViewController.swift
//  ManageStore
//
//  Created by Apple on 9/26/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import Photos
import BSImagePicker

class AddProductViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UIImagePickerControllerDelegate{
   
    
    
    
    @IBOutlet weak var mImageCollectionView: UICollectionView!
    
    @IBOutlet weak var mProductNameTextField: UITextField!
    @IBOutlet weak var mPriceTextField: UITextField!
    
    @IBOutlet weak var mPickerView: UIPickerView!
    
    
//    private var imagePresenter: UploadImagesPresenter!
    let brand = ["Adidas","Nike","Jordan"]
    var selectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    var imagePresenter : ImagePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePresenter = ImagePresenter()
        mImageCollectionView.dataSource = imagePresenter
        mImageCollectionView.delegate = imagePresenter
        mImageCollectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        mImageCollectionView.reloadData()
        
    }
    
    @IBAction func onChooseImageTouch(_ sender: Any) {
        self.photoArray.removeAll()
//        imagePresenter.photoArray.removeAll()
        self.selectedAssets.removeAll()
        let bsVC = BSImagePickerViewController()
        self.bs_presentImagePickerController(bsVC, animated: true, select: { (asset: PHAsset) in
            
        }, deselect: { (asset: PHAsset) in
            
        }, cancel: { (assets: [PHAsset]) in
            
        }, finish: { (assets: [PHAsset]) in
            for i in 0..<assets.count{
                self.selectedAssets.append(assets[i])
            }
            self.convertAssetToImage()

        }, completion: nil)
    }
    func convertAssetToImage(){
        if selectedAssets.count != 0{
            for i in 0..<selectedAssets.count{
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumnail = UIImage()
                option.isSynchronous = true
                manager.requestImage(for: selectedAssets[i], targetSize: CGSize(width: 240, height: 128), contentMode: .aspectFill, options: option, resultHandler: { (result, info) in
                    thumnail = result!
                })
                let data = UIImageJPEGRepresentation(thumnail, 1)
                let newImage = UIImage(data: data!)
                self.photoArray.append(newImage! as UIImage)
                imagePresenter.add(image: newImage!)
                DispatchQueue.main.sync {
                    mImageCollectionView.reloadData()

                }
            }
            
        }
    }
    
    
    @IBAction func onSaveButtonTouch(_ sender: Any) {
    }
    
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brand.count
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = brand[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 12/255.0, green: 175/255.0, blue: 255/255, alpha: 1)])
        
        return myTitle
    }

   
}
