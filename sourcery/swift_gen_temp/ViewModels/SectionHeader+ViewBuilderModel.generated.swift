// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct SectionHeader<Title: View, Attribute: View>: View {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.attributeModifier) private var attributeModifier
    @Environment(\.sectionHeaderStyle) var style: AnySectionHeaderStyle

    private let _title: () -> Title
	private let _attribute: () -> Attribute

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute
        ) {
            self._title = title
			self._attribute = attribute
    }

    public var body: some View {
        let configuration = SectionHeaderStyleConfiguration(
            title: _title().modifier(titleModifier).typeErased,
			attribute: _attribute().modifier(attributeModifier).typeErased
        )
        return style.makeBody(configuration: configuration)
    }   
}

extension SectionHeader where Title == Text,
		Attribute == _ConditionalContent<Text, EmptyView> {
    
    public init(model: SectionHeaderModel) {
        self.init(title: model.title, attribute: model.attribute)
    }

    public init(title: String, attribute: String? = nil) {
        self._title = { Text(title) }
		self._attribute = { attribute != nil ? ViewBuilder.buildEither(first: Text(attribute!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 

// MARK: - SectionHeaderStyle Protocol
public protocol SectionHeaderStyle {
    associatedtype Body : View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = SectionHeaderStyleConfiguration
}

public struct SectionHeaderStyleConfiguration {
    let title: AnyView
	let attribute: AnyView
}

// MARK: - SectionHeaderStyle Environment Utility
extension View {
    public func sectionHeaderStyle<S>(_ style: S) -> some View
        where S: SectionHeaderStyle {
            self.environment(\.sectionHeaderStyle, AnySectionHeaderStyle(style))
        }
}

// MARK: - Type Erased SectionHeaderStyle
public struct AnySectionHeaderStyle: SectionHeaderStyle {
    private let _makeBody: (Self.Configuration) -> AnyView

    init<Style: SectionHeaderStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }

    public func makeBody(configuration: Self.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}

extension SectionHeaderStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}

public struct FioriSectionHeaderStyle: SectionHeaderStyle {

    public func makeBody(configuration: Configuration) -> some View {
        SectionHeader  {
			configuration.title
		} attribute: {
			configuration.attribute
		}
        .modifier(FioriSectionHeaderLayoutRouter())
    }
}

// MARK: - SectionHeaderStyle Environment Key
extension EnvironmentValues {
    var sectionHeaderStyle: AnySectionHeaderStyle {
        get {
            return self[SectionHeaderStyleKey.self]
        }
        set {
            self[SectionHeaderStyleKey.self] = newValue
        }
    }
}

public struct SectionHeaderStyleKey: EnvironmentKey {
    public static let defaultValue: AnySectionHeaderStyle = AnySectionHeaderStyle(FioriSectionHeaderStyle())
}

// TODO: Extend SectionHeader to implement LayoutRouter, Layout, and Style in separate file
// place at FioriSwiftUICore/Views/TimelineItem+View.swift
/*
import SwiftUI

extension SectionHeaderLayoutRouter: ViewModifier {
    public var body: some View { 
        <# View body #> 
    }
}
*/
