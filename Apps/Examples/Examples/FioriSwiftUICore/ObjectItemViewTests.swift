//
//  ContactItemViewTests.swift
//  Examples
//
//  Created by Stan Stadelman on 8/25/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import Combine
import FioriSwiftUICore
import UIKit


struct AcmeStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .titleStyle(TextStyle().bold().font(.custom("Avenir", size: 21.0, relativeTo: .largeTitle)))
            .subtitleStyle(TextStyle(font: .custom("Avenir", size: 18.0, relativeTo: .largeTitle)))
            .footnoteStyle(TextStyle(font: .custom("Avenir", size: 14.0, relativeTo: .footnote)))
            .detailImageModifier({ $0.scaledToFill().mask(Circle()) })
            .accentColor(.green)
    }
}


struct AcmeTagSplitter: ViewModifier {
    let tags: [String]

    init(_ text: String?) {
        self.tags = text?.split(separator: ",").map { String($0) } ?? []
    }
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if tags.count > 0 {
            HStack {
                ForEach(0..<tags.count) { idx in
                    Text(tags[idx])
                        .padding([.top, .bottom], 3.0)
                        .padding([.leading, .trailing], 6.0)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
        } else {
            EmptyView()
        }
    }
}

struct ContactItemViewTests: View {
    
    @StateObject var styleCache = StyleCache.shared
    @ObservedObject var model = TripPin.PeopleModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(model.listResults) { person in
                    NavigationLink(destination: ProfileDetailFloorplan(header: {
                        ProfileHeader(model: person, actionItems: person.actionItems)
                            .footnoteModifier({
                                $0.modifier(AcmeTagSplitter(person.footnote))
                            })
                    }, content: {
                        Text("hello, world")
                    })) {
                        if person.UserName.contains("a") {
                            ContactItem(model: person, actionItems: person.actionItems)
                                .titleStyle(TextStyle().foregroundColor(.accentColor))
                        } else {
                            ContactItem(model: person)
                        }
                    }
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                    .footnoteModifier({
                        $0.modifier(AcmeTagSplitter(person.footnote))
                    })
                }
                .navigationTitle("Contacts")
            }
        }.detailImageModifier({$0.scaledToFill() })
    }
}


struct ContactItemViewTests_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemViewTests()
    }
}
