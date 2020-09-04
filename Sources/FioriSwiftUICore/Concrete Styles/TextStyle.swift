//
//  TextStyle.swift
//  ThemingPrototype
//
//  Created by Stan Stadelman on 8/18/20.
//

import SwiftUI

protocol _StyleGenerating {
    associatedtype Concrete: View
}


public struct TextStyle: _StyleGenerating {
    public init(font: Font? = nil) {
        if font != nil {
            _font = font
        }
    }
    
    public init() {}
    typealias Concrete = Text
    // sourcery: return_some_view
    var _font: Font? = nil
    // sourcery: return_concrete
    var _fontWeight: Font.Weight?
    // sourcery: return_some_view
    var _foregroundColor: Color? = nil
    // sourcery: swiftui_view_mod_param_true
    // sourcery: return_concrete
    var _bold: Bool? = nil
    // sourcery: swiftui_view_mod_param_true
    // sourcery: return_concrete
    var _italic: Bool? = nil
    // sourcery: swiftui_view_mod_param = "_ active: Bool = true, color: Color? = nil"
    // sourcery: return_concrete
    var _strikethrough: (active: Bool, color: Color?)? = nil
    // sourcery: swiftui_view_mod_param = "_ active: Bool = true, color: Color? = nil"
    // sourcery: return_concrete
    var _underline: (active: Bool, color: Color?)? = nil
    // sourcery: return_concrete
    var _kerning: CGFloat? = nil
    // sourcery: return_concrete
    var _tracking: CGFloat? = nil
    // sourcery: return_concrete
    var _baselineOffset: CGFloat? = nil
    // sourcery: return_some_view
    var _textCase: Text.Case? = nil
    // sourcery: swiftui_view_mod_param = "_ flag: Bool"
    // sourcery: return_some_view
    var _allowsTightening: Bool? = nil
    // sourcery: return_some_view
    var _minimumScaleFactor: CGFloat? = nil
    // sourcery: return_some_view
    var _truncationMode: Text.TruncationMode? = nil
    // sourcery: return_some_view
    var _lineLimit: Int? = nil
    // sourcery: return_some_view
    var _lineSpacing: CGFloat? = nil
    // sourcery: return_some_view
    var _multilineTextAlignment: TextAlignment? = nil
    // sourcery: swiftui_view_mod_param = "_ enabled: Bool"
    // sourcery: return_some_view
    var _flipsForRightToLeftLayoutDirection: Bool? = nil
    
    // MARK: - General View Modifiers
    // TODO: KEEP THIS IN SYNC ACROSS CONCRETE STYLES
    
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
    
    // sourcery: swiftui_view_mod_param = "_ radius: CGFloat, antialiased: Bool = true"
    // sourcery: return_some_view
    var _cornerRadius: (radius: CGFloat, antialiased: Bool)?
    
}

