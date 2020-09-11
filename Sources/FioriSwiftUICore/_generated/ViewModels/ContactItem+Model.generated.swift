// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ContactItem<ActionItems: View> {
    let model: ContactItemModel
    let actionItems: ActionItems

    public init(model: ContactItemModel, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self.model = model
        self.actionItems = actionItems()
    }
    public init(model: ContactItemModel, actionItems: ActionItems) {
        self.model = model
        self.actionItems = actionItems
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.subtitleModifier) internal var subtitleModifier: AnyViewModifier
    @Environment(\.footnoteStyle) internal var footnoteStyle: TextStyle
    @Environment(\.footnoteModifier) internal var footnoteModifier: AnyViewModifier
    @Environment(\.descriptionTextStyle) internal var descriptionTextStyle: TextStyle
    @Environment(\.descriptionTextModifier) internal var descriptionTextModifier: AnyViewModifier
    @Environment(\.detailImageStyle) internal var detailImageStyle: ImageStyle
    @Environment(\.detailImageModifier) internal var detailImageModifier: AnyViewModifier
}

// TODO: Extend ContactItem to implement View in separate file
// place at FioriSwiftUICore/Views/ContactItem+View.swift
/*
import SwiftUI

extension ContactItem: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
