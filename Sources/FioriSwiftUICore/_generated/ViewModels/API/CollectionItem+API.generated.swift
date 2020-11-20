// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct CollectionItem<DetailImage: View, Title: View, Subtitle: View> {
    @Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
    
    
    private let _detailImage: () -> DetailImage
	private let _title: () -> Title
	private let _subtitle: () -> Subtitle

    public init(
        @ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
            self._detailImage = detailImage
			self._title = title
			self._subtitle = subtitle
    }

    @ViewBuilder var detailImage: some View {
		_detailImage().modifier(Fiori.CollectionItem.detailImage.concat(detailImageModifier))
	}
	@ViewBuilder var title: some View {
		_title().modifier(Fiori.CollectionItem.title.concat(titleModifier))
	}
	@ViewBuilder var subtitle: some View {
		_subtitle().modifier(Fiori.CollectionItem.subtitle.concat(subtitleModifier))
	}
}

extension CollectionItem where DetailImage == _ConditionalContent<Image, EmptyView>,
		Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView> {
    
    public init(model: CollectionItemModel) {
        self.init(detailImage: model.detailImage, title: model.title, subtitle: model.subtitle)
    }

    public init(detailImage: Image? = nil, title: String, subtitle: String? = nil) {
        self._detailImage = { detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView()) }
		self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 
