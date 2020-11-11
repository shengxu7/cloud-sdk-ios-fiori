import SwiftUI

/*
// MARK - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

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

// MARK: - Uncomment if View has multiple layouts, depending upon context

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
struct FioriObjectItemLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    func body(content: Content) -> some View {
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
            HStack {
                configuration.detailImage
                    .frame(width: 45, height: 45)
                VStack(alignment: .leading) {
                    configuration.title
                    configuration.subtitle
                    configuration.footnote
                }
                Spacer()
                VStack(alignment: .trailing) {
                    configuration.status
                    configuration.substatus
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: ObjectItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.detailImage
                    .frame(width: 45, height: 45)
                VStack(alignment: .leading) {
                    configuration.title
                    configuration.subtitle
                    configuration.footnote
                }
                Spacer()
                configuration.descriptionText
                Spacer()
                VStack(alignment: .trailing) {
                    configuration.status
                    configuration.substatus
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }
}

/*
// MARK: - Creating Application-specific Style, while leveraging Fiori Layouts

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
