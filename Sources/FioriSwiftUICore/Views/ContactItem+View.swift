import SwiftUI

extension ContactItem: View {
    public var body: some View {
        HStack {
            if let image = model.detailImage {
                image.applying(detailImageStyle)
                    .frame(width: 45, height: 45)
                    
            }
            VStack(alignment: .leading) {
                Text(model.title).applying(titleStyle)
                if let subtitle = model.subtitle {
                    Text(subtitle).applying(subtitleStyle)
                }
                if let footnote = model.footnote {
                    Text(footnote).applying(footnoteStyle)
                }
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
