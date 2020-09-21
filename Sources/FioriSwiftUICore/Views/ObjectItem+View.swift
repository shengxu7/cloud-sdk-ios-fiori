import SwiftUI

extension ObjectItem: View {
    public var body: some View {
        HStack(spacing: 8) {
            if let image = model.detailImage {
                image
                    .applying(detailImageStyle)
                    .frame(width: 45, height: 45)
                    .modifier(detailImageModifier)
                    
            }
            VStack(alignment: .leading) {
                Text(model.title).applying(titleStyle).modifier(titleModifier)
                if let subtitle = model.subtitle {
                    Text(subtitle).applying(subtitleStyle).modifier(subtitleModifier)
                }
                if let footnote = model.footnote {
                    Text(footnote).applying(footnoteStyle).modifier(footnoteModifier)
                }
            }
            Spacer()
            if horizontalSizeClass == .some(.regular),
               let descriptionText = model.descriptionText {
                Text(descriptionText).applying(descriptionTextStyle).modifier(descriptionTextModifier)
            }
            VStack(alignment: .trailing) {
                if let status = model.status {
                    Text(status).applying(statusStyle).modifier(statusModifier)
                }
                if let substatus = model.substatus {
                    Text(substatus).applying(substatusStyle).modifier(substatusModifier)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
