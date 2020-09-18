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
    // sourcery: return_some_view
    var _truncationMode: Text.TruncationMode? = nil
    // sourcery: return_some_view
    var _lineLimit: Int? = nil
    // sourcery: return_some_view
    var _lineSpacing: CGFloat? = nil
    // sourcery: return_some_view
    var _multilineTextAlignment: TextAlignment? = nil
}

