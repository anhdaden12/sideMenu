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
    static var dataNotification = Notification.Name("dataNotification")
}
class HomeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setText(notification:)), name: .dataNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func setText(notification: NSNotification) {
        label.text = notification.object as? String
    }

    @IBAction func onClickedMenu(_ sender: Any) {
        NotificationCenter.default.post(name: .myNotifiCation, object: nil, userInfo: nil)
    }
    

    
}
