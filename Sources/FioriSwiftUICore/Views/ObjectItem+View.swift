import SwiftUI

extension ObjectItem: View {
    public var body: some View {
        VStack(alignment: .leading) {
            Text(model.title).applying(titleStyle)
            Text(model.subtitle!).applying(subtitleStyle)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding([.top, .bottom], 10)
    }
}
