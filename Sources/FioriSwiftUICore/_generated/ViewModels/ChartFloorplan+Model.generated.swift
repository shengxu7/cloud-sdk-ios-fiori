// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ChartFloorplan {
    let model: ChartFloorplanModel

    public init(model: ChartFloorplanModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.statusStyle) internal var statusStyle: TextStyle
    @Environment(\.valueAxisTitleStyle) internal var valueAxisTitleStyle: TextStyle
    @Environment(\.seriesTitlesStyle) internal var seriesTitlesStyle: TextStyle
    @Environment(\.categoryAxisTitleStyle) internal var categoryAxisTitleStyle: TextStyle
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
