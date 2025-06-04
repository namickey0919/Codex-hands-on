import SwiftUI

struct ArtistSearchView: View {
    @ObservedObject var viewModel: ArtistSearchViewModel
    var onAdd: (Artist) -> Void

    var body: some View {
        VStack {
            HStack {
                TextField("Search artist", text: $viewModel.keyword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit { Task { await viewModel.search() } }
                if viewModel.isLoading { ProgressView() }
            }
            List(viewModel.results) { artist in
                Button(action: { onAdd(artist) }) {
                    Text(artist.name)
                }
            }
            .frame(maxHeight: 200)
        }
        .padding()
    }
}

#Preview {
    ArtistSearchView(viewModel: ArtistSearchViewModel(), onAdd: { _ in })
}
