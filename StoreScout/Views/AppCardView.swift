import SwiftUI

struct AppCardView: View {
    let app: App
    
    var body: some View {
        HStack {
            AsyncImage(url: app.iconURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(app.name)
                    .font(.headline)
                
                Text(app.store.rawValue.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(storeColor(for: app.store))
                
                Text("$\(app.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Link(destination: app.deepLink) {
                Text("Install")
                    .foregroundColor(.blue)
            }
        }
    }
    
    private func storeColor(for store: Store) -> Color {
        switch store {
        case .aptoide:
            return .orange
        case .amazon:
            return .green
        case .samsung:
            return .purple
        }
    }
}
