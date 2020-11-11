import SwiftUI
/*
extension ContactItem2: View {
    public var body: some View {
        HStack(spacing: 8) {
            if let image = model.detailImage {
                image
                    .resizable()
                    .applying(detailImageStyle).modifier(detailImageModifier)
                    .frame(width: 45, height: 45)
                    
            }
            VStack(alignment: .leading) {
                Text(model.title).applying(titleStyle).modifier(titleModifier)
                if let subtitle = model.subtitle {
                    Text(subtitle).applying(subtitleStyle).modifier(subtitleModifier)
                }
                if let footnote = model.footnote {
                    Text(footnote).applying(footnoteStyle).modifier(footnoteModifier)
                }
            }
            Spacer()
            if horizontalSizeClass == .some(.regular),
               let descriptionText = model.descriptionText {
                Text(descriptionText).applying(descriptionTextStyle).modifier(descriptionTextModifier)
            }
            actionItems
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
*/
 // TODO: Extend ContactItem to implement LayoutRouter, Layout, and Style in separate file
 // Place at FioriSwiftUICore/Views/ContactItem+StyleImpl.swift

 /*
 // MARK - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

 /// For single-layout components, this is where the `View.Body` should be implemented
 public struct FioriContactItemStyle : ContactItemStyle {
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
