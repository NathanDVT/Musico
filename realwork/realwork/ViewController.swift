//
//  ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/04.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfArtistCollections = [Collection]() {
        didSet {
            print(self.listOfArtistCollections)
        }
    }

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello")
        //getSearchResults(searchTerm: "Beyonce")
        getInformation()
        print(listOfArtistCollections)
    }
    func getSearchResults(searchTerm: String) {
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer {self.dataTask = nil}
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print(data)
                    DispatchQueue.main.async {
                        do {
                            let musicList = try JSONDecoder().decode(SwiftFourMusicResults.self, from: data)
                            print( String(musicList.resultCount))
                        } catch let error {
                            print(error)
                        }
                    }
                }
            }
            dataTask?.resume()
        }
    }

    func getInformation() {
        let name = "beyonce"
        let artistMediaRequest = ArtistMediaRequest(artistName: name)
        artistMediaRequest.getArtistMedia { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let collections):
                self?.listOfArtistCollections = collections
            }
        }
    }
}

struct SwiftFourMusicResults: Decodable {
    let resultCount: Int
}
