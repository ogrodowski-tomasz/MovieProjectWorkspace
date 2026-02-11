import Foundation

protocol AppEndpoint {
    var path: String { get }
    var method: String { get }

}

enum MovieEndpoint {
    case topRated(language: String, page: Int)
}

extension MovieEndpoint: AppEndpoint {

    var scheme: String {
        "https"
    }

    var host: String {
        "api.themoviedb.org"
    }

    var method: String {
        switch self {
        default: return "GET"
        }
    }

    var path: String {
        switch self {
        case .topRated:
            return "movie/top_rated"
        }
    }

    var stubDataFilename: String? {
        switch self {
        case .topRated:
            return "MovieTopRatedStubData"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case let .topRated(lang, page):
            return [
                URLQueryItem(name: "language", value: lang),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        }
    }

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        if let queryItems, !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        return components.url
    }
}

