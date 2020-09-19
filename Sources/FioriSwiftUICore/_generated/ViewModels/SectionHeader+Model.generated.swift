// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct SectionHeader {
    let model: SectionHeaderModel

    public init(model: SectionHeaderModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.attributeStyle) internal var attributeStyle: TextStyle
    @Environment(\.attributeModifier) internal var attributeModifier: AnyViewModifier
}

// TODO: Extend SectionHeader to implement View in separate file
// place at FioriSwiftUICore/Views/SectionHeader+View.swift
/*
import SwiftUI

extension SectionHeader: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
