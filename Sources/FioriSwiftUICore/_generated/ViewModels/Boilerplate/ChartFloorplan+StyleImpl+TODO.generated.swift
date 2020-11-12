// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// TODO: - Extend ChartFloorplan to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/StyleImplementations/ChartFloorplan+StyleImpl.swift

// TODO: - Uncomment and implement Fiori style definitions

/*
extension Fiori {
    enum ChartFloorplan {
        typealias Title = EmptyModifier
		typealias Subtitle = EmptyModifier
		typealias Status = EmptyModifier
		typealias ValueAxisTitle = EmptyModifier
		typealias SeriesTitles = EmptyModifier
		typealias CategoryAxisTitle = EmptyModifier

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
		static let status = Status()
		static let valueAxisTitle = ValueAxisTitle()
		static let seriesTitles = SeriesTitles()
		static let categoryAxisTitle = CategoryAxisTitle()
    }
}
*/

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
