//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 9/19/20.
//

import SwiftUI
/*
extension CollectionItem2: View {
    public var body: some View {
        VStack {
            if let detailImage = model.detailImage {
                detailImage
                    .applying(detailImageStyle)
                    .frame(width: 60, height: 60)
                    .modifier(detailImageModifier)
                
            }
            Text(model.title).applying(titleStyle).modifier(titleModifier)
            if let subtitle = model.subtitle, !subtitle.isEmpty {
                Text(subtitle).applying(subtitleStyle).modifier(subtitleModifier)
            }
            actionItems
        }.padding()
    }
}
*/
//extension CollectionItem {
//    struct Model: CollectionItemModel {
//        let detailImage: Image?
//        let title: String
//        let subtitle: String?
//    }
//    
//    public init(detailImage: Image? = nil, title: String, subtitle: String? = nil, actionItems: @escaping () -> ActionItems) {
//        self.model = Model(detailImage: detailImage, title: title, subtitle: subtitle)
//        self.actionItems = actionItems()
//    }
//    
//    public init(detailImage: Image? = nil, title: String, subtitle: String? = nil, actionItems: ActionItems) {
//        self.model = Model(detailImage: detailImage, title: title, subtitle: subtitle)
//        self.actionItems = actionItems
//    }
//}
//
//extension CollectionItem where ActionItems == EmptyView {
//    public init(model: CollectionItemModel) {
//        self.init(model: model, actionItems: { EmptyView() })
//    }
//    
//    public init(detailImage: Image? = nil, title: String, subtitle: String? = nil) {
//        self.init(detailImage: detailImage, title: title, subtitle: subtitle, actionItems: EmptyView())
//    }
//}

