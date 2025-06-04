import Foundation
import AVFoundation

@MainActor
final class PlaylistViewModel: ObservableObject {
    @Published private(set) var songs: [Song] = []
    @Published var sortOrder: SortOrder = .popular {
        didSet { Task { await reload() } }
    }

    func addArtist(_ artist: Artist) {
        Task { await fetchSongs(for: artist) }
    }

    func reload() async {
        songs.removeAll()
        for artistId in addedArtistIds {
            await fetchSongs(for: Artist(id: artistId, name: ""))
        }
    }

    // MARK: - private
    private var addedArtistIds: [Int] = []

    private func fetchSongs(for artist: Artist) async {
        if !addedArtistIds.contains(artist.id) {
            addedArtistIds.append(artist.id)
        }
        do {
            let fetched = try await MusicService.fetchTopSongs(artistId: artist.id, order: sortOrder)
            songs.append(contentsOf: fetched)
        } catch {
            print("Fetch songs error", error)
        }
    }
}
