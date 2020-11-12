import SwiftUI

extension Fiori {
    enum ProfileHeader {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Footnote = EmptyModifier
        typealias DescriptionText = EmptyModifier
        typealias DetailImage = EmptyModifier

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
        static let footnote = Footnote()
        static let descriptionText = DescriptionText()
        static let detailImage = DetailImage()
    }
}

/*
// MARK - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriProfileHeaderStyle : ProfileHeaderStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
            configuration.subtitle
            configuration.footnote
            configuration.descriptionText
            configuration.detailImage
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/

// MARK: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriProfileHeaderStyle: ProfileHeaderStyle {
    public func makeBody(configuration: Configuration) -> some View {
        ProfileHeader  {
            configuration.title
        } subtitle: {
            configuration.subtitle
        } footnote: {
            configuration.footnote
        } descriptionText: {
            configuration.descriptionText
        } detailImage: {
            configuration.detailImage
        }
        .modifier(FioriProfileHeaderLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriProfileHeaderLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.profileHeaderStyle(FioriProfileHeaderStyle.CompactLayout())
        } else {
            content.profileHeaderStyle(FioriProfileHeaderStyle.RegularLayout())
        }
    }
}

extension FioriProfileHeaderStyle {
    public struct CompactLayout: ProfileHeaderStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack(spacing: 8) {
                configuration.detailImage
                        .frame(width: 128, height: 128)
                VStack(spacing: 4) {
                    configuration.title
                    configuration.subtitle
                    configuration.footnote
                }
                configuration.descriptionText
//                HStack(spacing: 8) {
//                    actionItems
//                }
            }
            .multilineTextAlignment(.center)
        }
    }

    public struct RegularLayout: ProfileHeaderStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack(spacing: 8) {
                configuration.detailImage
                    .frame(width: 65, height: 65)
                VStack(alignment: .leading) {
                    configuration.title
                    configuration.subtitle
                    configuration.footnote
                }
                configuration.descriptionText
                Spacer()
//                HStack(spacing: 8) {
//                    actionItems
//                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
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
public struct AcmeProfileHeaderStyle: ProfileHeaderStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        ProfileHeader  {
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
