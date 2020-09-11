// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

extension EnvironmentValues {
    public var titleStyle: TextStyle {
        get { return self[TitleStyleKey.self] }
        set { self[TitleStyleKey.self] = newValue }
    }

    public var titleModifier: AnyViewModifier {
        get { return self[TitleModifierKey.self] }
        set { self[TitleModifierKey.self] = newValue }
    }
    public var subtitleStyle: TextStyle {
        get { return self[SubtitleStyleKey.self] }
        set { self[SubtitleStyleKey.self] = newValue }
    }

    public var subtitleModifier: AnyViewModifier {
        get { return self[SubtitleModifierKey.self] }
        set { self[SubtitleModifierKey.self] = newValue }
    }
    public var footnoteStyle: TextStyle {
        get { return self[FootnoteStyleKey.self] }
        set { self[FootnoteStyleKey.self] = newValue }
    }

    public var footnoteModifier: AnyViewModifier {
        get { return self[FootnoteModifierKey.self] }
        set { self[FootnoteModifierKey.self] = newValue }
    }
    public var descriptionTextStyle: TextStyle {
        get { return self[DescriptionTextStyleKey.self] }
        set { self[DescriptionTextStyleKey.self] = newValue }
    }

    public var descriptionTextModifier: AnyViewModifier {
        get { return self[DescriptionTextModifierKey.self] }
        set { self[DescriptionTextModifierKey.self] = newValue }
    }
    public var detailImageStyle: ImageStyle {
        get { return self[DetailImageStyleKey.self] }
        set { self[DetailImageStyleKey.self] = newValue }
    }

    public var detailImageModifier: AnyViewModifier {
        get { return self[DetailImageModifierKey.self] }
        set { self[DetailImageModifierKey.self] = newValue }
    }
    public var attributeStyle: TextStyle {
        get { return self[AttributeStyleKey.self] }
        set { self[AttributeStyleKey.self] = newValue }
    }

    public var attributeModifier: AnyViewModifier {
        get { return self[AttributeModifierKey.self] }
        set { self[AttributeModifierKey.self] = newValue }
    }
    public var secondaryAttributeStyle: TextStyle {
        get { return self[SecondaryAttributeStyleKey.self] }
        set { self[SecondaryAttributeStyleKey.self] = newValue }
    }

    public var secondaryAttributeModifier: AnyViewModifier {
        get { return self[SecondaryAttributeModifierKey.self] }
        set { self[SecondaryAttributeModifierKey.self] = newValue }
    }
    public var timestampStyle: TextStyle {
        get { return self[TimestampStyleKey.self] }
        set { self[TimestampStyleKey.self] = newValue }
    }

    public var timestampModifier: AnyViewModifier {
        get { return self[TimestampModifierKey.self] }
        set { self[TimestampModifierKey.self] = newValue }
    }
    public var secondaryTimestampStyle: TextStyle {
        get { return self[SecondaryTimestampStyleKey.self] }
        set { self[SecondaryTimestampStyleKey.self] = newValue }
    }

    public var secondaryTimestampModifier: AnyViewModifier {
        get { return self[SecondaryTimestampModifierKey.self] }
        set { self[SecondaryTimestampModifierKey.self] = newValue }
    }
    public var trendStyle: TextStyle {
        get { return self[TrendStyleKey.self] }
        set { self[TrendStyleKey.self] = newValue }
    }

    public var trendModifier: AnyViewModifier {
        get { return self[TrendModifierKey.self] }
        set { self[TrendModifierKey.self] = newValue }
    }
    public var statusStyle: TextStyle {
        get { return self[StatusStyleKey.self] }
        set { self[StatusStyleKey.self] = newValue }
    }

    public var statusModifier: AnyViewModifier {
        get { return self[StatusModifierKey.self] }
        set { self[StatusModifierKey.self] = newValue }
    }
    public var substatusStyle: TextStyle {
        get { return self[SubstatusStyleKey.self] }
        set { self[SubstatusStyleKey.self] = newValue }
    }

    public var substatusModifier: AnyViewModifier {
        get { return self[SubstatusModifierKey.self] }
        set { self[SubstatusModifierKey.self] = newValue }
    }
    public var bodyStyle: TextStyle {
        get { return self[BodyStyleKey.self] }
        set { self[BodyStyleKey.self] = newValue }
    }

    public var bodyModifier: AnyViewModifier {
        get { return self[BodyModifierKey.self] }
        set { self[BodyModifierKey.self] = newValue }
    }
    public var iconsStyle: TextStyle {
        get { return self[IconsStyleKey.self] }
        set { self[IconsStyleKey.self] = newValue }
    }

    public var iconsModifier: AnyViewModifier {
        get { return self[IconsModifierKey.self] }
        set { self[IconsModifierKey.self] = newValue }
    }
    public var actionTitleStyle: TextStyle {
        get { return self[ActionTitleStyleKey.self] }
        set { self[ActionTitleStyleKey.self] = newValue }
    }

