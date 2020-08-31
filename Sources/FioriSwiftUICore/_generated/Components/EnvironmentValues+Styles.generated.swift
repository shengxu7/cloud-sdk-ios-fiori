// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

extension EnvironmentValues {
    public var titleStyle: TextStyle {
        get { return self[TitleStyleKey.self] }
        set { self[TitleStyleKey.self] = newValue }
    }
    public var subtitleStyle: TextStyle {
        get { return self[SubtitleStyleKey.self] }
        set { self[SubtitleStyleKey.self] = newValue }
    }
    public var footnoteStyle: TextStyle {
        get { return self[FootnoteStyleKey.self] }
        set { self[FootnoteStyleKey.self] = newValue }
    }
    public var descriptionTextStyle: TextStyle {
        get { return self[DescriptionTextStyleKey.self] }
        set { self[DescriptionTextStyleKey.self] = newValue }
    }
    public var detailImageStyle: ImageStyle {
        get { return self[DetailImageStyleKey.self] }
        set { self[DetailImageStyleKey.self] = newValue }
    }
    public var attributeStyle: TextStyle {
        get { return self[AttributeStyleKey.self] }
        set { self[AttributeStyleKey.self] = newValue }
    }
    public var secondaryAttributeStyle: TextStyle {
        get { return self[SecondaryAttributeStyleKey.self] }
        set { self[SecondaryAttributeStyleKey.self] = newValue }
    }
    public var timestampStyle: TextStyle {
        get { return self[TimestampStyleKey.self] }
        set { self[TimestampStyleKey.self] = newValue }
    }
    public var secondaryTimestampStyle: TextStyle {
        get { return self[SecondaryTimestampStyleKey.self] }
        set { self[SecondaryTimestampStyleKey.self] = newValue }
    }
    public var trendStyle: TextStyle {
        get { return self[TrendStyleKey.self] }
        set { self[TrendStyleKey.self] = newValue }
    }
    public var statusStyle: TextStyle {
        get { return self[StatusStyleKey.self] }
        set { self[StatusStyleKey.self] = newValue }
    }
    public var substatusStyle: TextStyle {
        get { return self[SubstatusStyleKey.self] }
        set { self[SubstatusStyleKey.self] = newValue }
    }
    public var bodyStyle: TextStyle {
        get { return self[BodyStyleKey.self] }
        set { self[BodyStyleKey.self] = newValue }
    }
    public var iconsStyle: TextStyle {
        get { return self[IconsStyleKey.self] }
        set { self[IconsStyleKey.self] = newValue }
    }
    public var actionTitleStyle: TextStyle {
        get { return self[ActionTitleStyleKey.self] }
        set { self[ActionTitleStyleKey.self] = newValue }
    }
    public var seriesTitlesStyle: TextStyle {
        get { return self[SeriesTitlesStyleKey.self] }
        set { self[SeriesTitlesStyleKey.self] = newValue }
    }
    public var valueStyle: TextStyle {
        get { return self[ValueStyleKey.self] }
        set { self[ValueStyleKey.self] = newValue }
    }
    public var valuesStyle: TextStyle {
        get { return self[ValuesStyleKey.self] }
        set { self[ValuesStyleKey.self] = newValue }
    }
    public var valueAxisTitleStyle: TextStyle {
        get { return self[ValueAxisTitleStyleKey.self] }
        set { self[ValueAxisTitleStyleKey.self] = newValue }
    }
    public var secondaryValuesAxisTitleStyle: TextStyle {
        get { return self[SecondaryValuesAxisTitleStyleKey.self] }
        set { self[SecondaryValuesAxisTitleStyleKey.self] = newValue }
    }
    public var categoryAxisTitleStyle: TextStyle {
        get { return self[CategoryAxisTitleStyleKey.self] }
        set { self[CategoryAxisTitleStyleKey.self] = newValue }
    }
    public var emptyTextStyle: TextStyle {
        get { return self[EmptyTextStyleKey.self] }
        set { self[EmptyTextStyleKey.self] = newValue }
    }
    public var kpiStyle: TextStyle {
        get { return self[KpiStyleKey.self] }
        set { self[KpiStyleKey.self] = newValue }
    }
    public var placeholderStyle: TextStyle {
        get { return self[PlaceholderStyleKey.self] }
        set { self[PlaceholderStyleKey.self] = newValue }
    }
    public var tagsStyle: TextStyle {
        get { return self[TagsStyleKey.self] }
        set { self[TagsStyleKey.self] = newValue }
    }
    public var lowerBoundTitleStyle: TextStyle {
        get { return self[LowerBoundTitleStyleKey.self] }
        set { self[LowerBoundTitleStyleKey.self] = newValue }
    }
    public var upperBoundTitleStyle: TextStyle {
        get { return self[UpperBoundTitleStyleKey.self] }
        set { self[UpperBoundTitleStyleKey.self] = newValue }
    }
}

public extension View {
    func titleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.titleStyle) { $0 = $0.merging(style) }
    }
    func subtitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.subtitleStyle) { $0 = $0.merging(style) }
    }
    func footnoteStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.footnoteStyle) { $0 = $0.merging(style) }
    }
    func descriptionTextStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.descriptionTextStyle) { $0 = $0.merging(style) }
    }
    func detailImageStyle(_ style: ImageStyle) -> some View {
        return transformEnvironment(\.detailImageStyle) { $0 = $0.merging(style) }
    }
    func attributeStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.attributeStyle) { $0 = $0.merging(style) }
    }
    func secondaryAttributeStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.secondaryAttributeStyle) { $0 = $0.merging(style) }
    }
    func timestampStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.timestampStyle) { $0 = $0.merging(style) }
    }
    func secondaryTimestampStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.secondaryTimestampStyle) { $0 = $0.merging(style) }
    }
    func trendStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.trendStyle) { $0 = $0.merging(style) }
    }
    func statusStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.statusStyle) { $0 = $0.merging(style) }
    }
    func substatusStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.substatusStyle) { $0 = $0.merging(style) }
    }
    func bodyStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.bodyStyle) { $0 = $0.merging(style) }
    }
    func iconsStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.iconsStyle) { $0 = $0.merging(style) }
    }
    func actionTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.actionTitleStyle) { $0 = $0.merging(style) }
    }
    func seriesTitlesStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.seriesTitlesStyle) { $0 = $0.merging(style) }
    }
    func valueStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.valueStyle) { $0 = $0.merging(style) }
    }
    func valuesStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.valuesStyle) { $0 = $0.merging(style) }
    }
    func valueAxisTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.valueAxisTitleStyle) { $0 = $0.merging(style) }
    }
    func secondaryValuesAxisTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.secondaryValuesAxisTitleStyle) { $0 = $0.merging(style) }
    }
    func categoryAxisTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.categoryAxisTitleStyle) { $0 = $0.merging(style) }
    }
    func emptyTextStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.emptyTextStyle) { $0 = $0.merging(style) }
    }
    func kpiStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.kpiStyle) { $0 = $0.merging(style) }
    }
    func placeholderStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.placeholderStyle) { $0 = $0.merging(style) }
    }
    func tagsStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.tagsStyle) { $0 = $0.merging(style) }
    }
    func lowerBoundTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.lowerBoundTitleStyle) { $0 = $0.merging(style) }
    }
    func upperBoundTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.upperBoundTitleStyle) { $0 = $0.merging(style) }
    }
}
