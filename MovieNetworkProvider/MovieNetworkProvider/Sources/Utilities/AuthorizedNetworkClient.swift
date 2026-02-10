import Foundation

final class AuthorizedNetworkClient {

    private let session: NetworkSession
    private let apiKey: String

    init(
        apiKey: String,
        session: NetworkSession = URLSession.shared
    ) {
        self.apiKey = apiKey
        self.session = session
    }

    func perform(_ request: URLRequest) async throws -> (Data, URLResponse) {
        var authorizedRequest = request
        authorizedRequest.setValue(
            "Bearer \(apiKey)",
            forHTTPHeaderField: "Authorization"
        )

        return try await session.data(for: authorizedRequest)
    }
}
