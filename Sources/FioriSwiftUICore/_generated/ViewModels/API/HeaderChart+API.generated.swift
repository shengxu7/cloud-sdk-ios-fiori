// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct HeaderChart<Title: View, Subtitle: View, Trend: View, Kpi: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.trendModifier) private var trendModifier
	@Environment(\.kpiModifier) private var kpiModifier
    
    
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

    @ViewBuilder var title: some View {
		_title().modifier(Fiori.HeaderChart.title.concat(titleModifier))
	}
	@ViewBuilder var subtitle: some View {
		_subtitle().modifier(Fiori.HeaderChart.subtitle.concat(subtitleModifier))
	}
	@ViewBuilder var trend: some View {
		_trend().modifier(Fiori.HeaderChart.trend.concat(trendModifier))
	}
	@ViewBuilder var kpi: some View {
		_kpi().modifier(Fiori.HeaderChart.kpi.concat(kpiModifier))
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
