//
//  CollectionViewCell.swift
//  CollectionScroll
//
//  Created by Reza Khalafi on 3/14/17.
//  Copyright © 2017 Reza Khalafi. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    
}


extension CollectionViewCell {
    
    
    func setTableViewDataSourceDelegate<D: UITableViewDataSource & UITableViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
        tableView.tag = row
        tableView.setContentOffset(tableView.contentOffset, animated:false)
    }
    
    var tableViewOffset: CGFloat {
        set { tableView.contentOffset.x = newValue }
        get { return tableView.contentOffset.x }
    }
}
