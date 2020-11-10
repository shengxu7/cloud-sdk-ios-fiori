// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ObjectItem<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, Status: View, Substatus: View, DetailImage: View>: View {
    @Environment(\.titleModifier) private var titleModifier
    @Environment(\.subtitleModifier) private var subtitleModifier
    @Environment(\.footnoteModifier) private var footnoteModifier
    @Environment(\.descriptionTextModifier) private var descriptionTextModifier
    @Environment(\.statusModifier) private var statusModifier
    @Environment(\.substatusModifier) private var substatusModifier
    @Environment(\.detailImageModifier) private var detailImageModifier
    @Environment(\.objectItemStyle) var style: AnyObjectItemStyle

    private let _title: () -> Title
    private let _subtitle: () -> Subtitle
    private let _footnote: () -> Footnote
    private let _descriptionText: () -> DescriptionText
    private let _status: () -> Status
    private let _substatus: () -> Substatus
    private let _detailImage: () -> DetailImage

    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
            self._title = title
            self._subtitle = subtitle
            self._footnote = footnote
            self._descriptionText = descriptionText
            self._status = status
            self._substatus = substatus
            self._detailImage = detailImage
    }

    public var body: some View {
        let configuration = ObjectItemStyleConfiguration(
            title: _title().modifier(titleModifier).typeErased,
            subtitle: _subtitle().modifier(subtitleModifier).typeErased,
            footnote: _footnote().modifier(footnoteModifier).typeErased,
            descriptionText: _descriptionText().modifier(descriptionTextModifier).typeErased,
            status: _status().modifier(statusModifier).typeErased,
            substatus: _substatus().modifier(substatusModifier).typeErased,
            detailImage: _detailImage().modifier(detailImageModifier).typeErased
        )
        return style.makeBody(configuration: configuration)
    }
}

extension ObjectItem where Title == Text,
        Subtitle == _ConditionalContent<Text, EmptyView>,
        Footnote == _ConditionalContent<Text, EmptyView>,
        DescriptionText == _ConditionalContent<Text, EmptyView>,
        Status == _ConditionalContent<Text, EmptyView>,
        Substatus == _ConditionalContent<Text, EmptyView>,
        DetailImage == _ConditionalContent<Image, EmptyView> {
    
    public init(model: ObjectItemModel) {
        self.init(title: model.title, subtitle: model.subtitle, footnote: model.footnote, descriptionText: model.descriptionText, status: model.status, substatus: model.substatus, detailImage: model.detailImage)
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, status: String? = nil, substatus: String? = nil, detailImage: Image? = nil) {
        self._title = { Text(title) }
        self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
        self._footnote = { footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView()) }
        self._descriptionText = { descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView()) }
        self._status = { status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView()) }
        self._substatus = { substatus != nil ? ViewBuilder.buildEither(first: Text(substatus!)) : ViewBuilder.buildEither(second: EmptyView()) }
        self._detailImage = { detailImage != nil ? ViewBuilder.buildEither(first: detailImage!.resizable()) : ViewBuilder.buildEither(second: EmptyView()) }
    }
}

// MARK: - ObjectItemStyle Protocol
public protocol ObjectItemStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ObjectItemStyleConfiguration
}

public struct ObjectItemStyleConfiguration {
    let title: AnyView
    let subtitle: AnyView
    let footnote: AnyView
    let descriptionText: AnyView
    let status: AnyView
    let substatus: AnyView
    let detailImage: AnyView
}

// MARK: - ObjectItemStyle Environment Utility
extension View {
    public func objectItemStyle<S>(_ style: S) -> some View
        where S: ObjectItemStyle {
            self.environment(\.objectItemStyle, AnyObjectItemStyle(style))
        }
}

// MARK: - Type Erased ObjectItemStyle
public struct AnyObjectItemStyle: ObjectItemStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: ObjectItemStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension ObjectItemStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

public struct FioriObjectItemStyle: ObjectItemStyle {

    public func makeBody(configuration: Configuration) -> some View {
        ObjectItem  {
            configuration.title
        } subtitle: {
            configuration.subtitle
        } footnote: {
            configuration.footnote
        } descriptionText: {
            configuration.descriptionText
        } status: {
            configuration.status
        } substatus: {
            configuration.substatus
        } detailImage: {
            configuration.detailImage
        }
        .modifier(FioriObjectItemLayoutRouter())
    }
}

// MARK: - ObjectItemStyle Environment Key
extension EnvironmentValues {
    var objectItemStyle: AnyObjectItemStyle {
        get {
            return self[ObjectItemStyleKey.self]
        }
        set {
            self[ObjectItemStyleKey.self] = newValue
        }
    }
}

public struct ObjectItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyObjectItemStyle = AnyObjectItemStyle(FioriObjectItemStyle())
}

// TODO: Extend ObjectItem to implement LayoutRouter, Layout, and Style in separate file
// place at FioriSwiftUICore/Views/TimelineItem+View.swift
/*
import SwiftUI

extension ObjectItemLayoutRouter: ViewModifier {
    public var body: some View {
        <# View body #> 
    }
}
*/


// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

extension ObjectItem where DescriptionText == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder substatus: @escaping () -> Substatus,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: substatus,
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: status,
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder footnote: @escaping () -> Footnote
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: footnote,
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: { EmptyView() },
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText
        ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            footnote: { EmptyView() },
            descriptionText: descriptionText,
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}
