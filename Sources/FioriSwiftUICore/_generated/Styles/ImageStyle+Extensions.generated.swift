// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public extension ImageStyle {
    func renderingMode(_ value: Image.TemplateRenderingMode) -> ImageStyle {
        var new = self
        new._renderingMode = value
        return new
    }
    func interpolation(_ value: Image.Interpolation) -> ImageStyle {
        var new = self
        new._interpolation = value
        return new
    }
    func antialiased() -> ImageStyle {
        var new = self
        new._antialiased = true
        return new
    }
}

public extension Image {
    func applying(_ style: ImageStyle) -> some View {
        let image = self
            ._applyRenderingMode(style._renderingMode)
            ._applyInterpolation(style._interpolation)
            ._applyAntialiased(style._antialiased)
        let someView = image
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
        return self.antialiased(true)
    }
}

fileprivate extension View {
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
        return new
    }
}
