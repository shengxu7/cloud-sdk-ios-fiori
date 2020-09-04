// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ContactItem<ActionItems: View> {
    let model: ContactItemModel
    let actionItems: () -> ActionItems

    public init(model: ContactItemModel, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self.model = model
        self.actionItems = actionItems
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.footnoteStyle) internal var footnoteStyle: TextStyle
    @Environment(\.descriptionTextStyle) internal var descriptionTextStyle: TextStyle
    @Environment(\.detailImageStyle) internal var detailImageStyle: ImageStyle
}

extension ContactItem where ActionItems == EmptyView {
    public init(model: ContactItemModel) {
        self.init(model: model, actionItems: { EmptyView() })
    }
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
