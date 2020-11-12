// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ObjectHeader<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, Status: View, Substatus: View, DetailImage: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.substatusModifier) private var substatusModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
    @Environment(\.objectHeaderStyle) var style: AnyObjectHeaderStyle

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
        let configuration = ObjectHeaderStyleConfiguration(
            title: _title().modifier(Fiori.ObjectHeader.title.concat(titleModifier)).typeErased,
			subtitle: _subtitle().modifier(Fiori.ObjectHeader.subtitle.concat(subtitleModifier)).typeErased,
			footnote: _footnote().modifier(Fiori.ObjectHeader.footnote.concat(footnoteModifier)).typeErased,
			descriptionText: _descriptionText().modifier(Fiori.ObjectHeader.descriptionText.concat(descriptionTextModifier)).typeErased,
			status: _status().modifier(Fiori.ObjectHeader.status.concat(statusModifier)).typeErased,
			substatus: _substatus().modifier(Fiori.ObjectHeader.substatus.concat(substatusModifier)).typeErased,
			detailImage: _detailImage().modifier(Fiori.ObjectHeader.detailImage.concat(detailImageModifier)).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension ObjectHeader where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView>,
		Substatus == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView> {
    
    public init(model: ObjectHeaderModel) {
        self.init(title: model.title, subtitle: model.subtitle, footnote: model.footnote, descriptionText: model.descriptionText, status: model.status, substatus: model.substatus, detailImage: model.detailImage)
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, status: String? = nil, substatus: String? = nil, detailImage: Image? = nil) {
        self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._footnote = { footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._descriptionText = { descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._status = { status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._substatus = { substatus != nil ? ViewBuilder.buildEither(first: Text(substatus!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._detailImage = { detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - ObjectHeaderStyle Protocol
public protocol ObjectHeaderStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ObjectHeaderStyleConfiguration
}

public struct ObjectHeaderStyleConfiguration {
    let title: AnyView
	let subtitle: AnyView
	let footnote: AnyView
	let descriptionText: AnyView
	let status: AnyView
	let substatus: AnyView
	let detailImage: AnyView
}

// MARK: - ObjectHeaderStyle Environment Utility
extension View {
    public func objectHeaderStyle<S>(_ style: S) -> some View
        where S: ObjectHeaderStyle {
            self.environment(\.objectHeaderStyle, AnyObjectHeaderStyle(style))
        }
}

// MARK: - Type Erased ObjectHeaderStyle
public struct AnyObjectHeaderStyle: ObjectHeaderStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: ObjectHeaderStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension ObjectHeaderStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

// MARK: - ObjectHeaderStyle Environment Key
extension EnvironmentValues {
    var objectHeaderStyle: AnyObjectHeaderStyle {
        get { return self[ObjectHeaderStyleKey.self]  }
        set { self[ObjectHeaderStyleKey.self] = newValue }
    }
}

public struct ObjectHeaderStyleKey: EnvironmentKey {
    public static let defaultValue: AnyObjectHeaderStyle = AnyObjectHeaderStyle(FioriObjectHeaderStyle())
}
