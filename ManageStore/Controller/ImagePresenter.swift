////
////  ImagePresenter.swift
////  ManageStore
////
////  Created by Apple on 9/26/18.
////  Copyright © 2018 Việt Nguyễn. All rights reserved.
////
//
//import UIKit
//
//class ImagePresenter: NSObject, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    var photoArray : [UIImage] = []
//    func add(image: UIImage) {
//        photoArray.append(image)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photoArray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ImageCell", for: indexPath) as! UploadImageCollectionViewCell
//        
//                cell.setData(data: photoArray[indexPath.item])
//        
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width - 30, height: collectionView.frame.height)
//    }
//    
//
//}
