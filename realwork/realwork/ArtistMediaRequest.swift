//
//  ArtistMediaRequest.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import poddy

enum ArtistMediaError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct ArtistMediaRequest {
    let resourceURL: URL

    init(artistName: String) {
        self.resourceURL = firstClassCitizen(artistName: artistName)
    }

    func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        print(progress1)
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let artistMediaResponse = try decoder.decode(ArtistMediaResponse.self, from: jsonData)
                let collections = artistMediaResponse.results
                completion(.success(collections))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
