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
import Floorplan

struct ContactItemViewTests: View {
    
    @ObservedObject var model = TripPin.PeopleModel()
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(model.listResults) { person in
                        
                        NavigationLink(destination: ProfileDetailFloorplan(header: {
                            ProfileHeader(model: person, actionItems: { EmptyView() })
                        }, content: {
                            Text("hello, world")
                        })) {
                            if person.UserName.contains("a") {
                                ContactItem(model: person, actionItems: {
                                    Button {
                                        print("Calling person: \(person.UserName)")
                                    } label: {
                                        Image(systemName: "phone")
                                    }
                                    Button {
                                        print("Mailing person: \(person.UserName)")
                                    } label: {
                                        Image(systemName: "mail")
                                    }
                                })
                                .titleStyle(TextStyle().foregroundColor(.accentColor))
                            } else {
                                ContactItem(model: person)
                            }
                        }
                    }
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                }
                .navigationTitle("Contacts")
            }
            .titleStyle(TextStyle().font(.headline))
            .subtitleStyle(TextStyle().italic())
            .detailImageStyle(ImageStyle().resizable().cornerRadius(8))
        }
}




struct ContactItemViewTests_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemViewTests()
    }
}

