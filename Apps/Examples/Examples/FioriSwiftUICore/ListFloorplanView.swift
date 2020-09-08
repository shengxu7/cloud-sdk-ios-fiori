//
//  ListFloorplanView.swift
//  Examples
//
//  Created by Stan Stadelman on 9/4/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import Floorplan

struct ListFloorplanView: View {
    
//    @ObservedObject private var viewModel: ListViewModel<TripPin.Person, TripPin.Person.Section>
    
    
    init() {
//        viewModel = ListViewModel(queries: [.default: AnyIDataLoader(TripPin.IPeopleLoader())], isPagingEnabled: false, isSearchEnabled: true, isFilterEnabled: false)
    }
    
    var body: some View {
        EmptyView()
        /*
        ForEach(Array(viewModel.queries.keys), id:\.self) { key in
            Section(header: Text("People")) {
                ForEach(viewModel.queries[key]!.listResults) { entity in
                    ContactItem(model: entity)
                }
            }
        }*/
    }
}

struct ListFloorplanView_Previews: PreviewProvider {
    static var previews: some View {
        ListFloorplanView()
    }
}
