// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

// MARK: - Public 'View Modifier'-style interface 
public extension TextStyle {
    func font(_ font: Font) -> TextStyle {
        var new = self
        new._font = font
        return new
    } 
    func fontWeight(_ fontWeight: Font.Weight) -> TextStyle {
        var new = self
        new._fontWeight = fontWeight
        return new
    } 
    func foregroundColor(_ foregroundColor: Color) -> TextStyle {
        var new = self
        new._foregroundColor = foregroundColor
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
    func strikethrough(_ active: Bool = true, color: Color? = nil) -> TextStyle {
        var new = self
        new._strikethrough = (active, color: color)
        return new
    } 
    func underline(_ active: Bool = true, color: Color? = nil) -> TextStyle {
        var new = self
        new._underline = (active, color: color)
        return new
    } 
    func kerning(_ kerning: CGFloat) -> TextStyle {
        var new = self
        new._kerning = kerning
        return new
    } 
    func tracking(_ tracking: CGFloat) -> TextStyle {
        var new = self
        new._tracking = tracking
        return new
    } 
    func baselineOffset(_ baselineOffset: CGFloat) -> TextStyle {
        var new = self
        new._baselineOffset = baselineOffset
        return new
    } 
    func textCase(_ textCase: Text.Case) -> TextStyle {
        var new = self
        new._textCase = textCase
        return new
    } 
    func allowsTightening(_ flag: Bool) -> TextStyle {
        var new = self
        new._allowsTightening = flag
        return new
    } 
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> TextStyle {
        var new = self
        new._minimumScaleFactor = minimumScaleFactor
        return new
    } 
    func truncationMode(_ truncationMode: Text.TruncationMode) -> TextStyle {
        var new = self
        new._truncationMode = truncationMode
        return new
    } 
    func lineLimit(_ lineLimit: Int) -> TextStyle {
        var new = self
        new._lineLimit = lineLimit
        return new
    } 
    func lineSpacing(_ lineSpacing: CGFloat) -> TextStyle {
        var new = self
        new._lineSpacing = lineSpacing
        return new
    } 
    func multilineTextAlignment(_ multilineTextAlignment: TextAlignment) -> TextStyle {
        var new = self
        new._multilineTextAlignment = multilineTextAlignment
        return new
    } 
    func flipsForRightToLeftLayoutDirection(_ enabled: Bool) -> TextStyle {
        var new = self
        new._flipsForRightToLeftLayoutDirection = enabled
        return new
    } 
    func paddingLength(_ length: CGFloat) -> TextStyle {
        var new = self
        new._paddingLength = length
        return new
    } 
    func paddingInsets(_ insets: EdgeInsets) -> TextStyle {
        var new = self
        new._paddingInsets = insets
        return new
    } 
    func paddingSet(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> TextStyle {
        var new = self
        new._paddingSet = (edges, length)
        return new
    } 
    func cornerRadius(_ radius: CGFloat, antialiased: Bool = true) -> TextStyle {
        var new = self
        new._cornerRadius = (radius, antialiased: antialiased)
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
            ._applyPaddingLength(style._paddingLength)
            ._applyPaddingInsets(style._paddingInsets)
            ._applyPaddingSet(style._paddingSet)
            ._applyCornerRadius(style._cornerRadius)
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

    func _applyStrikethrough(_ value: (active: Bool, color: Color?)?) -> Text {
        guard value != nil else { return self }
        return self.strikethrough(value!.active, color: value!.color)
    }

    func _applyUnderline(_ value: (active: Bool, color: Color?)?) -> Text {
        guard value != nil else { return self }
        return self.underline(value!.active, color: value!.color)
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
                self.allowsTightening(value!)
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
                self.flipsForRightToLeftLayoutDirection(value!)
            } else {
                self
            }
        }
    }

    func _applyPaddingLength(_ value: CGFloat?) -> some View {
        return Group {
            if value != nil {
                self.padding(value!)
            } else {
                self
            }
        }
    }

    func _applyPaddingInsets(_ value: EdgeInsets?) -> some View {
        return Group {
            if value != nil {
                self.padding(value!)
            } else {
                self
            }
        }
    }

    func _applyPaddingSet(_ value: (edges: Edge.Set, length: CGFloat?)?) -> some View {
        return Group {
            if value != nil {
                self.padding(value!.edges, value!.length)
            } else {
                self
            }
        }
    }

    func _applyCornerRadius(_ value: (radius: CGFloat, antialiased: Bool)?) -> some View {
        return Group {
            if value != nil {
                self.cornerRadius(value!.radius, antialiased: value!.antialiased)
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
        if let value = style._paddingLength { 
            new._paddingLength = value 
        }
        if let value = style._paddingInsets { 
            new._paddingInsets = value 
        }
        if let value = style._paddingSet { 
            new._paddingSet = value 
        }
        if let value = style._cornerRadius { 
            new._cornerRadius = value 
        }
        return new
    }
}
