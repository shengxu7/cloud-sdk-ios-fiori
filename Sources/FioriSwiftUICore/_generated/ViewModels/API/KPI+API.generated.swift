// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct KPI<Title: View, Icon: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.iconModifier) private var iconModifier
    
    
    private let _title: () -> Title
	private let _icon: () -> Icon

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder icon: @escaping () -> Icon
        ) {
            self._title = title
			self._icon = icon
    }

    @ViewBuilder var title: some View {
		_title().modifier(Fiori.KPI.title.concat(titleModifier))
	}
	@ViewBuilder var icon: some View {
		_icon().modifier(Fiori.KPI.icon.concat(iconModifier))
	}
}

extension KPI where Title == Text,
		Icon == _ConditionalContent<Image, EmptyView> {
    
    public init(model: KPIModel) {
        self.init(title: model.title, icon: model.icon)
    }

    public init(title: String, icon: Image? = nil) {
        self._title = { Text(title) }
		self._icon = { icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 
