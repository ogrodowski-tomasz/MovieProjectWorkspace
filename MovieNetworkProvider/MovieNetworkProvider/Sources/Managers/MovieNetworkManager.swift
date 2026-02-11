import Foundation

public protocol MovieNetworkManagerProtocol {
    func fetchTopRated(language: String, page: Int) async throws -> MovieResponseModel
}

public extension MovieNetworkManagerProtocol {
    func fetchTopRated(language: String = "en-US", page: Int = 1) async throws -> MovieResponseModel {
        try await fetchTopRated(language: language, page: page)
    }
}


public final class MovieNetworkManager: MovieNetworkManagerProtocol {

    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }

    public func fetchTopRated(language: String, page: Int) async throws -> MovieResponseModel {
        try await networkService.request(endpoint: MovieEndpoint.topRated(language: language, page: page), responseType: MovieResponseModel.self)
    }
}
