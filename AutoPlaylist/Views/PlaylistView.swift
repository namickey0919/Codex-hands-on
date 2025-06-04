import SwiftUI

struct PlaylistView: View {
    @ObservedObject var viewModel: PlaylistViewModel
    @StateObject private var player = PlayerViewModel()

    var body: some View {
        VStack {
            Picker("Order", selection: $viewModel.sortOrder) {
                Text("Ranking").tag(SortOrder.popular)
                Text("Latest").tag(SortOrder.recent)
            }
            .pickerStyle(SegmentedPickerStyle())

            Button("Shuffle Play") {
                player.playShuffle(songs: viewModel.songs)
            }
            .padding(.vertical)

            List(viewModel.songs) { song in
                Text(song.title)
            }
        }
    }
}

#Preview {
    PlaylistView(viewModel: PlaylistViewModel())
}
