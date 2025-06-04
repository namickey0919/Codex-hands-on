import Foundation

@MainActor
final class ArtistSearchViewModel: ObservableObject {
    @Published var keyword: String = ""
    @Published var results: [Artist] = []
    @Published var isLoading = false

    func search() async {
        let keyword = keyword.trimmingCharacters(in: .whitespaces)
        guard !keyword.isEmpty else { return }
        isLoading = true
        defer { isLoading = false }
        do {
            results = try await MusicService.searchArtists(keyword: keyword)
        } catch {
            print("Search error", error)
        }
    }
}
