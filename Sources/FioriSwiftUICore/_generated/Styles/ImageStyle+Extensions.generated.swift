// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

// MARK: - Public 'View Modifier'-style interface 
public extension ImageStyle {
    func renderingMode(_ renderingMode: Image.TemplateRenderingMode) -> ImageStyle {
        var new = self
        new._renderingMode = renderingMode
        return new
    } 
    func interpolation(_ interpolation: Image.Interpolation) -> ImageStyle {
        var new = self
        new._interpolation = interpolation
        return new
    } 
    func antialiased(_ isAntialiased: Bool) -> ImageStyle {
        var new = self
        new._antialiased = isAntialiased
        return new
    } 
    func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> ImageStyle {
        var new = self
        new._resizable = (capInsets: capInsets, resizingMode: resizingMode)
        return new
    } 
    func fixedSize() -> ImageStyle {
        var new = self
        new._fixedSize = true
        return new
    } 
    func paddingLength(_ length: CGFloat) -> ImageStyle {
        var new = self
        new._paddingLength = length
        return new
    } 
    func paddingInsets(_ insets: EdgeInsets) -> ImageStyle {
        var new = self
        new._paddingInsets = insets
        return new
    } 
    func paddingSet(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> ImageStyle {
        var new = self
        new._paddingSet = (edges, length)
        return new
    } 
    func cornerRadius(_ radius: CGFloat, antialiased: Bool = true) -> ImageStyle {
        var new = self
        new._cornerRadius = (radius, antialiased: antialiased)
        return new
    } 
}

public extension Image {
    func applying(_ style: ImageStyle) -> some View {
        let image = self
            ._applyRenderingMode(style._renderingMode)
            ._applyInterpolation(style._interpolation)
            ._applyAntialiased(style._antialiased)
            ._applyResizable(style._resizable)
        let someView = image
            ._applyFixedSize(style._fixedSize)
            ._applyPaddingLength(style._paddingLength)
            ._applyPaddingInsets(style._paddingInsets)
            ._applyPaddingSet(style._paddingSet)
            ._applyCornerRadius(style._cornerRadius)
        return someView
    }
}


fileprivate extension Image {

    func _applyRenderingMode(_ value: Image.TemplateRenderingMode?) -> Image {
        guard value != nil else { return self }
        return self.renderingMode(value!)
    }

    func _applyInterpolation(_ value: Image.Interpolation?) -> Image {
        guard value != nil else { return self }
        return self.interpolation(value!)
    }

    func _applyAntialiased(_ value: Bool?) -> Image {
        guard value != nil else { return self }
        return self.antialiased(value!)
    }

    func _applyResizable(_ value: (capInsets: EdgeInsets, resizingMode: Image.ResizingMode)?) -> Image {
        guard value != nil else { return self }
        return self.resizable(capInsets: value!.capInsets, resizingMode: value!.resizingMode)
    }
}

fileprivate extension View {

    func _applyFixedSize(_ value: Bool?) -> some View {
        return Group {
            if value != nil {
                self.fixedSize()
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

public extension ImageStyle {
    func merging(_ style: ImageStyle) -> ImageStyle {
        var new = self
        if let value = style._renderingMode { 
            new._renderingMode = value 
        }
        if let value = style._interpolation { 
            new._interpolation = value 
        }
        if let value = style._antialiased { 
            new._antialiased = value 
        }
        if let value = style._resizable { 
            new._resizable = value 
        }
        if let value = style._fixedSize { 
            new._fixedSize = value 
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
