# StoreScout Architecture Document

## 1. Tech Stack

### Frontend
- **Framework**: SwiftUI (iOS 17+)
- **Language**: Swift 5.7+
- **Networking**: URLSession
- **HTML Parsing**: SwiftSoup

### Database
- **Local Storage**: CoreData for caching scraped data

### Hosting
- No backend hosting required, as all processing is on-device.

## 2. Project Structure

```
StoreScout/
├── StoreScoutApp.swift
├── Views/
│   ├── DiscoverView.swift
│   ├── WatchlistView.swift
│   ├── SettingsView.swift
│   ├── AppCardView.swift
│   ├── ProFeaturePaywallView.swift
├── Models/
│   ├── App.swift
│   ├── Store.swift
│   ├── WatchlistItem.swift
├── ViewModels/
│   ├── DiscoverViewModel.swift
│   ├── WatchlistViewModel.swift
│   ├── SettingsViewModel.swift
├── Services/
│   ├── AppScraperService.swift
│   ├── NotificationService.swift
│   ├── SubscriptionService.swift
├── Resources/
│   ├── Assets.xcassets
│   ├── Localizable.strings
├── Utilities/
│   ├── Constants.swift
│   ├── Extensions.swift
│   ├── CacheManager.swift
├── CoreData/
│   ├── StoreScout.xcdatamodeld
├── Info.plist
```

## 3. API Design

- **Internal Only**: On-device HTML parsing and no network API needed.
- **Scrape Function** (in AppScraperService):
  - Method: `func fetchNewApps() async throws -> [App]`
  - Operation: Parses HTML data from predefined app store URLs and returns an array of `App` objects.

## 4. Data Models

### CoreData Entities

#### App
- **id**: UUID
- **name**: String
- **iconURL**: URL
- **store**: String
- **price**: Double
- **deepLink**: URL
- **timestamp**: Date

#### WatchlistItem
- **id**: UUID
- **appID**: UUID
- **notifyPriceChange**: Bool
- **notifyVersionUpdate**: Bool

### Swift Models

#### App
```swift
struct App {
    let id: UUID
    let name: String
    let iconURL: URL
    let store: Store
    let price: Double
    let deepLink: URL
}
```

#### Store
```swift
enum Store {
    case aptoide, amazon, samsung
}
```

## 5. Authentication

- **No authentication needed**: No user accounts or external APIs requiring key-based access.

## 6. State Management

- **State Management**: 
  - SwiftUI's `@State`, `@Binding`, and `@EnvironmentObject` for maintaining UI states.
  - ViewModels using `ObservableObject` pattern for data-binding and business logic.

## 7. Key Dependencies

- **SwiftSoup**: HTML parsing.
- **CoreData**: Local data storage.
- **URLSession**: Networking.
- **UNUserNotification**: Local notifications.
- **StoreKit 2**: In-app purchases and subscriptions.

## 8. Deployment

- **Deployment Target**: iOS 17+
- **CI/CD Recommendations**:
  - **CI Tools**: GitHub Actions for automated testing and build.
  - **CD Tools**: Manual App Store deployment using Xcode or Fastlane for streamlined automation.

- **Steps**:
  1. **CI**: Automate testing through GitHub Actions, executing unit tests for ViewModels and Services.
  2. **CD**: Create workflows using Fastlane for automating the beta distribution via TestFlight and managing metadata for App Store releases.

The architecture capitalizes on SwiftUI and on-device processing to provide a seamless experience with minimal infrastructure. Focus on reducing costs by leveraging SwiftUI's declarative approach and Swift features for efficient and robust implementation.