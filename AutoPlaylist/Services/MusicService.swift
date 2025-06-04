import Foundation

struct MusicService {
    static func searchArtists(keyword: String) async throws -> [Artist] {
        guard let url = URL(string: "https://itunes.apple.com/search") else { return [] }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "term", value: keyword),
            URLQueryItem(name: "entity", value: "musicArtist"),
            URLQueryItem(name: "limit", value: "25")
        ]
        let (data, _) = try await URLSession.shared.data(from: components.url!)
        let result = try JSONDecoder().decode(SearchArtistResponse.self, from: data)
        return result.results
    }

    static func fetchTopSongs(artistId: Int, order: SortOrder = .popular) async throws -> [Song] {
        guard let url = URL(string: "https://itunes.apple.com/lookup") else { return [] }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "id", value: String(artistId)),
            URLQueryItem(name: "entity", value: "song"),
            URLQueryItem(name: "limit", value: "10"),
            URLQueryItem(name: "sort", value: order.apiParameter)
        ]
        let (data, _) = try await URLSession.shared.data(from: components.url!)
        let result = try JSONDecoder().decode(LookupSongResponse.self, from: data)
        return result.results.filter { $0.previewURL != nil }
    }
}

private struct SearchArtistResponse: Decodable {
    let results: [Artist]
}

private struct LookupSongResponse: Decodable {
    let results: [Song]
}
