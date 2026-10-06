import SwiftUI

struct DiscoverView: View {
    @StateObject private var viewModel = DiscoverViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.apps) { app in
                AppCardView(app: app)
            }
            .navigationTitle("Discover")
            .onAppear {
                Task {
                    await viewModel.fetchNewApps()
                }
            }
        }
    }
}
