//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 9/19/20.
//

import SwiftUI

extension Fiori {
    enum CollectionItem {
        typealias DetailImage = EmptyModifier
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier

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
        static let detailImage = DetailImage()
        static let title = Title()
        static let subtitle = Subtitle()
    }
}

// MARK - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriCollectionItemStyle : CollectionItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.detailImage.frame(width: 60, height: 60)
            configuration.title
            configuration.subtitle
        }
        .padding()
    }
}

/*
// MARK: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriCollectionItemStyle: CollectionItemStyle {
    public func makeBody(configuration: Configuration) -> some View {
        CollectionItem  {
            configuration.detailImage
        } title: {
            configuration.title
        } subtitle: {
            configuration.subtitle
        }
        .modifier(FioriCollectionItemLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
struct FioriCollectionItemLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.collectionItem(FioriCollectionItemStyle.CompactLayout())
        } else {
            content.collectionItem(FioriCollectionItemStyle.RegularLayout())
        }
    }
}

extension struct FioriCollectionItemStyle {
    public struct CompactLayout: CollectionItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.detailImage
            configuration.title
            configuration.subtitle
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: CollectionItemStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.detailImage
            configuration.title
            configuration.subtitle
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
public struct AcmeCollectionItemStyle: CollectionItemStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        CollectionItem  {
            VStack {
                configuration.detailImage
                AcmeDetailImageView()
            }
        } title: {
            VStack {
                configuration.title
                AcmeTitleView()
            }
        } subtitle: {
            VStack {
                configuration.subtitle
                AcmeSubtitleView()
            }
        }
        .modifier(FioriKeyValueItemSizeClassModifier())
    }
}
*/
