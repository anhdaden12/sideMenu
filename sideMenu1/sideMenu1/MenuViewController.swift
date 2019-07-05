//
//  MenuViewController.swift
//  sideMenu1
//
//  Created by Ngoc on 7/4/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var textName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onClickedSenddata(_ sender: Any) {
        NotificationCenter.default.post(name: .dataNotification, object: textName.text)
    }
    
}
