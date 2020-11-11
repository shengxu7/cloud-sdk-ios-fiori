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
            title: _title().modifier(titleModifier).typeErased,
			subtitle: _subtitle().modifier(subtitleModifier).typeErased,
			footnote: _footnote().modifier(footnoteModifier).typeErased,
			descriptionText: _descriptionText().modifier(descriptionTextModifier).typeErased,
			detailImage: _detailImage().modifier(detailImageModifier).typeErased
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
        get {
            return self[ContactItemStyleKey.self]
        }
        set {
            self[ContactItemStyleKey.self] = newValue
        }
    }
}

public struct ContactItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyContactItemStyle = AnyContactItemStyle(FioriContactItemStyle())
}

// TODO: - Extend ContactItem to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/ContactItem+StyleImpl.swift

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriContactItemStyle : ContactItemStyle {
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
public struct FioriContactItemStyle: ContactItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        ContactItem  {
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
        .modifier(FioriContactItemLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriContactItemLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.contactItemStyle(FioriContactItemStyle.CompactLayout())
        } else {
            content.contactItemStyle(FioriContactItemStyle.RegularLayout())
        }
    }
}

extension FioriContactItemStyle {
    public struct CompactLayout: ContactItemStyle {
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

    public struct RegularLayout: ContactItemStyle {
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
public struct AcmeContactItemStyle: ContactItemStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        ContactItem  {
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
