import SwiftUI

extension TimelineItem: View {
    public var body: some View {
        VStack(spacing: 8) {
            Text(model.title)
            HStack {
                if let timestamp = model.timestamp {
                    Text(timestamp)
                }
                Spacer()
                if let status = model.status {
                    Text(status)
                }
            }
        }
    }
}
