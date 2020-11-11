//
//  SectionHeader+View.swift
//  
//
//  Created by Stadelman, Stan on 9/19/20.
//

import SwiftUI
import UIKit


 // TODO - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

 /// For single-layout components, this is where the `View.Body` should be implemented
 public struct FioriSectionHeaderStyle : SectionHeaderStyle {
     public func makeBody(configuration: Configuration) -> some View {

        HStack {
            configuration.title
            Spacer()
            HStack {
                configuration.attribute
                    .multilineTextAlignment(.trailing)
//                action
            }
        }
        .padding()
     }
 }
 
 /*
 // TODO: - Uncomment if View has multiple layouts, depending upon context

 /// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
 public struct FioriSectionHeaderStyle: SectionHeaderStyle {
     public func makeBody(configuration: Configuration) -> some View {
         SectionHeader  {
             configuration.title
         } attribute: {
             configuration.attribute
         }
         .modifier(FioriSectionHeaderLayoutRouter())
     }
 }

 /// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
 /// May be modified, replaced, or chained.
 public struct FioriSectionHeaderLayoutRouter: ViewModifier {
     
     @Environment(\.horizontalSizeClass) private var horizontalSizeClass

     @ViewBuilder
     public func body(content: Content) -> some View {
         if horizontalSizeClass == .some(.compact) {
             content.sectionHeaderStyle(FioriSectionHeaderStyle.CompactLayout())
         } else {
             content.sectionHeaderStyle(FioriSectionHeaderStyle.RegularLayout())
         }
     }
 }

 extension FioriSectionHeaderStyle {
     public struct CompactLayout: SectionHeaderStyle {
         public func makeBody(configuration: Configuration) -> some View {
             VStack {
                 configuration.title
             configuration.attribute
             }
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                     .padding([.top, .bottom], 8)
         }
     }

     public struct RegularLayout: SectionHeaderStyle {
         public func makeBody(configuration: Configuration) -> some View {
             HStack {
                 configuration.title
             configuration.attribute
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
 public struct AcmeSectionHeaderStyle: SectionHeaderStyle {
     
     @ViewBuilder
     public func makeBody(configuration: Configuration) -> some View {
         SectionHeader  {
             VStack {
                 configuration.title
                 AcmeTitleView()
             }
         } attribute: {
             VStack {
                 configuration.attribute
                 AcmeAttributeView()
             }
         }
         .modifier(FioriKeyValueItemSizeClassModifier())
     }
 }
 */
