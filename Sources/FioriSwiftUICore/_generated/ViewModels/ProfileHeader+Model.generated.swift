// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ProfileHeader<ActionItems: View> {
    let model: ProfileHeaderModel
    let actionItems: ActionItems

    public init(model: ProfileHeaderModel, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self.model = model
        self.actionItems = actionItems()
    }
    public init(model: ProfileHeaderModel, actionItems: ActionItems) {
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
    @Environment(\.horizontalSizeClass) internal var horizontalSizeClass
}

// TODO: Extend ProfileHeader to implement View in separate file
// place at FioriSwiftUICore/Views/ProfileHeader+View.swift
/*
import SwiftUI

extension ProfileHeader: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
