//
//  TodoListTableViewCell.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/17.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
