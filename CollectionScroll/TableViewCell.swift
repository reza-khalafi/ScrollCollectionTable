//
//  TableViewCell.swift
//  CollectionScroll
//
//  Created by Reza Khalafi on 3/14/17.
//  Copyright © 2017 Reza Khalafi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet var mainImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
