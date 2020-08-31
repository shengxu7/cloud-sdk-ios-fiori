// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public extension TextStyle {
    func font(_ value: Font) -> TextStyle {
        var new = self
        new._font = value
        return new
    }
    func fontWeight(_ value: Font.Weight) -> TextStyle {
        var new = self
        new._fontWeight = value
        return new
    }
    func foregroundColor(_ value: Color) -> TextStyle {
        var new = self
        new._foregroundColor = value
        return new
    }
    func bold() -> TextStyle {
        var new = self
        new._bold = true
        return new
    }
    func italic() -> TextStyle {
        var new = self
        new._italic = true
        return new
    }
    func strikethrough(_ value: Color) -> TextStyle {
        var new = self
        new._strikethrough = value
        return new
    }
    func underline(_ value: Color) -> TextStyle {
        var new = self
        new._underline = value
        return new
    }
    func kerning(_ value: CGFloat) -> TextStyle {
        var new = self
        new._kerning = value
        return new
    }
    func tracking(_ value: CGFloat) -> TextStyle {
        var new = self
        new._tracking = value
        return new
    }
    func baselineOffset(_ value: CGFloat) -> TextStyle {
        var new = self
        new._baselineOffset = value
        return new
    }
    func textCase(_ value: Text.Case) -> TextStyle {
        var new = self
        new._textCase = value
        return new
    }
    func allowsTightening() -> TextStyle {
        var new = self
        new._allowsTightening = true
        return new
    }
    func minimumScaleFactor(_ value: CGFloat) -> TextStyle {
        var new = self
        new._minimumScaleFactor = value
        return new
    }
    func truncationMode(_ value: Text.TruncationMode) -> TextStyle {
        var new = self
        new._truncationMode = value
        return new
    }
    func lineLimit(_ value: Int) -> TextStyle {
        var new = self
        new._lineLimit = value
        return new
    }
    func lineSpacing(_ value: CGFloat) -> TextStyle {
        var new = self
        new._lineSpacing = value
        return new
    }
    func multilineTextAlignment(_ value: TextAlignment) -> TextStyle {
        var new = self
        new._multilineTextAlignment = value
        return new
    }
    func flipsForRightToLeftLayoutDirection() -> TextStyle {
        var new = self
        new._flipsForRightToLeftLayoutDirection = true
        return new
    }
}

public extension Text {
    func applying(_ style: TextStyle) -> some View {
        let text = self
            ._applyFontWeight(style._fontWeight)
            ._applyBold(style._bold)
            ._applyItalic(style._italic)
            ._applyStrikethrough(style._strikethrough)
            ._applyUnderline(style._underline)
            ._applyKerning(style._kerning)
            ._applyTracking(style._tracking)
            ._applyBaselineOffset(style._baselineOffset)
        let someView = text
            ._applyFont(style._font)
            ._applyForegroundColor(style._foregroundColor)
            ._applyTextCase(style._textCase)
            ._applyAllowsTightening(style._allowsTightening)
            ._applyMinimumScaleFactor(style._minimumScaleFactor)
            ._applyTruncationMode(style._truncationMode)
            ._applyLineLimit(style._lineLimit)
            ._applyLineSpacing(style._lineSpacing)
            ._applyMultilineTextAlignment(style._multilineTextAlignment)
            ._applyFlipsForRightToLeftLayoutDirection(style._flipsForRightToLeftLayoutDirection)
        return someView
    }
}

fileprivate extension Text {

    func _applyFontWeight(_ value: Font.Weight?) -> Text {
        guard value != nil else { return self }
        return self.fontWeight(value!)
    }

    func _applyBold(_ value: Bool?) -> Text {
        guard value != nil else { return self }
        return self.bold()
    }

    func _applyItalic(_ value: Bool?) -> Text {
        guard value != nil else { return self }
        return self.italic()
    }

    func _applyStrikethrough(_ value: Color?) -> Text {
        guard value != nil else { return self }
        return self.strikethrough(true,color:value!)
    }

    func _applyUnderline(_ value: Color?) -> Text {
        guard value != nil else { return self }
        return self.underline(true,color:value!)
    }

    func _applyKerning(_ value: CGFloat?) -> Text {
        guard value != nil else { return self }
        return self.kerning(value!)
    }

    func _applyTracking(_ value: CGFloat?) -> Text {
        guard value != nil else { return self }
        return self.tracking(value!)
    }

    func _applyBaselineOffset(_ value: CGFloat?) -> Text {
        guard value != nil else { return self }
        return self.baselineOffset(value!)
    }
}

