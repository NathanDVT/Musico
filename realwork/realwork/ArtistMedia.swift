//
//  ArtistMedia.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

struct ArtistMediaResponse: Decodable {
    var results: [Collection]
}

struct Collection: Decodable {
    var artistName: String
    var collectionName: String
    var releaseDate: String
    var artworkUrl30: String
    var collectionPrice: Double
    var trackTimeMillis: Int
    var artworkUrl60: String
}
