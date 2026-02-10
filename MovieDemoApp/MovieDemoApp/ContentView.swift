import SwiftUI
import MovieNetworkProvider

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(firstValue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
