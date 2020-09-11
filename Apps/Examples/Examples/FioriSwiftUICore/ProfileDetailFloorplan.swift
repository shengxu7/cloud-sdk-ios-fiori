//
//  ProfileDetailFloorplan.swift
//  Examples
//
//  Created by Stan Stadelman on 9/8/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import FioriSwiftUICore

struct ProfileDetailFloorplan<Header: View, Content: View>: View {
    private let header: Header
    private let content: Content

    public init(@ViewBuilder header: @escaping () -> Header, @ViewBuilder content: @escaping () -> Content) {
        self.header = header()
        self.content = content()
    }
    
    public init(header: Header, content: Content) {
        self.header = header
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 22) {
            header
            content
        }
        .padding()
    }
    
}

struct ProfileDetailFloorplan_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailFloorplan(header: { EmptyView() }, content: { EmptyView() })
    }
}
