// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct TimelineItem<Title: View, Timestamp: View, Status: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.timestampModifier) private var timestampModifier
	@Environment(\.statusModifier) private var statusModifier
    @Environment(\.timelineItemStyle) var style: AnyTimelineItemStyle

    private let _title: () -> Title
	private let _timestamp: () -> Timestamp
	private let _status: () -> Status

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
            self._title = title
			self._timestamp = timestamp
			self._status = status
    }

    public var body: some View {
        let configuration = TimelineItemStyleConfiguration(
            title: _title().modifier(Fiori.TimelineItem.title.concat(titleModifier)).typeErased,
			timestamp: _timestamp().modifier(Fiori.TimelineItem.timestamp.concat(timestampModifier)).typeErased,
			status: _status().modifier(Fiori.TimelineItem.status.concat(statusModifier)).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension TimelineItem where Title == Text,
		Timestamp == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView> {
    
    public init(model: TimelineItemModel) {
        self.init(title: model.title, timestamp: model.timestamp, status: model.status)
    }

    public init(title: String, timestamp: String? = nil, status: String? = nil) {
        self._title = { Text(title) }
		self._timestamp = { timestamp != nil ? ViewBuilder.buildEither(first: Text(timestamp!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._status = { status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - TimelineItemStyle Protocol
public protocol TimelineItemStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = TimelineItemStyleConfiguration
}

public struct TimelineItemStyleConfiguration {
    let title: AnyView
	let timestamp: AnyView
	let status: AnyView
}

// MARK: - TimelineItemStyle Environment Utility
extension View {
    public func timelineItemStyle<S>(_ style: S) -> some View
        where S: TimelineItemStyle {
            self.environment(\.timelineItemStyle, AnyTimelineItemStyle(style))
        }
}

// MARK: - Type Erased TimelineItemStyle
public struct AnyTimelineItemStyle: TimelineItemStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: TimelineItemStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension TimelineItemStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

// MARK: - TimelineItemStyle Environment Key
extension EnvironmentValues {
    var timelineItemStyle: AnyTimelineItemStyle {
        get { return self[TimelineItemStyleKey.self]  }
        set { self[TimelineItemStyleKey.self] = newValue }
    }
}

public struct TimelineItemStyleKey: EnvironmentKey {
    public static let defaultValue: AnyTimelineItemStyle = AnyTimelineItemStyle(FioriTimelineItemStyle())
}
