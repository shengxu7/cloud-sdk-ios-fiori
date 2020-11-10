import SwiftUI

struct FioriObjectItemLayoutRouter: ViewModifier {
    func body(content: Content) -> some View {
        content
            .objectItemStyle(ObjectItemDefaultLayout())
    }
}

struct ObjectItemDefaultLayout: ObjectItemStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.detailImage
                .frame(width: 45, height: 45)
            VStack(alignment: .leading) {
                configuration.title
                configuration.subtitle
                configuration.footnote
            }
            Spacer()
            VStack(alignment: .trailing) {
                configuration.status
                configuration.substatus
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
/*
extension ObjectItem: View {
    public var body: some View {
        HStack {
            if let image = configuration.detailImage {
                image
                    .applying(detailImageStyle)
                    .frame(width: 45, height: 45)
                    .modifier(detailImageModifier)
                    
            }
            VStack(alignment: .leading) {
                Text(configuration.title).applying(titleStyle)
                if let subtitle = configuration.subtitle {
                    Text(subtitle).applying(subtitleStyle)
                }
                if let footnote = configuration.footnote {
                    Text(footnote).applying(footnoteStyle)
                }
            }
            Spacer()
            if horizontalSizeClass == .some(.regular),
               let descriptionText = configuration.descriptionText {
                Text(descriptionText).applying(descriptionTextStyle).modifier(descriptionTextModifier)
            }
            VStack(alignment: .trailing) {
                if let status = configuration.status {
                    Text(status).applying(statusStyle).modifier(statusModifier)
                }
                if let substatus = configuration.substatus {
                    Text(substatus).applying(substatusStyle).modifier(substatusModifier)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
*/
