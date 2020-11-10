import SwiftUI
/*
extension ProfileHeader2: View {
    public var body: some View {
        if horizontalSizeClass == .some(.compact) {
            VStack {
                if let image = model.detailImage {
                    image
                        .resizable().applying(detailImageStyle).modifier(detailImageModifier)
                        .frame(width: 128, height: 128)
                        
                }
                Text(model.title).applying(titleStyle).modifier(titleModifier)
                if let subtitle = model.subtitle, !subtitle.isEmpty {
                    Text(subtitle).applying(subtitleStyle).modifier(subtitleModifier)
                }
                if let footnote = model.footnote, !footnote.isEmpty {
                    Text(footnote).applying(footnoteStyle).modifier(footnoteModifier)
                }
                if let descriptionText = model.descriptionText, !descriptionText.isEmpty {
                    Text(descriptionText).applying(descriptionTextStyle).modifier(descriptionTextModifier)
                }
                HStack(spacing: 8) {
                    actionItems
                }
            }
            .multilineTextAlignment(.center)
        } else {
            HStack(spacing: 8) {
                if let image = model.detailImage {
                    image
                        .resizable()
                        .applying(detailImageStyle)
                        .modifier(detailImageModifier)
                        .frame(width: 65, height: 65)
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
                if let descriptionText = model.descriptionText, !descriptionText.isEmpty {
                    Text(descriptionText).applying(descriptionTextStyle).modifier(descriptionTextModifier)
                }
                Spacer()
                HStack(spacing: 8) {
                    actionItems
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
*/
