import SwiftUI

extension Fiori {
    enum HeaderChart {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Trend = EmptyModifier
        typealias Kpi = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
            // replace `typealias Subtitle = EmptyModifier` with:

            struct Subtitle: ViewModifier {
                func body(content: Content) -> some View {
                    content
                        .font(.body)
                        .foregroundColor(.preferredColor(.primary3))
                }
            }
        */
        static let title = Title()
        static let subtitle = Subtitle()
        static let trend = Trend()
        static let kpi = Kpi()
    }
}

// MARK - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

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

/*
// MARK: - Uncomment if View has multiple layouts, depending upon context

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
struct FioriHeaderChartLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.headerChart(FioriHeaderChartStyle.CompactLayout())
        } else {
            content.headerChart(FioriHeaderChartStyle.RegularLayout())
        }
    }
}

extension struct FioriHeaderChartStyle {
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
// MARK: - Creating Application-specific Style, while leveraging Fiori Layouts

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
