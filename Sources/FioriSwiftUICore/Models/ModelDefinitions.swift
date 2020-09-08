//
//  ModelDefinitions.swift
//  ThemingPrototype
//
//  Created by Stadelman, Stan on 8/20/20.
//

import Foundation

// Standard Components
// sourcery: generated_component
public protocol ObjectItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent {}

// sourcery: generated_component
public protocol ObjectHeaderModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent {}

// sourcery: generated_component
public protocol HeaderChartModel: TitleComponent, SubtitleComponent, TrendComponent, KpiComponent {}

// sourcery: add_generics = "ActionItems: View"
// sourcery: add_init_params = "@ViewBuilder actionItems: @escaping () -> ActionItems"
// sourcery: generated_component
public protocol ContactItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, DetailImageComponent {}

// sourcery: generated_component
public protocol TimelineExtendedItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, AttributeComponent, SecondaryAttributeComponent, TimestampComponent, SecondaryTimestampComponent, StatusComponent, SubstatusComponent {}

// sourcery: generated_component
public protocol ChartFloorplanModel: TitleComponent, SubtitleComponent, StatusComponent, ValueAxisTitleComponent, SeriesTitlesComponent, CategoryAxisTitleComponent {}

// sourcery: add_generics = "ActionItems: View"
// sourcery: add_init_params = "@ViewBuilder actionItems: @escaping () -> ActionItems"
// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: generated_component
public protocol ProfileHeaderModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, DetailImageComponent {}

// sourcery: generated_component
public protocol TimelineItemModel: TitleComponent, TimestampComponent, StatusComponent {}

