// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct SectionHeader<Action: View> {
    let model: SectionHeaderModel
    let action: Action

    public init(model: SectionHeaderModel, @ViewBuilder action: @escaping () -> Action) {
        self.model = model
        self.action = action()
    }
    public init(model: SectionHeaderModel, action: Action) {
        self.model = model
        self.action = action
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.attributeStyle) internal var attributeStyle: TextStyle
    @Environment(\.attributeModifier) internal var attributeModifier: AnyViewModifier
    @Environment(\.colorScheme) internal var colorScheme
}

extension SectionHeader {
    private struct Model: SectionHeaderModel {
        let title: String
        let attribute: String?
    }
    public init(title: String, attribute: String? = nil, @ViewBuilder action: @escaping () -> Action) {
        self.model = Model(title: title, attribute: attribute)
        self.action = action()
    }
    public init(title: String, attribute: String? = nil, action: Action) {
        self.model = Model(title: title, attribute: attribute)
        self.action = action
    }
}
extension SectionHeader where Action == EmptyView {
    public init(model: SectionHeaderModel) {
        self.init(model: model, action: { EmptyView() })
    }
    public init(title: String, attribute: String? = nil) {
        self.init(title: title, attribute: attribute, action: EmptyView())
    }
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
