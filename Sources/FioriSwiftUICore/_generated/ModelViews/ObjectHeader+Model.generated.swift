// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ObjectHeader {
    let model: ObjectHeaderModel

    public init(model: ObjectHeaderModel) {
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
