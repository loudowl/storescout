import SwiftUI

struct WatchlistView: View {
    @StateObject private var viewModel = WatchlistViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.watchlistItems) { item in
                Text("App ID: \(item.appID.uuidString)")
            }
            .navigationTitle("Watchlist")
        }
    }
}
