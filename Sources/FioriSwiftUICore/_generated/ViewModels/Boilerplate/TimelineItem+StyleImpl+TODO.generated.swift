// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// TODO: - Extend TimelineItem to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/StyleImplementations/TimelineItem+StyleImpl.swift

// TODO: - Uncomment and implement Fiori style definitions

/*
extension Fiori {
    enum TimelineItem {
        typealias Title = EmptyModifier
		typealias Timestamp = EmptyModifier
		typealias Status = EmptyModifier

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
		static let timestamp = Timestamp()
		static let status = Status()
    }
}
*/

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriTimelineItemStyle : TimelineItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
			configuration.timestamp
			configuration.status
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/
/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriTimelineItemStyle: TimelineItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        TimelineItem  {
			configuration.title
		} timestamp: {
			configuration.timestamp
		} status: {
			configuration.status
		}
        .modifier(FioriTimelineItemLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriTimelineItemLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.timelineItemStyle(FioriTimelineItemStyle.CompactLayout())
        } else {
            content.timelineItemStyle(FioriTimelineItemStyle.RegularLayout())
        }
    }
}

extension FioriTimelineItemStyle {
    public struct CompactLayout: TimelineItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.title
			configuration.timestamp
			configuration.status
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: TimelineItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
			configuration.timestamp
			configuration.status
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
public struct AcmeTimelineItemStyle: TimelineItemStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        TimelineItem  {
            VStack {
                configuration.title
                AcmeTitleView()
            }
        } timestamp: {
            VStack {
                configuration.timestamp
                AcmeTimestampView()
            }
        } status: {
            VStack {
                configuration.status
                AcmeStatusView()
            }
        }
        .modifier(FioriKeyValueItemSizeClassModifier())
    }
}
*/
