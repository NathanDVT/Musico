//
//  ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/04.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let listOfArtistCollections = [Collection]()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello")
        //getSearchResults(searchTerm: "Beyonce")
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
    
    
}

struct SwiftFourMusicResults: Decodable {
    let resultCount: Int
}
