//
//  CardView.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import SwiftUI

struct CardView: View {
    @State var showSheetView = false
    let album: Album
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                Spacer().frame(width: UIScreen.screenWidth / 20.38)
                VStack(alignment: .leading) {
                    Text(album.name).frame(width: UIScreen.screenWidth / 2, height: UIScreen.screenHeight / 28.93, alignment: .leading)
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.01)
                    Spacer().frame(height: UIScreen.screenHeight / 107)
                    Text(album.artistName)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .frame(width: UIScreen.screenWidth / 2.872, height: UIScreen.screenHeight / 28.93, alignment: .leading)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.01)
                    
                }
                Spacer().frame(width: UIScreen.screenWidth / 14.144)
                
                AsyncImage(url: URL(string: album.artworkUrl100)) { result in
                    switch result {
                    case .empty:
                        Color.pink.opacity(0.1)
                            .frame(width: UIScreen.screenWidth / 5.70, height: UIScreen.screenHeight / 12.86)
                            .cornerRadius(10)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: UIScreen.screenWidth / 5.70, height: UIScreen.screenHeight / 12.86)
                            .cornerRadius(10)
                    case .failure(_):
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .frame(width: UIScreen.screenWidth / 5.70, height: UIScreen.screenHeight / 12.86)
                            .cornerRadius(10)
                    @unknown default:
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .frame(width: UIScreen.screenWidth / 5.70, height: UIScreen.screenHeight / 12.86)
                            .cornerRadius(10)
                    }
                }
                
                
                Spacer().frame(width: UIScreen.screenWidth / 22.526)
            }
            .onTapGesture {
                showSheetView.toggle()
            }
        }.sheet(isPresented: $showSheetView) {
            DetailView(album: album)
        }
        
        .frame(width: UIScreen.screenWidth / 1.08, height: UIScreen.screenHeight / 10.767)
        .background(Color(0x2D333C))
        .cornerRadius(10)
        
    }
}




