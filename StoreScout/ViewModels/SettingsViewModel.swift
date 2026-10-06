import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var isProUser: Bool = false
    @Published var showFreeOnly: Bool = false
    
    func clearCache() {
        CacheManager.shared.clearCache()
    }
}
