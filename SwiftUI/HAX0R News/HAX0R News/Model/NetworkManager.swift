//
//  NetworkManager.swift
//  HAX0R News
//
//  Created by Slimn Srarena on 25/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

class NetworkManager:ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData ()  {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                debugPrint(result)
                                self.posts = result.hits
                            }
                        } catch {
                            debugPrint(error)
                        }
                    }
                }
            }
            dataTask.resume()
        }
    }
}
