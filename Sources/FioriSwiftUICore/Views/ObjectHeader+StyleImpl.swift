import SwiftUI

// TODO - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriObjectHeaderStyle : ObjectHeaderStyle {
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

/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriObjectHeaderStyle: ObjectHeaderStyle {
    public func makeBody(configuration: Configuration) -> some View {
        ObjectHeader  {
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
        .modifier(FioriObjectHeaderLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriObjectHeaderLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.objectHeaderStyle(FioriObjectHeaderStyle.CompactLayout())
        } else {
            content.objectHeaderStyle(FioriObjectHeaderStyle.RegularLayout())
        }
    }
}

extension FioriObjectHeaderStyle {
    public struct CompactLayout: ObjectHeaderStyle {
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

    public struct RegularLayout: ObjectHeaderStyle {
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
public struct AcmeObjectHeaderStyle: ObjectHeaderStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        ObjectHeader  {
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
