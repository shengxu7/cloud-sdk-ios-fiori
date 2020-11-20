// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct TimelineItem<Title: View, Subtitle: View, Footnote: View, Attribute: View, SecondaryAttribute: View, Timestamp: View, SecondaryTimestamp: View, Status: View, Substatus: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.attributeModifier) private var attributeModifier
	@Environment(\.secondaryAttributeModifier) private var secondaryAttributeModifier
	@Environment(\.timestampModifier) private var timestampModifier
	@Environment(\.secondaryTimestampModifier) private var secondaryTimestampModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.substatusModifier) private var substatusModifier
    
    
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

    @ViewBuilder var title: some View {
		_title().modifier(Fiori.TimelineItem.title.concat(titleModifier))
	}
	@ViewBuilder var subtitle: some View {
		_subtitle().modifier(Fiori.TimelineItem.subtitle.concat(subtitleModifier))
	}
	@ViewBuilder var footnote: some View {
		_footnote().modifier(Fiori.TimelineItem.footnote.concat(footnoteModifier))
	}
	@ViewBuilder var attribute: some View {
		_attribute().modifier(Fiori.TimelineItem.attribute.concat(attributeModifier))
	}
	@ViewBuilder var secondaryAttribute: some View {
		_secondaryAttribute().modifier(Fiori.TimelineItem.secondaryAttribute.concat(secondaryAttributeModifier))
	}
	@ViewBuilder var timestamp: some View {
		_timestamp().modifier(Fiori.TimelineItem.timestamp.concat(timestampModifier))
	}
	@ViewBuilder var secondaryTimestamp: some View {
		_secondaryTimestamp().modifier(Fiori.TimelineItem.secondaryTimestamp.concat(secondaryTimestampModifier))
	}
	@ViewBuilder var status: some View {
		_status().modifier(Fiori.TimelineItem.status.concat(statusModifier))
	}
	@ViewBuilder var substatus: some View {
		_substatus().modifier(Fiori.TimelineItem.substatus.concat(substatusModifier))
	}
}

extension TimelineItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		Attribute == _ConditionalContent<Text, EmptyView>,
		SecondaryAttribute == _ConditionalContent<Text, EmptyView>,
		Timestamp == _ConditionalContent<Text, EmptyView>,
		SecondaryTimestamp == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView>,
		Substatus == _ConditionalContent<Text, EmptyView> {
    
    public init(model: TimelineItemModel) {
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
