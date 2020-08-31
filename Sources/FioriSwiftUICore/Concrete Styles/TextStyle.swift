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
//    public init(font: Font? = nil) {
//        if font != nil {
//            _font = font
//        }
//    }
    
    public init() {}
    typealias Concrete = Text
    // sourcery: return_some_view
    var _font: Font? = nil
    // sourcery: return_concrete
    var _fontWeight: Font.Weight?
    // sourcery: return_some_view
    var _foregroundColor: Color? = nil
    // sourcery: return_concrete
    var _bold: Bool? = nil
    // sourcery: return_concrete
    var _italic: Bool? = nil
    // sourcery: param_anon_bool_color
    // sourcery: return_concrete
    var _strikethrough: Color? = nil
    // sourcery: return_concrete
    // sourcery: param_anon_bool_color
    var _underline: Color? = nil
    // sourcery: return_concrete
    var _kerning: CGFloat? = nil
    // sourcery: return_concrete
    var _tracking: CGFloat? = nil
    // sourcery: return_concrete
    var _baselineOffset: CGFloat? = nil
    // sourcery: return_some_view
    var _textCase: Text.Case? = nil
    // sourcery: param_anon_bool
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
    // sourcery: param_anon_bool
    // sourcery: return_some_view
    var _flipsForRightToLeftLayoutDirection: Bool? = nil
}