    public var actionTitleModifier: AnyViewModifier {
        get { return self[ActionTitleModifierKey.self] }
        set { self[ActionTitleModifierKey.self] = newValue }
    }
    public var seriesTitlesStyle: TextStyle {
        get { return self[SeriesTitlesStyleKey.self] }
        set { self[SeriesTitlesStyleKey.self] = newValue }
    }

    public var seriesTitlesModifier: AnyViewModifier {
        get { return self[SeriesTitlesModifierKey.self] }
        set { self[SeriesTitlesModifierKey.self] = newValue }
    }
    public var valueStyle: TextStyle {
        get { return self[ValueStyleKey.self] }
        set { self[ValueStyleKey.self] = newValue }
    }

    public var valueModifier: AnyViewModifier {
        get { return self[ValueModifierKey.self] }
        set { self[ValueModifierKey.self] = newValue }
    }
    public var valuesStyle: TextStyle {
        get { return self[ValuesStyleKey.self] }
        set { self[ValuesStyleKey.self] = newValue }
    }

    public var valuesModifier: AnyViewModifier {
        get { return self[ValuesModifierKey.self] }
        set { self[ValuesModifierKey.self] = newValue }
    }
    public var valueAxisTitleStyle: TextStyle {
        get { return self[ValueAxisTitleStyleKey.self] }
        set { self[ValueAxisTitleStyleKey.self] = newValue }
    }

    public var valueAxisTitleModifier: AnyViewModifier {
        get { return self[ValueAxisTitleModifierKey.self] }
        set { self[ValueAxisTitleModifierKey.self] = newValue }
    }
    public var secondaryValuesAxisTitleStyle: TextStyle {
        get { return self[SecondaryValuesAxisTitleStyleKey.self] }
        set { self[SecondaryValuesAxisTitleStyleKey.self] = newValue }
    }

    public var secondaryValuesAxisTitleModifier: AnyViewModifier {
        get { return self[SecondaryValuesAxisTitleModifierKey.self] }
        set { self[SecondaryValuesAxisTitleModifierKey.self] = newValue }
    }
    public var categoryAxisTitleStyle: TextStyle {
        get { return self[CategoryAxisTitleStyleKey.self] }
        set { self[CategoryAxisTitleStyleKey.self] = newValue }
    }

    public var categoryAxisTitleModifier: AnyViewModifier {
        get { return self[CategoryAxisTitleModifierKey.self] }
        set { self[CategoryAxisTitleModifierKey.self] = newValue }
    }
    public var emptyTextStyle: TextStyle {
        get { return self[EmptyTextStyleKey.self] }
        set { self[EmptyTextStyleKey.self] = newValue }
    }

    public var emptyTextModifier: AnyViewModifier {
        get { return self[EmptyTextModifierKey.self] }
        set { self[EmptyTextModifierKey.self] = newValue }
    }
    public var kpiStyle: TextStyle {
        get { return self[KpiStyleKey.self] }
        set { self[KpiStyleKey.self] = newValue }
    }

    public var kpiModifier: AnyViewModifier {
        get { return self[KpiModifierKey.self] }
        set { self[KpiModifierKey.self] = newValue }
    }
    public var placeholderStyle: TextStyle {
        get { return self[PlaceholderStyleKey.self] }
        set { self[PlaceholderStyleKey.self] = newValue }
    }

    public var placeholderModifier: AnyViewModifier {
        get { return self[PlaceholderModifierKey.self] }
        set { self[PlaceholderModifierKey.self] = newValue }
    }
    public var tagsStyle: TextStyle {
        get { return self[TagsStyleKey.self] }
        set { self[TagsStyleKey.self] = newValue }
    }

    public var tagsModifier: AnyViewModifier {
        get { return self[TagsModifierKey.self] }
        set { self[TagsModifierKey.self] = newValue }
    }
    public var lowerBoundTitleStyle: TextStyle {
        get { return self[LowerBoundTitleStyleKey.self] }
        set { self[LowerBoundTitleStyleKey.self] = newValue }
    }

    public var lowerBoundTitleModifier: AnyViewModifier {
        get { return self[LowerBoundTitleModifierKey.self] }
        set { self[LowerBoundTitleModifierKey.self] = newValue }
    }
    public var upperBoundTitleStyle: TextStyle {
        get { return self[UpperBoundTitleStyleKey.self] }
        set { self[UpperBoundTitleStyleKey.self] = newValue }
    }

    public var upperBoundTitleModifier: AnyViewModifier {
        get { return self[UpperBoundTitleModifierKey.self] }
        set { self[UpperBoundTitleModifierKey.self] = newValue }
    }
}

public extension View {

