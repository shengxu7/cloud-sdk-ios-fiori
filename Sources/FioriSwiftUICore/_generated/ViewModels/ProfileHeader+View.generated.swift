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

// TODO: - Extend ProfileHeader to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/ProfileHeader+StyleImpl.swift

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriProfileHeaderStyle : ProfileHeaderStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.detailImage
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/
/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
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

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriProfileHeaderLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.profileHeaderStyle(FioriProfileHeaderStyle.CompactLayout())
        } else {
            content.profileHeaderStyle(FioriProfileHeaderStyle.RegularLayout())
        }
    }
}

extension FioriProfileHeaderStyle {
    public struct CompactLayout: ProfileHeaderStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.detailImage
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: ProfileHeaderStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.detailImage
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }
}
*/
/*
// TODO: - Creating Application-specific Style, while leveraging Fiori Layouts

/// Example Custom Style implementation, using pass-through technique from above.  
/// Developer may pass the `AnyView` from the `Configuration` directly through, 
/// contain it in a super-structure, or replace it entirely.
/// Invoking the `*LayoutRouter` `ViewModifier` causes the standard body implementation
/// to attempt to layout the supplied view.
public struct AcmeProfileHeaderStyle: ProfileHeaderStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        ProfileHeader  {
            VStack {
                configuration.title
                AcmeTitleView()
            }
        } subtitle: {
            VStack {
                configuration.subtitle
                AcmeSubtitleView()
            }
        } footnote: {
            VStack {
                configuration.footnote
                AcmeFootnoteView()
            }
        } descriptionText: {
            VStack {
                configuration.descriptionText
                AcmeDescriptionTextView()
            }
        } detailImage: {
            VStack {
                configuration.detailImage
                AcmeDetailImageView()
            }
        }
        .modifier(FioriKeyValueItemSizeClassModifier())
    }
}
*/
