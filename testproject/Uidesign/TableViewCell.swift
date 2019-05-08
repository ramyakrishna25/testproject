//
//  TableViewCell.swift
//  Uidesign
//
//  Created by Ashok Gudipati on 04/05/19.
//  Copyright © 2019 Ashok Gudipati. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labss: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
