import SwiftUI
import MovieNetworkProvider

struct ContentView: View {

    let networkManager: MovieNetworkManagerProtocol

    init() {
        let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYzc2YmQxZDEyM2E5NTdlZjFhZDUwMTc0M2RkMDFlYiIsIm5iZiI6MTY1NTI4MDM5NC4zOTkwMDAyLCJzdWIiOiI2MmE5OTMwYTIyYWYzZTUyMTQxZGU1MTEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.CrgZg7vC9jfoSDBT6oJYDjX5iDnzi4tKAqbRxnNoPzk"
        let networkService = NetworkService(apiKey: apiKey)
        networkManager = MovieNetworkManager(networkService: networkService)
    }

    @State private var movies = [MovieModel]()

    var body: some View {
        List(movies) { movie in
            Text(movie.title)
        }
        .task {
            do {
                movies = try await networkManager.fetchTrending(type: .day, language: .polish, page: 1).results
            } catch {
                print("DEBUG: ERROR \(error)")
            }
        }
    }

}

#Preview {
    ContentView()
}
