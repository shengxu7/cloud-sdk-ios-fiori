// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct HeaderChart<Title: View, Subtitle: View, Trend: View, Kpi: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.trendModifier) private var trendModifier
	@Environment(\.kpiModifier) private var kpiModifier
    @Environment(\.headerChartStyle) var style: AnyHeaderChartStyle

    private let _title: () -> Title
	private let _subtitle: () -> Subtitle
	private let _trend: () -> Trend
	private let _kpi: () -> Kpi

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi
        ) {
            self._title = title
			self._subtitle = subtitle
			self._trend = trend
			self._kpi = kpi
    }

    public var body: some View {
        let configuration = HeaderChartStyleConfiguration(
            title: _title().modifier(titleModifier).typeErased,
			subtitle: _subtitle().modifier(subtitleModifier).typeErased,
			trend: _trend().modifier(trendModifier).typeErased,
			kpi: _kpi().modifier(kpiModifier).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension HeaderChart where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Trend == _ConditionalContent<Text, EmptyView>,
		Kpi == _ConditionalContent<Text, EmptyView> {
    
    public init(model: HeaderChartModel) {
        self.init(title: model.title, subtitle: model.subtitle, trend: model.trend, kpi: model.kpi)
    }

    public init(title: String, subtitle: String? = nil, trend: String? = nil, kpi: String? = nil) {
        self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._trend = { trend != nil ? ViewBuilder.buildEither(first: Text(trend!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._kpi = { kpi != nil ? ViewBuilder.buildEither(first: Text(kpi!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - HeaderChartStyle Protocol
public protocol HeaderChartStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = HeaderChartStyleConfiguration
}

public struct HeaderChartStyleConfiguration {
    let title: AnyView
	let subtitle: AnyView
	let trend: AnyView
	let kpi: AnyView
}

// MARK: - HeaderChartStyle Environment Utility
extension View {
    public func headerChartStyle<S>(_ style: S) -> some View
        where S: HeaderChartStyle {
            self.environment(\.headerChartStyle, AnyHeaderChartStyle(style))
        }
}

// MARK: - Type Erased HeaderChartStyle
public struct AnyHeaderChartStyle: HeaderChartStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: HeaderChartStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension HeaderChartStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

// MARK: - HeaderChartStyle Environment Key
extension EnvironmentValues {
    var headerChartStyle: AnyHeaderChartStyle {
        get {
            return self[HeaderChartStyleKey.self]
        }
        set {
            self[HeaderChartStyleKey.self] = newValue
        }
    }
}

public struct HeaderChartStyleKey: EnvironmentKey {
    public static let defaultValue: AnyHeaderChartStyle = AnyHeaderChartStyle(FioriHeaderChartStyle())
}

// TODO: - Extend HeaderChart to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/HeaderChart+StyleImpl.swift

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriHeaderChartStyle : HeaderChartStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
			configuration.subtitle
			configuration.trend
			configuration.kpi
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/
/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriHeaderChartStyle: HeaderChartStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HeaderChart  {
			configuration.title
		} subtitle: {
			configuration.subtitle
		} trend: {
			configuration.trend
		} kpi: {
			configuration.kpi
		}
        .modifier(FioriHeaderChartLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriHeaderChartLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.headerChartStyle(FioriHeaderChartStyle.CompactLayout())
        } else {
            content.headerChartStyle(FioriHeaderChartStyle.RegularLayout())
        }
    }
}

extension FioriHeaderChartStyle {
    public struct CompactLayout: HeaderChartStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.title
			configuration.subtitle
			configuration.trend
			configuration.kpi
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: HeaderChartStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
			configuration.subtitle
			configuration.trend
			configuration.kpi
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
public struct AcmeHeaderChartStyle: HeaderChartStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        HeaderChart  {
            VStack {
                configuration.title
                AcmeTitleView()
            }
        } subtitle: {
            VStack {
                configuration.subtitle
                AcmeSubtitleView()
            }
        } trend: {
            VStack {
                configuration.trend
                AcmeTrendView()
            }
        } kpi: {
            VStack {
                configuration.kpi
                AcmeKpiView()
            }
        }
        .modifier(FioriKeyValueItemSizeClassModifier())
    }
}
*/
