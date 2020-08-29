// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ProfileHeader {
    let model: ProfileHeaderModel

    public init(model: ProfileHeaderModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.footnoteStyle) internal var footnoteStyle: TextStyle
    @Environment(\.descriptionTextStyle) internal var descriptionTextStyle: TextStyle
    @Environment(\.detailImageStyle) internal var detailImageStyle: ImageStyle
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
