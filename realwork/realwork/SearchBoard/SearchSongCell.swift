//
//  SearchSongCell.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/29.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class SearchSongCell: UITableViewCell {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var clipArtImage: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var albumname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCellContent(song: SearchSongDetail) {
// TO DO: Add color to selected later
//        let bgColorView = UIView()
//        bgColorView.backgroundColor = UIColor.red
//        selectedBackgroundView = bgColorView
        artistName.text = song.artistName
        songTitle.text = song.titleName
        albumname.text = song.collectionName

        guard let imageURL = URL(string: song.artworkUrl60) else {
            return
        }
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.clipArtImage.image = image
            }
        }
    }
}
