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


public struct TextStyle: Decodable, _StyleGenerating {
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let fontColor = try container.decodeIfPresent(String.self, forKey: .fontColor) {
            _foregroundColor = try Color(hexCode: fontColor)
        }
        
        let fontSize  = try container.decodeIfPresent(Int.self, forKey: .fontSize) ?? 17
        
        if let fontName = try container.decodeIfPresent(String.self, forKey: .fontName) {
            _font = SwiftUI.Font.custom(fontName, size: CGFloat(fontSize))
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case fontColor = "font-color"
        case fontName = "font-name"
        case fontSize = "font-size"
        case fontWight = "font-weight"
    }
    
    func toViewModifier() -> AnyViewModifier {
        return AnyViewModifier(transform: { $0.modifier(ViewModifier(style: self)) })
    }
}

internal extension TextStyle {
    func _viewModifierFont() -> Font? {
        guard _font != nil else { return nil }
        var f = _font!
        if let fontWeight = _fontWeight {
            f = f.weight(fontWeight)
        }
        if let bold = _bold, bold {
            f = f.bold()
        }
        if let italic = _italic, italic {
            f = f.italic()
        }
        return f
    }
}

extension Color {
    public init(hexCode: String) throws {
        
        if hexCode.hasPrefix("#") {
            let start = hexCode.index(hexCode.startIndex, offsetBy: 1)
            let hexColor = String(hexCode[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                let r, g, b, a: Double
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = Double((hexNumber & 0xff000000) >> 24) / 255
                    g = Double((hexNumber & 0x00ff0000) >> 16) / 255
                    b = Double((hexNumber & 0x0000ff00) >> 8) / 255
                    a = Double(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, opacity: a)
                    return
                }
            } else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                let r, g, b: Double
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = Double((hexNumber & 0xff0000) >> 16) / 255
                    g = Double((hexNumber & 0x00ff00) >> 8) / 255
                    b = Double(hexNumber & 0x0000ff) / 255
                    self.init(red: r, green: g, blue: b, opacity: 1.0)
                    return
                }
            }
        }
        throw HexConversion.failed(hexCode)
    }
    
    public enum HexConversion: Swift.Error {
        case failed(String)
        case invalidLength(String)
        
        var description: String {
            switch self {
            case .failed(let message):
                return message
            case .invalidLength(let message):
                return message
            }
        }
    }
}

// KEEP, need to copy into generated file until added to generation
//extension TextStyle {
//    struct ViewModifier: SwiftUI.ViewModifier {
//        let style: TextStyle
//        func body(content: Content) -> some View {
//            content
//                ._applyFont(style._viewModifierFont())
//                ._applyForegroundColor(style._foregroundColor)
//                ._applyTruncationMode(style._truncationMode)
//                ._applyLineLimit(style._lineLimit)
//                ._applyLineSpacing(style._lineSpacing)
//                ._applyMultilineTextAlignment(style._multilineTextAlignment)
//        }
//    }
//}
