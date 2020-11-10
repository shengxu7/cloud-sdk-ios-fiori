//
//  _ComponentGenerating.swift
//  ThemingPrototype
//
//  Created by Stan Stadelman on 8/18/20.
//

import SwiftUI

internal protocol _ComponentGenerating {}

internal struct _Component: _ComponentGenerating {
    let title: String
    let subtitle: String?
    let footnote: String?
    let descriptionText: String?
    let detailImage: Image?
    let attribute: String?
    let secondaryAttribute: String?
    let timestamp: String?
    let secondaryTimestamp: String?
    let trend: String?
    let status: String?
    let substatus: String?
    let body: String?
    let icons: [String]?
    let actionTitle: String?
    let seriesTitles: [String]?
    let key: String
    let value: String?
    let values: [String]
    let valueAxisTitle: String?
    let secondaryValuesAxisTitle: String?
    let categoryAxisTitle: String?
    let emptyText: String?
    let kpi: String?
    let placeholder: String?
    let tags: [String]?
    let lowerBoundTitle: String?
    let upperBoundTitle: String?
}
