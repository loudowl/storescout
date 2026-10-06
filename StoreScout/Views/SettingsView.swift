import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Subscription")) {
                    Toggle("Scout Pro", isOn: $viewModel.isProUser)
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                }
                
                Section(header: Text("Filter")) {
                    Toggle("Show Free Apps Only", isOn: $viewModel.showFreeOnly)
                }
                
                Section {
                    Button("Clear Cache") {
                        viewModel.clearCache()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
}
