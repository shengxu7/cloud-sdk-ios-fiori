//
//  ImageStyle.swift
//  ThemingPrototype
//
//  Created by Stan Stadelman on 8/19/20.
//

import SwiftUI

public struct ImageStyle: _StyleGenerating {
    typealias Concrete = Image
    // sourcery: return_concrete
    var _renderingMode: Image.TemplateRenderingMode? = nil
    // sourcery: return_concrete
    var _interpolation: Image.Interpolation? = nil
    // sourcery: param_anon_bool
    // sourcery: return_concrete
    var _antialiased: Bool? = nil
}
