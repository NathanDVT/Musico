//
//  PlaylistTableViewCell.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/31.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {

    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var numSongsUILabel: UILabel!
    @IBOutlet weak var artWorkImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
