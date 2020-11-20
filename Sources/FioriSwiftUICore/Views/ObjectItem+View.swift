import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum ObjectItem {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Footnote = EmptyModifier
        typealias DescriptionText = EmptyModifier
        typealias Status = EmptyModifier
        typealias Substatus = EmptyModifier
        typealias DetailImage = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
            // replace `typealias Subtitle = EmptyModifier` with:

            struct Subtitle: ViewModifier {
                func body(content: Content) -> some View {
                    content
                        .font(.body)
                        .foregroundColor(.preferredColor(.primary3))
                }
            }
        */
        static let title = Title()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let descriptionText = DescriptionText()
        static let status = Status()
        static let substatus = Substatus()
        static let detailImage = DetailImage()
    }
}

// TODO: - Implement ObjectItem View body

extension ObjectItem: View {
    public var body: some View {
        if horizontalSizeClass == .some(.compact) {
            HStack {
                detailImage
                    .frame(width: 45, height: 45)
                VStack(alignment: .leading) {
                    title
                    subtitle
                    footnote
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack(alignment: .trailing) {
                    status
                    substatus
                }
                .frame(maxWidth: 84, alignment: .trailing)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding([.top, .bottom], 8)
        } else {
            HStack {
                detailImage
                    .frame(width: 45, height: 45)
                VStack(alignment: .leading) {
                    title
                    subtitle
                    footnote
                }
                Spacer()
                descriptionText
                Spacer()
                VStack(alignment: .trailing) {
                    status
                    substatus
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding([.top, .bottom], 8)
        }
    }
}