fileprivate extension View {

    func _applyFont(_ value: Font?) -> some View {
        return Group {
            if value != nil {
                self.font(value!)
            } else {
                self
            }
        }
    }

    func _applyForegroundColor(_ value: Color?) -> some View {
        return Group {
            if value != nil {
                self.foregroundColor(value!)
            } else {
                self
            }
        }
    }

    func _applyTextCase(_ value: Text.Case?) -> some View {
        return Group {
            if value != nil {
                self.textCase(value!)
            } else {
                self
            }
        }
    }

    func _applyAllowsTightening(_ value: Bool?) -> some View {
        return Group {
            if value != nil {
                self.allowsTightening(true)
            } else {
                self
            }
        }
    }

    func _applyMinimumScaleFactor(_ value: CGFloat?) -> some View {
        return Group {
            if value != nil {
                self.minimumScaleFactor(value!)
            } else {
                self
            }
        }
    }

    func _applyTruncationMode(_ value: Text.TruncationMode?) -> some View {
        return Group {
            if value != nil {
                self.truncationMode(value!)
            } else {
                self
            }
        }
    }

    func _applyLineLimit(_ value: Int?) -> some View {
        return Group {
            if value != nil {
                self.lineLimit(value!)
            } else {
                self
            }
        }
    }

    func _applyLineSpacing(_ value: CGFloat?) -> some View {
        return Group {
            if value != nil {
                self.lineSpacing(value!)
            } else {
                self
            }
        }
    }

    func _applyMultilineTextAlignment(_ value: TextAlignment?) -> some View {
        return Group {
            if value != nil {
                self.multilineTextAlignment(value!)
            } else {
                self
            }
        }
    }

    func _applyFlipsForRightToLeftLayoutDirection(_ value: Bool?) -> some View {
        return Group {
            if value != nil {
                self.flipsForRightToLeftLayoutDirection(true)
            } else {
                self
            }
        }
    }
}

public extension TextStyle {
    func merging(_ style: TextStyle) -> TextStyle {
        var new = self
        if let value = style._font { 
            new._font = value 
        }
        if let value = style._fontWeight { 
            new._fontWeight = value 
        }
        if let value = style._foregroundColor { 
            new._foregroundColor = value 
        }
        if let value = style._bold { 
            new._bold = value 
        }
        if let value = style._italic { 
            new._italic = value 
        }
        if let value = style._strikethrough { 
            new._strikethrough = value 
        }
        if let value = style._underline { 
            new._underline = value 
        }
        if let value = style._kerning { 
            new._kerning = value 
        }
        if let value = style._tracking { 
            new._tracking = value 
        }
        if let value = style._baselineOffset { 
            new._baselineOffset = value 
        }
        if let value = style._textCase { 
            new._textCase = value 
        }
        if let value = style._allowsTightening { 
            new._allowsTightening = value 
        }
        if let value = style._minimumScaleFactor { 
            new._minimumScaleFactor = value 
        }
        if let value = style._truncationMode { 
            new._truncationMode = value 
        }
        if let value = style._lineLimit { 
            new._lineLimit = value 
        }
        if let value = style._lineSpacing { 
            new._lineSpacing = value 
        }
        if let value = style._multilineTextAlignment { 
            new._multilineTextAlignment = value 
        }
        if let value = style._flipsForRightToLeftLayoutDirection { 
            new._flipsForRightToLeftLayoutDirection = value 
        }
        return new
    }
}
