import SwiftUI
import CoreData

class DiscoverViewModel: ObservableObject {
    @Published var apps = [App]()
    
    func fetchNewApps() async {
        do {
            let fetchedApps = try await AppScraperService.fetchNewApps()
            DispatchQueue.main.async {
                self.apps = fetchedApps
            }
        } catch {
            print("Failed to fetch apps: \(error.localizedDescription)")
        }
    }
}
