//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Jesse Sahli on 4/27/17.
//  Copyright © 2017 JS. All rights reserved.
//

import UIKit

enum Section : Int {
    case toDo
    case done
}


class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var itemManager : ItemManager?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let itemManager = itemManager else {
             return 0
        }
        guard let itemSection = Section.init(rawValue: section) else {
            fatalError("PROBLEM WITH ITEMLISTDATAPROVIDER SECTION")
        }
        let numberOfRows : Int
        switch itemSection {
            case .toDo:
                numberOfRows = itemManager.toDoCount
            case .done:
                numberOfRows = itemManager.doneCount
        }
        return numberOfRows
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        if let item = itemManager?.item(at: indexPath.row) {
            cell.configCell(with: item)
        }
        
        return cell
    }

}
