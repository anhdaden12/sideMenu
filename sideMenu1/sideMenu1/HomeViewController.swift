//
//  HomeViewController.swift
//  sideMenu1
//
//  Created by Ngoc on 7/4/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit
extension Notification.Name{
    static var myNotifiCation = Notification.Name("myNotifiCation")
    
}
class HomeViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
   

    @IBAction func onClickedMenu(_ sender: Any) {
        NotificationCenter.default.post(name: .myNotifiCation, object: nil, userInfo: nil)
    }
    

    
}
