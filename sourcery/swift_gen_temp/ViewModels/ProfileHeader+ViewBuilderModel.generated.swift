// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ProfileHeader<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, DetailImage: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
    @Environment(\.profileHeaderStyle) var style: AnyProfileHeaderStyle

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
        let configuration = ProfileHeaderStyleConfiguration(
            title: _title().modifier(titleModifier).typeErased,
			subtitle: _subtitle().modifier(subtitleModifier).typeErased,
			footnote: _footnote().modifier(footnoteModifier).typeErased,
			descriptionText: _descriptionText().modifier(descriptionTextModifier).typeErased,
			detailImage: _detailImage().modifier(detailImageModifier).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension ProfileHeader where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView> {
    
    public init(model: ProfileHeaderModel) {
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

// MARK: - ProfileHeaderStyle Protocol
public protocol ProfileHeaderStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ProfileHeaderStyleConfiguration
}

public struct ProfileHeaderStyleConfiguration {
    let title: AnyView
	let subtitle: AnyView
	let footnote: AnyView
	let descriptionText: AnyView
	let detailImage: AnyView
}

// MARK: - ProfileHeaderStyle Environment Utility
extension View {
    public func profileHeaderStyle<S>(_ style: S) -> some View
        where S: ProfileHeaderStyle {
            self.environment(\.profileHeaderStyle, AnyProfileHeaderStyle(style))
        }
}

// MARK: - Type Erased ProfileHeaderStyle
public struct AnyProfileHeaderStyle: ProfileHeaderStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: ProfileHeaderStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension ProfileHeaderStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

public struct FioriProfileHeaderStyle: ProfileHeaderStyle {

    public func makeBody(configuration: Configuration) -> some View {
        ProfileHeader  {
			configuration.title
		} subtitle: {
			configuration.subtitle
		} footnote: {
			configuration.footnote
		} descriptionText: {
			configuration.descriptionText
		} detailImage: {
			configuration.detailImage
		}
        .modifier(FioriProfileHeaderLayoutRouter())
    }
}

// MARK: - ProfileHeaderStyle Environment Key
extension EnvironmentValues {
    var profileHeaderStyle: AnyProfileHeaderStyle {
        get {
            return self[ProfileHeaderStyleKey.self]
        }
        set {
            self[ProfileHeaderStyleKey.self] = newValue
        }
    }
}

public struct ProfileHeaderStyleKey: EnvironmentKey {
    public static let defaultValue: AnyProfileHeaderStyle = AnyProfileHeaderStyle(FioriProfileHeaderStyle())
}

// TODO: Extend ProfileHeader to implement LayoutRouter, Layout, and Style in separate file
// place at FioriSwiftUICore/Views/TimelineItem+View.swift
/*
import SwiftUI

extension ProfileHeaderLayoutRouter: ViewModifier {
    public var body: some View { 
        <# View body #> 
    }
}
*/
