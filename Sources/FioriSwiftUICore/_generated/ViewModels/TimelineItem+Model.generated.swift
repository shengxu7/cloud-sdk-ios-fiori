// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct TimelineItem {
    let model: TimelineItemModel

    public init(model: TimelineItemModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.timestampStyle) internal var timestampStyle: TextStyle
    @Environment(\.statusStyle) internal var statusStyle: TextStyle
}

// TODO: Extend TimelineItem to implement View in separate file
// place at FioriSwiftUICore/Views/TimelineItem+View.swift
/*
import SwiftUI

extension TimelineItem: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
