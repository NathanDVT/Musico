//
//  ArtistMedia.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

struct ArtistMediaResponse: Decodable{
    var response: ArtistMedia
}

struct ArtistMedia: Decodable{
    var collections: [Collection]
}

struct Collection: Decodable {
    var artistName: String
    var collectionName: String
    var releaseDate: String
    var collectionPrice: String
    var trackTimeMillis: Int
}
