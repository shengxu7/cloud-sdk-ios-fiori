// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct HeaderChart {
    let model: HeaderChartModel

    public init(model: HeaderChartModel) {
        self.model = model
    }

    @Environment(\.titleStyle) internal var titleStyle: TextStyle
    @Environment(\.titleModifier) internal var titleModifier: AnyViewModifier
    @Environment(\.subtitleStyle) internal var subtitleStyle: TextStyle
    @Environment(\.subtitleModifier) internal var subtitleModifier: AnyViewModifier
    @Environment(\.trendStyle) internal var trendStyle: TextStyle
    @Environment(\.trendModifier) internal var trendModifier: AnyViewModifier
    @Environment(\.kpiStyle) internal var kpiStyle: TextStyle
    @Environment(\.kpiModifier) internal var kpiModifier: AnyViewModifier
}

// TODO: Extend HeaderChart to implement View in separate file
// place at FioriSwiftUICore/Views/HeaderChart+View.swift
/*
import SwiftUI

extension HeaderChart: View {
    public var body: some View { 
        <# View body #> 
    }
}
*/
