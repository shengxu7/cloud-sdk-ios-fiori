// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ChartFloorplan {
    let model: ChartFloorplanModel

    public init(model: ChartFloorplanModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.subtitleModifier) internal var subtitleModifier: AnyViewModifier
    @Environment(\.statusStyle) internal var statusStyle: TextStyle
    @Environment(\.statusModifier) internal var statusModifier: AnyViewModifier
    @Environment(\.valueAxisTitleStyle) internal var valueAxisTitleStyle: TextStyle
    @Environment(\.valueAxisTitleModifier) internal var valueAxisTitleModifier: AnyViewModifier
    @Environment(\.seriesTitlesStyle) internal var seriesTitlesStyle: TextStyle
    @Environment(\.seriesTitlesModifier) internal var seriesTitlesModifier: AnyViewModifier
    @Environment(\.categoryAxisTitleStyle) internal var categoryAxisTitleStyle: TextStyle
    @Environment(\.categoryAxisTitleModifier) internal var categoryAxisTitleModifier: AnyViewModifier
}

// TODO: Extend ChartFloorplan to implement View in separate file
// place at FioriSwiftUICore/Views/ChartFloorplan+View.swift
/*
import SwiftUI

extension ChartFloorplan: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
