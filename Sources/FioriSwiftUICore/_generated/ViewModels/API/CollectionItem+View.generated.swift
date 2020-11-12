// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct CollectionItem<DetailImage: View, Title: View, Subtitle: View>: View {
    @Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
    @Environment(\.collectionItemStyle) var style: AnyCollectionItemStyle

    private let _detailImage: () -> DetailImage
	private let _title: () -> Title
	private let _subtitle: () -> Subtitle

    public init(
        @ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
            self._detailImage = detailImage
			self._title = title
			self._subtitle = subtitle
    }

    public var body: some View {
        let configuration = CollectionItemStyleConfiguration(
            detailImage: _detailImage().modifier(Fiori.CollectionItem.detailImage.concat(detailImageModifier)).typeErased,
			title: _title().modifier(Fiori.CollectionItem.title.concat(titleModifier)).typeErased,
			subtitle: _subtitle().modifier(Fiori.CollectionItem.subtitle.concat(subtitleModifier)).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension CollectionItem where DetailImage == _ConditionalContent<Image, EmptyView>,
		Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView> {
    
    public init(model: CollectionItemModel) {
        self.init(detailImage: model.detailImage, title: model.title, subtitle: model.subtitle)
    }

    public init(detailImage: Image? = nil, title: String, subtitle: String? = nil) {
        self._detailImage = { detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView()) }
		self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - CollectionItemStyle Protocol
public protocol CollectionItemStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = CollectionItemStyleConfiguration
}

public struct CollectionItemStyleConfiguration {
    let detailImage: AnyView
	let title: AnyView
	let subtitle: AnyView
}

// MARK: - CollectionItemStyle Environment Utility
extension View {
    public func collectionItemStyle<S>(_ style: S) -> some View
        where S: CollectionItemStyle {
            self.environment(\.collectionItemStyle, AnyCollectionItemStyle(style))
        }
}

// MARK: - Type Erased CollectionItemStyle
public struct AnyCollectionItemStyle: CollectionItemStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: CollectionItemStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension CollectionItemStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

// MARK: - CollectionItemStyle Environment Key
extension EnvironmentValues {
    var collectionItemStyle: AnyCollectionItemStyle {
        get { return self[CollectionItemStyleKey.self]  }
        set { self[CollectionItemStyleKey.self] = newValue }
    }
}

public struct CollectionItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyCollectionItemStyle = AnyCollectionItemStyle(FioriCollectionItemStyle())
}