    func titleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.titleStyle) { $0 = $0.merging(style) }
    }

    func titleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.titleModifier, AnyViewModifier(transform: transform))
    }

    func subtitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.subtitleStyle) { $0 = $0.merging(style) }
    }

    func subtitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.subtitleModifier, AnyViewModifier(transform: transform))
    }

    func footnoteStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.footnoteStyle) { $0 = $0.merging(style) }
    }

    func footnoteModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.footnoteModifier, AnyViewModifier(transform: transform))
    }

    func descriptionTextStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.descriptionTextStyle) { $0 = $0.merging(style) }
    }

    func descriptionTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.descriptionTextModifier, AnyViewModifier(transform: transform))
    }

    func detailImageStyle(_ style: ImageStyle) -> some View {
        return transformEnvironment(\.detailImageStyle) { $0 = $0.merging(style) }
    }

    func detailImageModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.detailImageModifier, AnyViewModifier(transform: transform))
    }

    func attributeStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.attributeStyle) { $0 = $0.merging(style) }
    }

    func attributeModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.attributeModifier, AnyViewModifier(transform: transform))
    }

    func secondaryAttributeStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.secondaryAttributeStyle) { $0 = $0.merging(style) }
    }

    func secondaryAttributeModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.secondaryAttributeModifier, AnyViewModifier(transform: transform))
    }

    func timestampStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.timestampStyle) { $0 = $0.merging(style) }
    }

    func timestampModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.timestampModifier, AnyViewModifier(transform: transform))
    }

    func secondaryTimestampStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.secondaryTimestampStyle) { $0 = $0.merging(style) }
    }

    func secondaryTimestampModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.secondaryTimestampModifier, AnyViewModifier(transform: transform))
    }

    func trendStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.trendStyle) { $0 = $0.merging(style) }
    }

    func trendModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.trendModifier, AnyViewModifier(transform: transform))
    }

    func statusStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.statusStyle) { $0 = $0.merging(style) }
    }

    func statusModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.statusModifier, AnyViewModifier(transform: transform))
    }

    func substatusStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.substatusStyle) { $0 = $0.merging(style) }
    }

    func substatusModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.substatusModifier, AnyViewModifier(transform: transform))
    }

    func bodyStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.bodyStyle) { $0 = $0.merging(style) }
    }

    func bodyModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.bodyModifier, AnyViewModifier(transform: transform))
    }

    func iconsStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.iconsStyle) { $0 = $0.merging(style) }
    }

    func iconsModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.iconsModifier, AnyViewModifier(transform: transform))
    }

    func actionTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.actionTitleStyle) { $0 = $0.merging(style) }
    }

    func actionTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.actionTitleModifier, AnyViewModifier(transform: transform))
    }

    func seriesTitlesStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.seriesTitlesStyle) { $0 = $0.merging(style) }
    }

    func seriesTitlesModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.seriesTitlesModifier, AnyViewModifier(transform: transform))
    }

    func valueStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.valueStyle) { $0 = $0.merging(style) }
    }

    func valueModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.valueModifier, AnyViewModifier(transform: transform))
    }

    func valuesStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.valuesStyle) { $0 = $0.merging(style) }
    }

    func valuesModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.valuesModifier, AnyViewModifier(transform: transform))
    }

    func valueAxisTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.valueAxisTitleStyle) { $0 = $0.merging(style) }
    }

    func valueAxisTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.valueAxisTitleModifier, AnyViewModifier(transform: transform))
    }

    func secondaryValuesAxisTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.secondaryValuesAxisTitleStyle) { $0 = $0.merging(style) }
    }

    func secondaryValuesAxisTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.secondaryValuesAxisTitleModifier, AnyViewModifier(transform: transform))
    }

    func categoryAxisTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.categoryAxisTitleStyle) { $0 = $0.merging(style) }
    }

    func categoryAxisTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.categoryAxisTitleModifier, AnyViewModifier(transform: transform))
    }

    func emptyTextStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.emptyTextStyle) { $0 = $0.merging(style) }
    }

    func emptyTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.emptyTextModifier, AnyViewModifier(transform: transform))
    }

    func kpiStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.kpiStyle) { $0 = $0.merging(style) }
    }

    func kpiModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.kpiModifier, AnyViewModifier(transform: transform))
    }

    func placeholderStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.placeholderStyle) { $0 = $0.merging(style) }
    }

    func placeholderModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.placeholderModifier, AnyViewModifier(transform: transform))
    }

    func tagsStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.tagsStyle) { $0 = $0.merging(style) }
    }

    func tagsModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.tagsModifier, AnyViewModifier(transform: transform))
    }

    func lowerBoundTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.lowerBoundTitleStyle) { $0 = $0.merging(style) }
    }

    func lowerBoundTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.lowerBoundTitleModifier, AnyViewModifier(transform: transform))
    }

    func upperBoundTitleStyle(_ style: TextStyle) -> some View {
        return transformEnvironment(\.upperBoundTitleStyle) { $0 = $0.merging(style) }
    }

    func upperBoundTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.upperBoundTitleModifier, AnyViewModifier(transform: transform))
    }
}
