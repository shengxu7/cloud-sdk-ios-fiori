// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct SectionHeader<Title: View, Attribute: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.attributeModifier) private var attributeModifier
    @Environment(\.colorScheme) var colorScheme
    
    private let _title: () -> Title
	private let _attribute: () -> Attribute

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute
        ) {
            self._title = title
			self._attribute = attribute
    }

    @ViewBuilder var title: some View {
		_title().modifier(Fiori.SectionHeader.title.concat(titleModifier))
	}
	@ViewBuilder var attribute: some View {
		_attribute().modifier(Fiori.SectionHeader.attribute.concat(attributeModifier))
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
