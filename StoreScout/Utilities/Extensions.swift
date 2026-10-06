import SwiftUI

extension Date {
    func isExpired(within interval: TimeInterval) -> Bool {
        return self.addingTimeInterval(interval) < Date()
    }
}
