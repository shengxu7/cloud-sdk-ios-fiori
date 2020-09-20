// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ObjectItem {
    let model: ObjectItemModel

    public init(model: ObjectItemModel) {
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

extension ObjectItem {
    private struct Model: ObjectItemModel {
        let title: String
        let subtitle: String?
        let footnote: String?
        let descriptionText: String?
        let status: String?
        let substatus: String?
        let detailImage: Image?
    }
    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, status: String? = nil, substatus: String? = nil, detailImage: Image? = nil) {
        self.model = Model(title: title, subtitle: subtitle, footnote: footnote, descriptionText: descriptionText, status: status, substatus: substatus, detailImage: detailImage)
    }
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
