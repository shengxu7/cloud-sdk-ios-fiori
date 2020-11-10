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

// TODO: Extend HeaderChart to implement LayoutRouter, Layout, and Style in separate file
// place at FioriSwiftUICore/Views/TimelineItem+View.swift
/*
import SwiftUI

extension HeaderChartLayoutRouter: ViewModifier {
    public var body: some View { 
        <# View body #> 
    }
}
*/
