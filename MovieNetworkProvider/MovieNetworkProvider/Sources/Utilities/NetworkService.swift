import Foundation

public enum APIError: Error {
    case invalidResponse
}

public final class NetworkService {

    private let baseURL: URL
    private let client: AuthorizedNetworkClient

    public init(
        apiKey: String
    ) {
        self.baseURL = URL(string: "https://api.themoviedb.org/3/")!
        self.client = AuthorizedNetworkClient(apiKey: apiKey)
    }

    func request<T: Decodable>(
        endpoint: AppEndpoint,
        responseType: T.Type
    ) async throws -> T {

        let url = baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method

        let (data, response) = try await client.perform(request)

        guard let http = response as? HTTPURLResponse,
              200..<300 ~= http.statusCode else {
            throw APIError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
