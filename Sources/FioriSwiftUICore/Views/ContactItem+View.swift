import SwiftUI

extension ContactItem: View {
    public var body: some View {
        HStack {
            if let image = model.detailImage {
                image
                    .resizable()
                    .applying(detailImageStyle).modifier(detailImageModifier)
                    .frame(width: 45, height: 45)
                    .mask(Circle())
                    
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
            if horizontalSizeClass == .some(.regular),
               let descriptionText = model.descriptionText {
                Text(descriptionText).applying(descriptionTextStyle).modifier(descriptionTextModifier)
            }
            Spacer()
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
    let apply: (Content) -> AnyView
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
