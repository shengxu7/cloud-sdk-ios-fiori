//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 9/19/20.
//

import SwiftUI

extension GridItem: View {
    public var body: some View {
        VStack {
            if let detailImage = model.detailImage {
                detailImage
                    .applying(detailImageStyle)
                    .frame(width: 60, height: 60)
                    .modifier(detailImageModifier)
                
            }
            Text(model.title).applying(titleStyle).modifier(titleModifier)
            if let subtitle = model.subtitle {
                Text(subtitle).applying(subtitleStyle).modifier(subtitleModifier)
            }
            actionItems
        }.padding()
    }
}

