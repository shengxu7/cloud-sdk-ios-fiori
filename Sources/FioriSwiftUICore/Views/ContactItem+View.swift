import SwiftUI

extension ContactItem: View {
    public var body: some View {
        HStack(spacing: 8) {
            if let image = model.detailImage {
                image
                    .resizable()
                    .applying(detailImageStyle).modifier(detailImageModifier)
                    .frame(width: 45, height: 45)
                    
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
            actionItems
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

//extension ContactItem where ActionItems == EmptyView {
//    public init(model: ContactItemModel) {
//        self.init(model: model, actionItems: { EmptyView() })
//    }
//}

struct ContactItem_View_Previews: PreviewProvider {
    static var previews: some View {
        List(0..<3) {_ in
            ContactItem(model: LibraryPreviewData.Person.laurelosborn, actionItems: LibraryPreviewData.Person.laurelosborn.actionItems)
        }
        
    }
}

public struct AnyViewModifier: ViewModifier {
    var apply: (Content) -> AnyView
    var _concat: ((AnyViewModifier) -> AnyView)?
    
    public init<V: View>(transform: @escaping (Content) -> V) {
        self.apply = { AnyView(transform($0)) }
    }
    public func body(content: Content) -> AnyView {
        apply(content)
    }
}



struct MyTheme: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .background(Color.blue)
            .font(.custom("Avenir", size: 48))
            .titleModifier({
                $0.padding(50).border(Color.green, width: 5)
            })
    }
}
