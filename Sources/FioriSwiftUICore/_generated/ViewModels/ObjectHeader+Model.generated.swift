// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ObjectHeader {
    let model: ObjectHeaderModel

    public init(model: ObjectHeaderModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.subtitleModifier) internal var subtitleModifier: AnyViewModifier
    @Environment(\.footnoteStyle) internal var footnoteStyle: TextStyle
    @Environment(\.footnoteModifier) internal var footnoteModifier: AnyViewModifier
    @Environment(\.descriptionTextStyle) internal var descriptionTextStyle: TextStyle
    @Environment(\.descriptionTextModifier) internal var descriptionTextModifier: AnyViewModifier
    @Environment(\.statusStyle) internal var statusStyle: TextStyle
    @Environment(\.statusModifier) internal var statusModifier: AnyViewModifier
    @Environment(\.substatusStyle) internal var substatusStyle: TextStyle
    @Environment(\.substatusModifier) internal var substatusModifier: AnyViewModifier
    @Environment(\.detailImageStyle) internal var detailImageStyle: ImageStyle
    @Environment(\.detailImageModifier) internal var detailImageModifier: AnyViewModifier
}

// TODO: Extend ObjectHeader to implement View in separate file
// place at FioriSwiftUICore/Views/ObjectHeader+View.swift
/*
import SwiftUI

extension ObjectHeader: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
