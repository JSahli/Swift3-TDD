//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Jesse Sahli on 4/27/17.
//  Copyright © 2017 JS. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!

    override func viewDidLoad() {
        self.tableView.dataSource = dataProvider
        self.tableView.delegate = dataProvider
    }

    
}
