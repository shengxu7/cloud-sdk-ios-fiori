//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 11/10/20.
//

import SwiftUI

public struct AnyViewModifier: ViewModifier {
    let apply: (Content) -> AnyView
    public init<V: View>(transform: @escaping (Content) -> V) {
        self.apply = { AnyView(transform($0)) }
    }
    public func body(content: Content) -> AnyView {
        apply(content)
    }
}
