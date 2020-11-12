// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ContactItem<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, DetailImage: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
    @Environment(\.contactItemStyle) var style: AnyContactItemStyle

    private let _title: () -> Title
	private let _subtitle: () -> Subtitle
	private let _footnote: () -> Footnote
	private let _descriptionText: () -> DescriptionText
	private let _detailImage: () -> DetailImage

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
            self._title = title
			self._subtitle = subtitle
			self._footnote = footnote
			self._descriptionText = descriptionText
			self._detailImage = detailImage
    }

    public var body: some View {
        let configuration = ContactItemStyleConfiguration(
            title: _title().modifier(Fiori.ContactItem.title.concat(titleModifier)).typeErased,
			subtitle: _subtitle().modifier(Fiori.ContactItem.subtitle.concat(subtitleModifier)).typeErased,
			footnote: _footnote().modifier(Fiori.ContactItem.footnote.concat(footnoteModifier)).typeErased,
			descriptionText: _descriptionText().modifier(Fiori.ContactItem.descriptionText.concat(descriptionTextModifier)).typeErased,
			detailImage: _detailImage().modifier(Fiori.ContactItem.detailImage.concat(detailImageModifier)).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension ContactItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView> {
    
    public init(model: ContactItemModel) {
        self.init(title: model.title, subtitle: model.subtitle, footnote: model.footnote, descriptionText: model.descriptionText, detailImage: model.detailImage)
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil) {
        self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._footnote = { footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._descriptionText = { descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._detailImage = { detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - ContactItemStyle Protocol
public protocol ContactItemStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ContactItemStyleConfiguration
}

public struct ContactItemStyleConfiguration {
    let title: AnyView
	let subtitle: AnyView
	let footnote: AnyView
	let descriptionText: AnyView
	let detailImage: AnyView
}

// MARK: - ContactItemStyle Environment Utility
extension View {
    public func contactItemStyle<S>(_ style: S) -> some View
        where S: ContactItemStyle {
            self.environment(\.contactItemStyle, AnyContactItemStyle(style))
        }
}

// MARK: - Type Erased ContactItemStyle
public struct AnyContactItemStyle: ContactItemStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: ContactItemStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension ContactItemStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

// MARK: - ContactItemStyle Environment Key
extension EnvironmentValues {
    var contactItemStyle: AnyContactItemStyle {
        get { return self[ContactItemStyleKey.self]  }
        set { self[ContactItemStyleKey.self] = newValue }
    }
}

public struct ContactItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyContactItemStyle = AnyContactItemStyle(FioriContactItemStyle())
}
