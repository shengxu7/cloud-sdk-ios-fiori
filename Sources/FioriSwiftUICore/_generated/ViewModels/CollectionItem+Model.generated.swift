// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct CollectionItem<ActionItems: View> {
    let model: CollectionItemModel
    let actionItems: ActionItems

    public init(model: CollectionItemModel, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self.model = model
        self.actionItems = actionItems()
    }
    public init(model: CollectionItemModel, actionItems: ActionItems) {
        self.model = model
        self.actionItems = actionItems
    }

    @Environment(\.detailImageStyle) internal var detailImageStyle: ImageStyle
    @Environment(\.detailImageModifier) internal var detailImageModifier: AnyViewModifier
    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.subtitleModifier) internal var subtitleModifier: AnyViewModifier
}

// TODO: Extend CollectionItem to implement View in separate file
// place at FioriSwiftUICore/Views/CollectionItem+View.swift
/*
import SwiftUI

extension CollectionItem: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
