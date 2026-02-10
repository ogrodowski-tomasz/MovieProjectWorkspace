import Foundation

public enum MovieNetworkProviderFactory {

    public static func makeLive(apiKey: String) -> MovieNetworkManagerProtocol {
        MovieNetworkManager(networkService: .init(apiKey: apiKey))
    }
}
