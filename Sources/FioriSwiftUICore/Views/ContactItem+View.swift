import SwiftUI

extension ContactItem: View {
    public var body: some View {
        HStack {
            if let image = model.detailImage {
                image
                    .resizable()
                    .applying(detailImageStyle)
                    .frame(width: 45, height: 45)
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

extension ContactItem where ActionItems == EmptyView {
    public init(model: ContactItemModel) {
        self.init(model: model, actionItems: { EmptyView() })
    }
}

struct ContactItem_View_Previews: PreviewProvider {
    static var previews: some View {
        List(0..<3) {_ in
            ContactItem(model: LibraryPreviewData.Person.laurelosborn, actionItems: LibraryPreviewData.Person.laurelosborn.actionItems)
                .subtitleStyle(TextStyle())
        }
        
    }
}



