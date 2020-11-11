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
            detailImage: _detailImage().modifier(detailImageModifier).typeErased,
			title: _title().modifier(titleModifier).typeErased,
			subtitle: _subtitle().modifier(subtitleModifier).typeErased
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
        get {
            return self[CollectionItemStyleKey.self]
        }
        set {
            self[CollectionItemStyleKey.self] = newValue
        }
    }
}

public struct CollectionItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyCollectionItemStyle = AnyCollectionItemStyle(FioriCollectionItemStyle())
}

// TODO: - Extend CollectionItem to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/CollectionItem+StyleImpl.swift

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriCollectionItemStyle : CollectionItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.detailImage
			configuration.title
			configuration.subtitle
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/
/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriCollectionItemStyle: CollectionItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        CollectionItem  {
			configuration.detailImage
		} title: {
			configuration.title
		} subtitle: {
			configuration.subtitle
		}
        .modifier(FioriCollectionItemLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriCollectionItemLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.collectionItemStyle(FioriCollectionItemStyle.CompactLayout())
        } else {
            content.collectionItemStyle(FioriCollectionItemStyle.RegularLayout())
        }
    }
}

extension FioriCollectionItemStyle {
    public struct CompactLayout: CollectionItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.detailImage
			configuration.title
			configuration.subtitle
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: CollectionItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.detailImage
			configuration.title
			configuration.subtitle
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
public struct AcmeCollectionItemStyle: CollectionItemStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        CollectionItem  {
            VStack {
                configuration.detailImage
                AcmeDetailImageView()
            }
        } title: {
            VStack {
                configuration.title
                AcmeTitleView()
            }
        } subtitle: {
            VStack {
                configuration.subtitle
                AcmeSubtitleView()
            }
        }
        .modifier(FioriKeyValueItemSizeClassModifier())
    }
}
*/
