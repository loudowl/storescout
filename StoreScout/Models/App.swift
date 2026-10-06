import Foundation

struct App: Identifiable {
    let id: UUID
    let name: String
    let iconURL: URL
    let store: Store
    let price: Double
    let deepLink: URL
}
