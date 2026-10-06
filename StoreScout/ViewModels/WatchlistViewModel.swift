import SwiftUI
import CoreData

class WatchlistViewModel: ObservableObject {
    @Published var watchlistItems = [WatchlistItem]()
    
    init() {
        loadWatchlist()
    }
    
    private func loadWatchlist() {
        // CoreData fetch request for WatchlistItems
    }
}
