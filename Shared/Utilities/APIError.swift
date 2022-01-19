//
//  APIError.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
