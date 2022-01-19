//
//  NetworkManager.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import UIKit

class NetworkManager: NSObject {
    
    static let shared           = NetworkManager()
    
   
    
    private override init() {}
    
    
    func getAlbums(completed: @escaping (Result<[Album], APError>) -> Void) {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json") else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(Welcome.self, from: data)
                completed(.success(decodedResponse.feed.results))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
}
