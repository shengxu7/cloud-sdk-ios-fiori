// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct TimelineExtendedItem<Title: View, Subtitle: View, Footnote: View, Attribute: View, SecondaryAttribute: View, Timestamp: View, SecondaryTimestamp: View, Status: View, Substatus: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.attributeModifier) private var attributeModifier
	@Environment(\.secondaryAttributeModifier) private var secondaryAttributeModifier
	@Environment(\.timestampModifier) private var timestampModifier
	@Environment(\.secondaryTimestampModifier) private var secondaryTimestampModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.substatusModifier) private var substatusModifier
    @Environment(\.timelineExtendedItemStyle) var style: AnyTimelineExtendedItemStyle

    private let _title: () -> Title
	private let _subtitle: () -> Subtitle
	private let _footnote: () -> Footnote
	private let _attribute: () -> Attribute
	private let _secondaryAttribute: () -> SecondaryAttribute
	private let _timestamp: () -> Timestamp
	private let _secondaryTimestamp: () -> SecondaryTimestamp
	private let _status: () -> Status
	private let _substatus: () -> Substatus

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
            self._title = title
			self._subtitle = subtitle
			self._footnote = footnote
			self._attribute = attribute
			self._secondaryAttribute = secondaryAttribute
			self._timestamp = timestamp
			self._secondaryTimestamp = secondaryTimestamp
			self._status = status
			self._substatus = substatus
    }

    public var body: some View {
        let configuration = TimelineExtendedItemStyleConfiguration(
            title: _title().modifier(titleModifier).typeErased,
			subtitle: _subtitle().modifier(subtitleModifier).typeErased,
			footnote: _footnote().modifier(footnoteModifier).typeErased,
			attribute: _attribute().modifier(attributeModifier).typeErased,
			secondaryAttribute: _secondaryAttribute().modifier(secondaryAttributeModifier).typeErased,
			timestamp: _timestamp().modifier(timestampModifier).typeErased,
			secondaryTimestamp: _secondaryTimestamp().modifier(secondaryTimestampModifier).typeErased,
			status: _status().modifier(statusModifier).typeErased,
			substatus: _substatus().modifier(substatusModifier).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension TimelineExtendedItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		Attribute == _ConditionalContent<Text, EmptyView>,
		SecondaryAttribute == _ConditionalContent<Text, EmptyView>,
		Timestamp == _ConditionalContent<Text, EmptyView>,
		SecondaryTimestamp == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView>,
		Substatus == _ConditionalContent<Text, EmptyView> {
    
    public init(model: TimelineExtendedItemModel) {
        self.init(title: model.title, subtitle: model.subtitle, footnote: model.footnote, attribute: model.attribute, secondaryAttribute: model.secondaryAttribute, timestamp: model.timestamp, secondaryTimestamp: model.secondaryTimestamp, status: model.status, substatus: model.substatus)
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, attribute: String? = nil, secondaryAttribute: String? = nil, timestamp: String? = nil, secondaryTimestamp: String? = nil, status: String? = nil, substatus: String? = nil) {
        self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._footnote = { footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._attribute = { attribute != nil ? ViewBuilder.buildEither(first: Text(attribute!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._secondaryAttribute = { secondaryAttribute != nil ? ViewBuilder.buildEither(first: Text(secondaryAttribute!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._timestamp = { timestamp != nil ? ViewBuilder.buildEither(first: Text(timestamp!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._secondaryTimestamp = { secondaryTimestamp != nil ? ViewBuilder.buildEither(first: Text(secondaryTimestamp!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._status = { status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._substatus = { substatus != nil ? ViewBuilder.buildEither(first: Text(substatus!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - TimelineExtendedItemStyle Protocol
public protocol TimelineExtendedItemStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = TimelineExtendedItemStyleConfiguration
}

public struct TimelineExtendedItemStyleConfiguration {
    let title: AnyView
	let subtitle: AnyView
	let footnote: AnyView
	let attribute: AnyView
	let secondaryAttribute: AnyView
	let timestamp: AnyView
	let secondaryTimestamp: AnyView
	let status: AnyView
	let substatus: AnyView
}

// MARK: - TimelineExtendedItemStyle Environment Utility
extension View {
    public func timelineExtendedItemStyle<S>(_ style: S) -> some View
        where S: TimelineExtendedItemStyle {
            self.environment(\.timelineExtendedItemStyle, AnyTimelineExtendedItemStyle(style))
        }
}

// MARK: - Type Erased TimelineExtendedItemStyle
public struct AnyTimelineExtendedItemStyle: TimelineExtendedItemStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: TimelineExtendedItemStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension TimelineExtendedItemStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

public struct FioriTimelineExtendedItemStyle: TimelineExtendedItemStyle {

    public func makeBody(configuration: Configuration) -> some View {
        TimelineExtendedItem  {
			configuration.title
		} subtitle: {
			configuration.subtitle
		} footnote: {
			configuration.footnote
		} attribute: {
			configuration.attribute
		} secondaryAttribute: {
			configuration.secondaryAttribute
		} timestamp: {
			configuration.timestamp
		} secondaryTimestamp: {
			configuration.secondaryTimestamp
		} status: {
			configuration.status
		} substatus: {
			configuration.substatus
		}
        .modifier(FioriTimelineExtendedItemLayoutRouter())
    }
}

// MARK: - TimelineExtendedItemStyle Environment Key
extension EnvironmentValues {
    var timelineExtendedItemStyle: AnyTimelineExtendedItemStyle {
        get {
            return self[TimelineExtendedItemStyleKey.self]
        }
        set {
            self[TimelineExtendedItemStyleKey.self] = newValue
        }
    }
}

public struct TimelineExtendedItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyTimelineExtendedItemStyle = AnyTimelineExtendedItemStyle(FioriTimelineExtendedItemStyle())
}

// TODO: Extend TimelineExtendedItem to implement LayoutRouter, Layout, and Style in separate file
// place at FioriSwiftUICore/Views/TimelineItem+View.swift
/*
import SwiftUI

extension TimelineExtendedItemLayoutRouter: ViewModifier {
    public var body: some View { 
        <# View body #> 
    }
}
*/
