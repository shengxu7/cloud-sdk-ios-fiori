// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ChartFloorplan<Title: View, Subtitle: View, Status: View, ValueAxisTitle: View, SeriesTitles: View, CategoryAxisTitle: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.valueAxisTitleModifier) private var valueAxisTitleModifier
	@Environment(\.seriesTitlesModifier) private var seriesTitlesModifier
	@Environment(\.categoryAxisTitleModifier) private var categoryAxisTitleModifier
    @Environment(\.chartFloorplanStyle) var style: AnyChartFloorplanStyle

    private let _title: () -> Title
	private let _subtitle: () -> Subtitle
	private let _status: () -> Status
	private let _valueAxisTitle: () -> ValueAxisTitle
	private let _seriesTitles: () -> SeriesTitles
	private let _categoryAxisTitle: () -> CategoryAxisTitle

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
            self._title = title
			self._subtitle = subtitle
			self._status = status
			self._valueAxisTitle = valueAxisTitle
			self._seriesTitles = seriesTitles
			self._categoryAxisTitle = categoryAxisTitle
    }

    public var body: some View {
        let configuration = ChartFloorplanStyleConfiguration(
            title: _title().modifier(titleModifier).typeErased,
			subtitle: _subtitle().modifier(subtitleModifier).typeErased,
			status: _status().modifier(statusModifier).typeErased,
			valueAxisTitle: _valueAxisTitle().modifier(valueAxisTitleModifier).typeErased,
			seriesTitles: _seriesTitles().modifier(seriesTitlesModifier).typeErased,
			categoryAxisTitle: _categoryAxisTitle().modifier(categoryAxisTitleModifier).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension ChartFloorplan where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView>,
		ValueAxisTitle == _ConditionalContent<Text, EmptyView>,
		SeriesTitles == Text,
		CategoryAxisTitle == _ConditionalContent<Text, EmptyView> {
    
    public init(model: ChartFloorplanModel) {
        self.init(title: model.title, subtitle: model.subtitle, status: model.status, valueAxisTitle: model.valueAxisTitle, seriesTitles: model.seriesTitles, categoryAxisTitle: model.categoryAxisTitle)
    }

    public init(title: String, subtitle: String? = nil, status: String? = nil, valueAxisTitle: String? = nil, seriesTitles: [String] = [], categoryAxisTitle: String? = nil) {
        self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._status = { status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._valueAxisTitle = { valueAxisTitle != nil ? ViewBuilder.buildEither(first: Text(valueAxisTitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._seriesTitles = { Text(seriesTitles.joined(separator: ", ")) }
		self._categoryAxisTitle = { categoryAxisTitle != nil ? ViewBuilder.buildEither(first: Text(categoryAxisTitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - ChartFloorplanStyle Protocol
public protocol ChartFloorplanStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ChartFloorplanStyleConfiguration
}

public struct ChartFloorplanStyleConfiguration {
    let title: AnyView
	let subtitle: AnyView
	let status: AnyView
	let valueAxisTitle: AnyView
	let seriesTitles: AnyView
	let categoryAxisTitle: AnyView
}

// MARK: - ChartFloorplanStyle Environment Utility
extension View {
    public func chartFloorplanStyle<S>(_ style: S) -> some View
        where S: ChartFloorplanStyle {
            self.environment(\.chartFloorplanStyle, AnyChartFloorplanStyle(style))
        }
}

// MARK: - Type Erased ChartFloorplanStyle
public struct AnyChartFloorplanStyle: ChartFloorplanStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: ChartFloorplanStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension ChartFloorplanStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

// MARK: - ChartFloorplanStyle Environment Key
extension EnvironmentValues {
    var chartFloorplanStyle: AnyChartFloorplanStyle {
        get {
            return self[ChartFloorplanStyleKey.self]
        }
        set {
            self[ChartFloorplanStyleKey.self] = newValue
        }
    }
}

public struct ChartFloorplanStyleKey: EnvironmentKey {
    public static let defaultValue: AnyChartFloorplanStyle = AnyChartFloorplanStyle(FioriChartFloorplanStyle())
}

// TODO: - Extend ChartFloorplan to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/ChartFloorplan+StyleImpl.swift

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriChartFloorplanStyle : ChartFloorplanStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
			configuration.subtitle
			configuration.status
			configuration.valueAxisTitle
			configuration.seriesTitles
			configuration.categoryAxisTitle
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/
/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriChartFloorplanStyle: ChartFloorplanStyle {
    public func makeBody(configuration: Configuration) -> some View {
        ChartFloorplan  {
			configuration.title
		} subtitle: {
			configuration.subtitle
		} status: {
			configuration.status
		} valueAxisTitle: {
			configuration.valueAxisTitle
		} seriesTitles: {
			configuration.seriesTitles
		} categoryAxisTitle: {
			configuration.categoryAxisTitle
		}
        .modifier(FioriChartFloorplanLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriChartFloorplanLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.chartFloorplanStyle(FioriChartFloorplanStyle.CompactLayout())
        } else {
            content.chartFloorplanStyle(FioriChartFloorplanStyle.RegularLayout())
        }
    }
}

extension FioriChartFloorplanStyle {
    public struct CompactLayout: ChartFloorplanStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.title
			configuration.subtitle
			configuration.status
			configuration.valueAxisTitle
			configuration.seriesTitles
			configuration.categoryAxisTitle
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: ChartFloorplanStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
			configuration.subtitle
			configuration.status
			configuration.valueAxisTitle
			configuration.seriesTitles
			configuration.categoryAxisTitle
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
public struct AcmeChartFloorplanStyle: ChartFloorplanStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        ChartFloorplan  {
            VStack {
                configuration.title
                AcmeTitleView()
            }
        } subtitle: {
            VStack {
                configuration.subtitle
                AcmeSubtitleView()
            }
        } status: {
            VStack {
                configuration.status
                AcmeStatusView()
            }
        } valueAxisTitle: {
            VStack {
                configuration.valueAxisTitle
                AcmeValueAxisTitleView()
            }
        } seriesTitles: {
            VStack {
                configuration.seriesTitles
                AcmeSeriesTitlesView()
            }
        } categoryAxisTitle: {
            VStack {
                configuration.categoryAxisTitle
                AcmeCategoryAxisTitleView()
            }
        }
        .modifier(FioriKeyValueItemSizeClassModifier())
    }
}
*/
