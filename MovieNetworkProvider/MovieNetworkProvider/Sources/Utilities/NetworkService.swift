import Foundation

public enum APIError: Error {
    case invalidResponse(underlyingResponse: URLResponse)
    case invalidURL(endpoint: AppEndpoint)
    case invalidStatusCode(httpStatusCode: Int)
}

public final class NetworkService {

    private let host: String
    private let scheme: String
    private let client: AuthorizedNetworkClient

    public init(
        apiKey: String
    ) {
        self.host = "api.themoviedb.org"
        self.scheme = "https"
        self.client = AuthorizedNetworkClient(apiKey: apiKey)
    }

    func request<T: Decodable>(
        endpoint: AppEndpoint,
        responseType: T.Type
    ) async throws -> T {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = endpoint.path
        if let queryItems = endpoint.queryItems, !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        guard let url = components.url else {
            throw APIError.invalidURL(endpoint: endpoint)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method

        let (data, response) = try await client.perform(request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse(underlyingResponse: response)
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw APIError.invalidStatusCode(httpStatusCode: httpResponse.statusCode)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
