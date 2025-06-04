import Foundation

struct Artist: Identifiable, Decodable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "artistId"
        case name = "artistName"
    }
}
