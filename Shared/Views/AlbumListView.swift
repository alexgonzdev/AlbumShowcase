//
//  AlbumListView.swift
//  AlbumShowcase (iOS)
//
//  Created by Alex Gonzalez on 1/19/22.
//

import SwiftUI

struct AlbumListView: View {
    init() {
          let navBarAppearance = UINavigationBar.appearance()
          navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
          navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    @StateObject private var viewModel = AlbumListViewModel()
    var body: some View {
        NavigationView {
        ZStack {
            
            Color(0x1E232A).edgesIgnoringSafeArea(.all)
            
                
                ScrollView {
                ForEach(viewModel.albums) { album in
                    CardView(album: album)
                }
                }
                .navigationTitle("Top 50 Albums").foregroundColor(.white)
                .navigationBarTitleDisplayMode(.inline)
            }
            
            .onAppear() {
                viewModel.getAlbums()
            }
            //.navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
