// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct GridItem<ActionItems: View> {
    let model: GridItemModel
    let actionItems: ActionItems

    public init(model: GridItemModel, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self.model = model
        self.actionItems = actionItems()
    }
    public init(model: GridItemModel, actionItems: ActionItems) {
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

// TODO: Extend GridItem to implement View in separate file
// place at FioriSwiftUICore/Views/GridItem+View.swift
/*
import SwiftUI

extension GridItem: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
