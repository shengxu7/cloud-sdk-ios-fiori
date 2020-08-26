import SwiftUI

extension ObjectItem: View {
    public var body: some View {
        VStack {
            Text(model.title).applying(titleStyle)
        }
    }
}
