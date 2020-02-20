//
//  TableCell.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
