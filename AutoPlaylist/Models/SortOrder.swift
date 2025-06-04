import Foundation

enum SortOrder {
    case popular
    case recent

    var apiParameter: String {
        switch self {
        case .popular:
            return "popular"
        case .recent:
            return "recent"
        }
    }
}
