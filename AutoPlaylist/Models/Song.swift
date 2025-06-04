import Foundation

struct Song: Identifiable, Decodable {
    let id: Int
    let title: String
    let previewURL: URL?

    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case title = "trackName"
        case previewURL = "previewUrl"
    }
}
