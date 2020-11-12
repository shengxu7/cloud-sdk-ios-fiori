import SwiftUI

extension Fiori {
    enum ContactItem {
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

 // MARK: - Uncomment if View has multiple layouts, depending upon context

 /// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
 public struct FioriContactItemStyle: ContactItemStyle {
     public func makeBody(configuration: Configuration) -> some View {
         ContactItem  {
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
         .modifier(FioriContactItemLayoutRouter())
     }
 }

 /// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
 /// May be modified, replaced, or chained.
 struct FioriContactItemLayoutRouter: ViewModifier {
     
     @Environment(\.horizontalSizeClass) private var horizontalSizeClass

     @ViewBuilder
     func body(content: Content) -> some View {
         if horizontalSizeClass == .some(.compact) {
             content.contactItemStyle(FioriContactItemStyle.CompactLayout())
         } else {
             content.contactItemStyle(FioriContactItemStyle.RegularLayout())
         }
     }
 }

 extension FioriContactItemStyle {
    
     public struct CompactLayout: ContactItemStyle {
         public func makeBody(configuration: Configuration) -> some View {
            HStack(spacing: 8) {
                configuration.detailImage
                    .frame(width: 45, height: 45)
                        
                VStack(alignment: .leading) {
                    configuration.title
                    configuration.subtitle
                    configuration.footnote
                }
                Spacer()
//                actionItems
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
         }
     }

     public struct RegularLayout: ContactItemStyle {
         public func makeBody(configuration: Configuration) -> some View {

            HStack(spacing: 8) {
                configuration.detailImage
                    .frame(width: 45, height: 45)
                        
                VStack(alignment: .leading) {
                    configuration.title
                    configuration.subtitle
                    configuration.footnote
                }
                Spacer()
                configuration.descriptionText
//                actionItems
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
 public struct AcmeContactItemStyle: ContactItemStyle {
     
     @ViewBuilder
     public func makeBody(configuration: Configuration) -> some View {
         ContactItem  {
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
