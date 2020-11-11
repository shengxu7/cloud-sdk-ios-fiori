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

// TODO: - Extend ObjectItem to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/ObjectItem+StyleImpl.swift

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriObjectItemStyle : ObjectItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.status
			configuration.substatus
			configuration.detailImage
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/
/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
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

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriObjectItemLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.objectItemStyle(FioriObjectItemStyle.CompactLayout())
        } else {
            content.objectItemStyle(FioriObjectItemStyle.RegularLayout())
        }
    }
}

extension FioriObjectItemStyle {
    public struct CompactLayout: ObjectItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.status
			configuration.substatus
			configuration.detailImage
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: ObjectItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.status
			configuration.substatus
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
public struct AcmeObjectItemStyle: ObjectItemStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        ObjectItem  {
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
        } status: {
            VStack {
                configuration.status
                AcmeStatusView()
            }
        } substatus: {
            VStack {
                configuration.substatus
                AcmeSubstatusView()
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
