//
//  ReusableTrendingTile.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/17.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class ReusableTrendingTile: UIView {

    let nibName = "ReusableTrendingTile"

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var artistBackgroundGradient: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    @IBOutlet var customView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        customView.frame = self.bounds
        addSubview(customView)
//        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    public func populateFields(trendingArtist: TrendingArtistModel) {
        artistLabel.text = trendingArtist.artistName
        guard let imageURL = URL(string: trendingArtist.picurl) else {
            return
        }
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                // TO DO investigate if this should be a weak reference
                self.backgroundImage.image = image
            }
        }
    }
}
