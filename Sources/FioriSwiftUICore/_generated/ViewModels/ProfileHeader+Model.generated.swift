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

extension ProfileHeader {
    private struct Model: ProfileHeaderModel {
        let title: String
        let subtitle: String?
        let footnote: String?
        let descriptionText: String?
        let detailImage: Image?
    }
    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self.model = Model(title: title, subtitle: subtitle, footnote: footnote, descriptionText: descriptionText, detailImage: detailImage)
        self.actionItems = actionItems()
    }
    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil, actionItems: ActionItems) {
        self.model = Model(title: title, subtitle: subtitle, footnote: footnote, descriptionText: descriptionText, detailImage: detailImage)
        self.actionItems = actionItems
    }
}
extension ProfileHeader where ActionItems == EmptyView {
    public init(model: ProfileHeaderModel) {
        self.init(model: model, actionItems: { EmptyView() })
    }
    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil) {
        self.init(title: title, subtitle: subtitle, footnote: footnote, descriptionText: descriptionText, detailImage: detailImage, actionItems: EmptyView())
    }
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
