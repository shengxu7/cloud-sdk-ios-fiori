// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ObjectItem {
    let model: ObjectItemModel

    public init(model: ObjectItemModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.footnoteStyle) internal var footnoteStyle: TextStyle
    @Environment(\.descriptionTextStyle) internal var descriptionTextStyle: TextStyle
    @Environment(\.statusStyle) internal var statusStyle: TextStyle
    @Environment(\.substatusStyle) internal var substatusStyle: TextStyle
    @Environment(\.detailImageStyle) internal var detailImageStyle: ImageStyle
}

// TODO: Extend ObjectItem to implement View in separate file
// place at FioriSwiftUICore/Views/ObjectItem+View.swift
/*
import SwiftUI

extension ObjectItem: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
