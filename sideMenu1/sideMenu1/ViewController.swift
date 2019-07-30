//
//  ViewController.swift
//  sideMenu1
//
//  Created by Ngoc on 7/4/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sideMenu: UIView!{
        didSet{
                 sideMenu.dropShadow()
        }
    }
    
    @IBOutlet weak var leadingSideMenu: NSLayoutConstraint! {
        didSet{
           // leadingSideMenu.constant = -sideMenu.bounds.width
        }
    }
    @IBOutlet weak var coverButton: UIButton!
    
    private var isSideMenuOpen = false {
        didSet{
            if isSideMenuOpen {
               sideMenu.layer.masksToBounds = true
                leadingSideMenu.constant = -sideMenu.bounds.width
                coverButton.alpha = 0
            } else {
                
                leadingSideMenu.constant = 0
                 sideMenu.layer.masksToBounds = false
                coverButton.alpha = 0.3
            }
            
            UIView.animate(withDuration: 0.35){
                self.view.layoutIfNeeded()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        isSideMenuOpen = true
        getNotification()
        
    }

    @IBAction func onClickedButton(_ sender: Any){
        isSideMenuOpen.toggle()
        print(leadingSideMenu.constant)
    }
    
    
    func getNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(onClickedButton(_:)), name: .myNotifiCation, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension UIView {
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 3.5, height: 4)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

