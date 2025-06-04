import SwiftUI

struct ContentView: View {
    @StateObject private var playlist = PlaylistViewModel()
    @StateObject private var search = ArtistSearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ArtistSearchView(viewModel: search, onAdd: { artist in
                    playlist.addArtist(artist)
                })
                PlaylistView(viewModel: playlist)
            }
            .navigationTitle("Auto Playlist")
        }
    }
}

#Preview {
    ContentView()
}
