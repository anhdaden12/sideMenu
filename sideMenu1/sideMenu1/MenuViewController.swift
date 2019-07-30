//
//  MenuViewController.swift
//  sideMenu1
//
//  Created by Ngoc on 7/4/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    
    

    
    let category = ["Woman", "Man", "Girl", "Boy", "Baby", "Special Offer"]
    let childCategory = [["New product", "List of product", "Special product","Library"],
                         ["New product", "List of product", "Special product","Library"],
                         ["New product", "List of product", "Special product","Library"],
                         ["New product", "List of product", "Special product","Library"],
                         ["New product", "List of product", "Special product","Library"],
                         ["New product", "List of product", "Special product","Library"]
    ]
    var disPlayCategory = [[String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        disPlayCategory = childCategory
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disPlayCategory[section].count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
             let CategoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            CategoryCell.textLabel?.text = category[indexPath.section]
            return CategoryCell
        } else {
             let DetailCategoryCell = tableView.dequeueReusableCell(withIdentifier: "DetailCategoryCell", for: indexPath) as! Customcell
                DetailCategoryCell.label.text = disPlayCategory[indexPath.section][indexPath.row - 1]
            return DetailCategoryCell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {return}
        if disPlayCategory[indexPath.section].isEmpty {
            let indexSet = [Int](1...childCategory[indexPath.section].count).map{
                IndexPath(row: $0, section: indexPath.section)
            }
            disPlayCategory[indexPath.section] = childCategory[indexPath.section]
            tableView.insertRows(at: indexSet, with: .top)
        } else {
            let indexSet = [Int](1...childCategory[indexPath.section].count).map{
                IndexPath(row: $0, section: indexPath.section)
            }
            disPlayCategory[indexPath.section] = []
            tableView.deleteRows(at: indexSet, with: .top)
        }
    }
}
