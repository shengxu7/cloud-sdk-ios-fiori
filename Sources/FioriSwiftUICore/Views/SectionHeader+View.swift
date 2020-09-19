//
//  SectionHeader+View.swift
//  
//
//  Created by Stadelman, Stan on 9/19/20.
//

import SwiftUI

extension SectionHeader: View {
    public var body: some View {
        HStack {
            Text(model.title).applying(titleStyle).modifier(titleModifier)
            if let attribute = model.attribute {
                Text(attribute)
                    .applying(attributeStyle)
                    .multilineTextAlignment(.trailing)
                    .modifier(attributeModifier)
            }
        }.padding()
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(model: SectionHeaderM())
    }
}

struct SectionHeaderM: SectionHeaderModel {
    let title: String = "Hello, world"
    let attribute: String? = "See all"
}
