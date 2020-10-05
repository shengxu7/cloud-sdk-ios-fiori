//
//  ContentView.swift
//  Examples
//
//  Created by Eidinger, Marco on 7/16/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import FioriSwiftUICore

struct ContentView: View {
    private let oneMany = ["table", "list", "timeline"]
    private let manyMany = ["LowCode", "object", "analytical"]
    private let cards: [String] = ["LowCode", "timeline", "table", "list" , "object", "analytical"]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                destination: ChartsContentView()) {
                    Text("Charts")
                }
                NavigationLink(
                destination:IntegrationCardsContentView(cards: cards)) {
                    Text("Integration Cards")
                }
                NavigationLink(
                destination: CoreContentView()) {
                    Text("Core Elements")
                }
                NavigationLink(
                destination: ContactItemViewTests()) {
                    Text("Generated Views")
                }
            }
            .navigationBarTitle("Examples")
            .listStyle(SidebarListStyle())
        }
        .modifier(AcmeStyle())
        .titleStyleClassPath(["h1"])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
