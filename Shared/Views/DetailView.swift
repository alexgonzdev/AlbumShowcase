//
//  DetailView.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.openURL) var openURL
    let album: Album
    var body: some View {
        ZStack {
            
            Color(0x1E232A).edgesIgnoringSafeArea(.all)
        VStack {
            AsyncImage(url: URL(string: album.artworkUrl100)) { result in
                switch result {
                case .empty:
                    Color.pink.opacity(0.1).frame(width: UIScreen.screenWidth / 1.2, height: UIScreen.screenHeight / 3)
                        .frame(width: UIScreen.screenWidth / 1.2, height: UIScreen.screenHeight / 3)
                        .scaledToFit()
                        .cornerRadius(10)
                       
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: UIScreen.screenWidth / 1.2, height: UIScreen.screenHeight / 3)
                        .scaledToFit()
                        .cornerRadius(10)
                case .failure(_):
                    Image(systemName: "exclamationmark.icloud")
                        .resizable()
                        .frame(width: UIScreen.screenWidth / 1.2, height: UIScreen.screenHeight / 3)
                        .scaledToFit()
                        .cornerRadius(10)                @unknown default:
                    Image(systemName: "exclamationmark.icloud")
                        .frame(width: UIScreen.screenWidth / 1.2, height: UIScreen.screenHeight / 3)
                        .scaledToFit()
                        .cornerRadius(10)
                }
            }
                
                
            
            Text(album.name).font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.white)
                .minimumScaleFactor(0.01)
            
            Text(album.artistName).font(.system(size: 16, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .minimumScaleFactor(0.01)
            
            Text(album.genres[0].name).font(.system(size: 16, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .minimumScaleFactor(0.01)
            
            
            Text(album.releaseDate)
            
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .minimumScaleFactor(0.01)
            
            Text("Copyright © 2022 Apple Inc. All rights reserved.")
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(.white)
                .minimumScaleFactor(0.01)
            
            Spacer()
            Button("Listen on Apple Music") {
                if let albumurl = URL(string: album.url) {
                    openURL(albumurl)
                                
                            }
                }
                .buttonStyle(StyledButton())
            Spacer().frame(height: 20)
            
        }
        
    }
        
    }
}


struct StyledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(.white)
            .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight / 14.246, alignment: .center)
            .background(Color(0xEF445D))
            .cornerRadius(10)
    }
}
