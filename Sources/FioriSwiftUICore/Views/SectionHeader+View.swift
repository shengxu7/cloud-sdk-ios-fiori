//
//  SectionHeader+View.swift
//  
//
//  Created by Stadelman, Stan on 9/19/20.
//

import SwiftUI
import UIKit

extension SectionHeader: View {
    public var body: some View {
//        ZStack {
//            VisualEffectView(effect: UIBlurEffect(style: colorScheme == .some(.light) ? .extraLight : .dark))
//                            .edgesIgnoringSafeArea(.all)
            HStack {
                Text(model.title).applying(titleStyle).modifier(titleModifier)
                Spacer()
                HStack {
                    if let attribute = model.attribute {
                        Text(attribute)
                            .applying(attributeStyle)
                            .multilineTextAlignment(.trailing)
                            .modifier(attributeModifier)
                    }
                    action
                }
            }
            .padding()
//        }
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

public struct VisualEffectView: UIViewRepresentable {
    public var effect: UIVisualEffect?
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    public func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
