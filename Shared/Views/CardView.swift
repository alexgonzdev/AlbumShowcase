//
//  CardView.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import SwiftUI

struct CardView: View {
    let album: Album
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                Spacer().frame(width: UIScreen.screenWidth / 20.38)
                VStack(alignment: .leading) {
                    Text(album.name).frame(width: UIScreen.screenWidth / 2, height: UIScreen.screenHeight / 28.93, alignment: .leading)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.01)
                    Spacer().frame(height: UIScreen.screenHeight / 107)
                    Text(album.artistName)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .frame(width: UIScreen.screenWidth / 2.872, height: UIScreen.screenHeight / 28.93, alignment: .leading)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.01)
                    
                }
                Spacer().frame(width: UIScreen.screenWidth / 14.144)
                
                Image("pop")
                    .resizable()
                    .frame(width: UIScreen.screenWidth / 5.70, height: UIScreen.screenHeight / 12.86)
                
                    .cornerRadius(10)
                Spacer().frame(width: UIScreen.screenWidth / 22.526)
            }
            
        }
        .frame(width: UIScreen.screenWidth / 1.2334, height: UIScreen.screenHeight / 10.767)
        .background(Color(0x2D333C))
        .cornerRadius(10)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(album: Album(artistName: "Pop Smoke", name: "Meet The Woo 2", releaseDate: "Meet The Woo 2", kind: Kind.albums, artistID: "", artistURL: "", contentAdvisoryRating: nil, artworkUrl100: "", genres: [Genre(genreID: "", name: "", url: "")], url: ""))
    }
}
extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

