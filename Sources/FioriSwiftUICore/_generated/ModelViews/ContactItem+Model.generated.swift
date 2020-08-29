// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ContactItem {
    let model: ContactItemModel

    public init(model: ContactItemModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.footnoteStyle) internal var footnoteStyle: TextStyle
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
