//
//  Utils.swift
//  Diary
//
//  Created by Nguyễn Việt on 9/5/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import SystemConfiguration


class Utils {
    
    static func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
    
    static let defaults = UserDefaults.standard
    static let ref = Database.database().reference()
    
    static func remove(child1: String, child2: String) {
        
        let ref = self.ref.child(child1).child(child2)
        
        ref.removeValue { error, _ in
            
            print(error ?? "")
        }
    }
    
    static func showMessage(title: String?, message: String?, viewcontroler: UIViewController) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        viewcontroler.present(alert, animated: true, completion: nil)
    }
    
    static func getLoginFacebookTouched() -> Bool {
        return defaults.object(forKey: "loginFacebookTouched") as? Bool ?? false
    }
    
    static func SHOW_LOG(content: Any) {
        print(content)
    }
    static func SHOW_LOG(title: String, content: Any) {
        print("\(title): \(content)")
    }
    
    
    
}


