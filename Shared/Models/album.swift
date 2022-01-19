//
//  album.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import Foundation
import UIKit



// MARK: - Welcome
struct Welcome: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Album]
}

// MARK: - Author
struct Author: Codable {
    let name: String
    let url: String
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}

// MARK: - Result
struct Album: Identifiable, Codable {
    let artistName, name, releaseDate: String
    let id = UUID()
    let kind: Kind
    let artistID: String?
    let artistURL: String?
    let contentAdvisoryRating: ContentAdvisoryRating?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case contentAdvisoryRating, artworkUrl100, genres, url
    }
}

enum ContentAdvisoryRating: String, Codable {
    case explict = "Explict"
}

// MARK: - Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case albums = "albums"
}



enum FetchError: Error {
    case noURL
}
func fetchAlbums() async throws -> [Album] {
    
    
    guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json") else { throw FetchError.noURL }
    let request = URLRequest(url: url)
    let (data, _) = try await URLSession.shared.data(for: request)
    let parsedJSON = try JSONDecoder().decode(Welcome.self, from: data)
    
    
    var fetchedAlbums = [Album]()
        
    for album in parsedJSON.feed.results {
        
        fetchedAlbums.append(album)
            
        }
    
   
    
    
    return fetchedAlbums
}
/*
func doRegularWork() {
    Task {
        try? await fetchAlbums()
    }
}
doRegularWork()
*/
