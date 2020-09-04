//
//  ImageStyle.swift
//  ThemingPrototype
//
//  Created by Stan Stadelman on 8/19/20.
//

import SwiftUI

public struct ImageStyle: _StyleGenerating {
    typealias Concrete = Image
    public init() {}
    // sourcery: return_concrete
    var _renderingMode: Image.TemplateRenderingMode? = nil
    // sourcery: return_concrete
    var _interpolation: Image.Interpolation? = nil
    // sourcery: swiftui_view_mod_param = "_ isAntialiased: Bool"
    // sourcery: return_concrete
    var _antialiased: Bool? = nil
    // sourcery: swiftui_view_mod_param = "capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch"
    // sourcery: return_concrete
    var _resizable: (capInsets: EdgeInsets, resizingMode: Image.ResizingMode)?

    // MARK: - General View Modifiers
    // TODO: KEEP THIS IN SYNC ACROSS CONCRETE STYLES
    
    // MARK: Sizing a View
    // sourcery: swiftui_view_mod_param_true
    // sourcery: return_some_view
    var _fixedSize: Bool? = nil
    
    // MARK: Adjusting the Padding of a View
    // sourcery: swiftui_view_mod_param = "_ length: CGFloat"
    // sourcery: swiftui_view_mod_func_name = "padding"
    // sourcery: return_some_view
    var _paddingLength: CGFloat? = nil
    
    // sourcery: swiftui_view_mod_param = "_ insets: EdgeInsets"
    // sourcery: swiftui_view_mod_func_name = "padding"
    // sourcery: return_some_view
    var _paddingInsets: EdgeInsets? = nil
    
    // sourcery: swiftui_view_mod_param = "_ edges: Edge.Set = .all, _ length: CGFloat? = nil"
    // sourcery: swiftui_view_mod_func_name = "padding"
    // sourcery: return_some_view
    var _paddingSet: (edges: Edge.Set, length: CGFloat?)? = nil
    
    //TODO: - Layering Views
    
    // MARK: Masking and Clipping Views
    // sourcery: swiftui_view_mod_param = "_ radius: CGFloat, antialiased: Bool = true"
    // sourcery: return_some_view
    var _cornerRadius: (radius: CGFloat, antialiased: Bool)? = nil
}
