//
//  AlbumViewViewModel.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import Foundation


final class AlbumListViewModel: ObservableObject {
    @Published var albums: [Album] = []
    @Published var isLoading = false
    
    
    func getAlbums() {
        NetworkManager.shared.getAlbums { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let albums):
                    self.albums = albums
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        print("")
                    case .invalidData:
                        print("")
                    case .invalidResponse:
                        print("")
                    case .unableToComplete:
                        print("")
                    }
                }
            }
            
        }
    }
}
