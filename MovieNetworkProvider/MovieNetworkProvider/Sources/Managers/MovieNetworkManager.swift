import Foundation

public protocol MovieNetworkManagerProtocol {
    func fetchTopRated(language: SupportedLanguage, page: Int) async throws -> MovieResponseModel
    func fetchPopular(language: SupportedLanguage, page: Int) async throws -> MovieResponseModel
    func fetchTrending(type: TrendingType, language: SupportedLanguage, page: Int) async throws -> MovieResponseModel
}

public extension MovieNetworkManagerProtocol {
    func fetchTopRated(language: SupportedLanguage = .english, page: Int = 1) async throws -> MovieResponseModel {
        try await fetchTopRated(language: language, page: page)
    }

    func fetchPopular(language: SupportedLanguage = .english, page: Int = 1) async throws -> MovieResponseModel {
        try await fetchPopular(language: language, page: page)
    }
    func fetchTrending(type: TrendingType, language: SupportedLanguage = .english, page: Int = 1) async throws -> MovieResponseModel {
        try await fetchTrending(type: type, language: language, page: page)
    }
}

public final class MovieNetworkManager: MovieNetworkManagerProtocol {


    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }

    public func fetchTopRated(language: SupportedLanguage, page: Int) async throws -> MovieResponseModel {
        try await networkService.request(endpoint: MovieEndpoint.topRated(language: language.code, page: page), responseType: MovieResponseModel.self)
    }

    public func fetchPopular(language: SupportedLanguage, page: Int) async throws -> MovieResponseModel {
        try await networkService.request(endpoint: MovieEndpoint.popular(language: language.code, page: page), responseType: MovieResponseModel.self)
    }
    public func fetchTrending(type: TrendingType, language: SupportedLanguage, page: Int) async throws -> MovieResponseModel {
        try await networkService.request(endpoint: MovieEndpoint.trending(type: type.rawValue, language: language.code, page: page), responseType: MovieResponseModel.self)
    }

}
