//
//  ArtistMediaRequest.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

enum ArtistMediaError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct ArtistMediaRequest {
    let resourceURL: URL

    init(artistName: String) {
        let resourceString = "https://itunes.apple.com/search?term=\(artistName)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }

    func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let artistMediaResponse = try decoder.decode(ArtistMediaResponse.self, from: jsonData)
                let collections = artistMediaResponse.response.collections
                completion(.success(collections))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
