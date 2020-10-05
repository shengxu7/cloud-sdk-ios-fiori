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
                if let subtitle = model.subtitle, !subtitle.isEmpty {
                    Text(subtitle).applying(subtitleStyle).modifier(subtitleModifier)
                }
                if let footnote = model.footnote, !footnote.isEmpty {
                    Text(footnote).applying(footnoteStyle).modifier(footnoteModifier)
                }
            }
            Spacer()
            if horizontalSizeClass == .some(.regular),
               let descriptionText = model.descriptionText, !descriptionText.isEmpty {
                Text(descriptionText).applying(descriptionTextStyle).modifier(descriptionTextModifier)
            }
            VStack(alignment: .trailing) {
                if let status = model.status, !status.isEmpty {
                    Text(status).applying(statusStyle).modifier(statusModifier)
                }
                if let substatus = model.substatus, !substatus.isEmpty {
                    Text(substatus).applying(substatusStyle).modifier(substatusModifier)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
