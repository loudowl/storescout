import Foundation

struct WatchlistItem: Identifiable {
    let id: UUID
    let appID: UUID
    let notifyPriceChange: Bool
    let notifyVersionUpdate: Bool
}
