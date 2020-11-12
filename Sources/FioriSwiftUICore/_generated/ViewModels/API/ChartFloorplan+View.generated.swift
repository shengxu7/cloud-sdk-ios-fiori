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
            title: _title().modifier(Fiori.ChartFloorplan.title.concat(titleModifier)).typeErased,
			subtitle: _subtitle().modifier(Fiori.ChartFloorplan.subtitle.concat(subtitleModifier)).typeErased,
			status: _status().modifier(Fiori.ChartFloorplan.status.concat(statusModifier)).typeErased,
			valueAxisTitle: _valueAxisTitle().modifier(Fiori.ChartFloorplan.valueAxisTitle.concat(valueAxisTitleModifier)).typeErased,
			seriesTitles: _seriesTitles().modifier(Fiori.ChartFloorplan.seriesTitles.concat(seriesTitlesModifier)).typeErased,
			categoryAxisTitle: _categoryAxisTitle().modifier(Fiori.ChartFloorplan.categoryAxisTitle.concat(categoryAxisTitleModifier)).typeErased
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
        get { return self[ChartFloorplanStyleKey.self]  }
        set { self[ChartFloorplanStyleKey.self] = newValue }
    }
}

public struct ChartFloorplanStyleKey: EnvironmentKey {
    public static let defaultValue: AnyChartFloorplanStyle = AnyChartFloorplanStyle(FioriChartFloorplanStyle())
}
