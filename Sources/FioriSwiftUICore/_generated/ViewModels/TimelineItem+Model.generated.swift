// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct TimelineItem {
    let model: TimelineItemModel

    public init(model: TimelineItemModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.timestampStyle) internal var timestampStyle: TextStyle
    @Environment(\.timestampModifier) internal var timestampModifier: AnyViewModifier
    @Environment(\.statusStyle) internal var statusStyle: TextStyle
    @Environment(\.statusModifier) internal var statusModifier: AnyViewModifier
}

extension TimelineItem {
    private struct Model: TimelineItemModel {
        let title: String
        let timestamp: String?
        let status: String?
    }
    public init(title: String, timestamp: String? = nil, status: String? = nil) {
        self.model = Model(title: title, timestamp: timestamp, status: status)
    }
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


