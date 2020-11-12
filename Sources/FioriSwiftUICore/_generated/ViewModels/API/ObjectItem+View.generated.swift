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
            title: _title().modifier(Fiori.ObjectItem.title.concat(titleModifier)).typeErased,
			subtitle: _subtitle().modifier(Fiori.ObjectItem.subtitle.concat(subtitleModifier)).typeErased,
			footnote: _footnote().modifier(Fiori.ObjectItem.footnote.concat(footnoteModifier)).typeErased,
			descriptionText: _descriptionText().modifier(Fiori.ObjectItem.descriptionText.concat(descriptionTextModifier)).typeErased,
			status: _status().modifier(Fiori.ObjectItem.status.concat(statusModifier)).typeErased,
			substatus: _substatus().modifier(Fiori.ObjectItem.substatus.concat(substatusModifier)).typeErased,
			detailImage: _detailImage().modifier(Fiori.ObjectItem.detailImage.concat(detailImageModifier)).typeErased
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
		self._detailImage = { detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView()) }
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

// MARK: - ObjectItemStyle Environment Key
extension EnvironmentValues {
    var objectItemStyle: AnyObjectItemStyle {
        get { return self[ObjectItemStyleKey.self]  }
        set { self[ObjectItemStyleKey.self] = newValue }
    }
}

public struct ObjectItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyObjectItemStyle = AnyObjectItemStyle(FioriObjectItemStyle())
}
