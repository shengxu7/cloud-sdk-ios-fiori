import SwiftUI

extension ProfileHeader: View {
    public var body: some View {
        if horizontalSizeClass == .some(.compact) {
            VStack {
                if let image = model.detailImage {
                    image
                        .resizable()
                        .applying(detailImageStyle)
                        .frame(width: 128, height: 128)
                        .mask(Circle())
                        
                }
                Text(model.title).applying(titleStyle)
                if let subtitle = model.subtitle {
                    Text(subtitle).applying(subtitleStyle)
                }
                HStack(spacing: 16) {
                    actionItems
                }
            }
        } else {
            HStack {
                if let image = model.detailImage {
                    image
                        .resizable()
                        .applying(detailImageStyle)
                        .frame(width: 65, height: 65)
                        .mask(Circle())
                        
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
                actionItems
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
