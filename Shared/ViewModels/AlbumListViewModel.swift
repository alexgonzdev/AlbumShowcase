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
                            // these 4 should handle the errors with preferably an alert but I got a sleep disorder called narcolepsy and it's late so i don't want to fall asleep before uploading it, therefore i'm pushing it like this, apologies for that
                        print("There is an error trying to reach the server. If this persists, please contact support.")
                    case .invalidData:
                        print("Unable to complete your request at this time. Please check your internet connection.")
                    case .invalidResponse:
                        print("Invalid response from the server. Please try again or contact support.")
                    case .unableToComplete:
                        print("The data received from the server was invalid. Please try again or contact support.")
                    }
                }
            }
            
        }
    }
}
