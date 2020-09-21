// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct TimelineExtendedItem {
    let model: TimelineExtendedItemModel

    public init(model: TimelineExtendedItemModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.subtitleModifier) internal var subtitleModifier: AnyViewModifier
    @Environment(\.footnoteStyle) internal var footnoteStyle: TextStyle
    @Environment(\.footnoteModifier) internal var footnoteModifier: AnyViewModifier
    @Environment(\.attributeStyle) internal var attributeStyle: TextStyle
    @Environment(\.attributeModifier) internal var attributeModifier: AnyViewModifier
    @Environment(\.secondaryAttributeStyle) internal var secondaryAttributeStyle: TextStyle
    @Environment(\.secondaryAttributeModifier) internal var secondaryAttributeModifier: AnyViewModifier
    @Environment(\.timestampStyle) internal var timestampStyle: TextStyle
    @Environment(\.timestampModifier) internal var timestampModifier: AnyViewModifier
    @Environment(\.secondaryTimestampStyle) internal var secondaryTimestampStyle: TextStyle
    @Environment(\.secondaryTimestampModifier) internal var secondaryTimestampModifier: AnyViewModifier
    @Environment(\.statusStyle) internal var statusStyle: TextStyle
    @Environment(\.statusModifier) internal var statusModifier: AnyViewModifier
    @Environment(\.substatusStyle) internal var substatusStyle: TextStyle
    @Environment(\.substatusModifier) internal var substatusModifier: AnyViewModifier
}

extension TimelineExtendedItem {
    private struct Model: TimelineExtendedItemModel {
        let title: String
        let subtitle: String?
        let footnote: String?
        let attribute: String?
        let secondaryAttribute: String?
        let timestamp: String?
        let secondaryTimestamp: String?
        let status: String?
        let substatus: String?
    }
    public init(title: String, subtitle: String? = nil, footnote: String? = nil, attribute: String? = nil, secondaryAttribute: String? = nil, timestamp: String? = nil, secondaryTimestamp: String? = nil, status: String? = nil, substatus: String? = nil) {
        self.model = Model(title: title, subtitle: subtitle, footnote: footnote, attribute: attribute, secondaryAttribute: secondaryAttribute, timestamp: timestamp, secondaryTimestamp: secondaryTimestamp, status: status, substatus: substatus)
    }
}


// TODO: Extend TimelineExtendedItem to implement View in separate file
// place at FioriSwiftUICore/Views/TimelineExtendedItem+View.swift
/*
import SwiftUI

extension TimelineExtendedItem: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/