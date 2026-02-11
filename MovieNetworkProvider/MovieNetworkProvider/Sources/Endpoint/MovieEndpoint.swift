import Foundation

public protocol AppEndpoint {
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem]? { get }
    var stubDataFilename: String? { get }
}

enum MovieEndpoint {
    case topRated(language: String, page: Int)
    case popular(language: String, page: Int)
    case trending(type: String, language: String, page: Int)
}

extension MovieEndpoint: AppEndpoint {

    var method: String {
        switch self {
        case .topRated:
            "GET"
        case .popular:
            "GET"
        case .trending:
            "GET"
        }
    }

    var path: String {
        switch self {
        case .topRated:
            return "/3/movie/top_rated"
        case .popular:
            return "/3/movie/popular"
        case let .trending(type,_,_):
            return "/3/trending/movie/\(type)"
        }
    }

    var stubDataFilename: String? {
        switch self {
        case .topRated:
            return "MovieTopRatedStubData"
        case .popular:
            return nil
        case .trending:
            return nil
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case let .topRated(lang, page):
            return [
                URLQueryItem(name: "language", value: lang),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        case let .popular(lang, page):
            return [
                URLQueryItem(name: "language", value: lang),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        case let .trending(_, lang, page):
            return [
                URLQueryItem(name: "language", value: lang),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        }
    }
}

