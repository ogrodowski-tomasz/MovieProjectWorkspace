import Foundation

public protocol MovieNetworkManagerProtocol {
    func fetchMovies(language: String, page: Int) async throws -> MovieResponseModel
}

public extension MovieNetworkManagerProtocol {
    func fetchMovies(language: String = "en-US", page: Int = 1) async throws -> MovieResponseModel {
        try await fetchMovies(language: language, page: page)
    }
}


public final class MovieNetworkManager: MovieNetworkManagerProtocol {

    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }

    public func fetchMovies(language: String, page: Int) async throws -> MovieResponseModel {
        try await networkService.request(endpoint: MovieEndpoint.topRated(page: page), responseType: MovieResponseModel.self)
    }
}
