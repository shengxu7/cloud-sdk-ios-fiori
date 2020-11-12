// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// TODO: - Extend ObjectHeader to implement LayoutRouter, Layout, and Style in separate file
// Place at FioriSwiftUICore/Views/StyleImplementations/ObjectHeader+StyleImpl.swift

// TODO: - Uncomment and implement Fiori style definitions

/*
extension Fiori {
    enum ObjectHeader {
        typealias Title = EmptyModifier
		typealias Subtitle = EmptyModifier
		typealias Footnote = EmptyModifier
		typealias DescriptionText = EmptyModifier
		typealias Status = EmptyModifier
		typealias Substatus = EmptyModifier
		typealias DetailImage = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
            // replace `typealias Subtitle = EmptyModifier` with: 

            struct Subtitle: ViewModifier {
                func body(content: Content) -> some View {
                    content
                        .font(.body)
                        .foregroundColor(.preferredColor(.primary3))
                }
            }
        */
        static let title = Title()
		static let subtitle = Subtitle()
		static let footnote = Footnote()
		static let descriptionText = DescriptionText()
		static let status = Status()
		static let substatus = Substatus()
		static let detailImage = DetailImage()
    }
}
*/

/*
// TODO: - Uncomment if View has consistent layout, regardless of context, e.g. `horizontalSizeClass`, etc.

/// For single-layout components, this is where the `View.Body` should be implemented
public struct FioriObjectHeaderStyle : ObjectHeaderStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.status
			configuration.substatus
			configuration.detailImage
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
*/
/*
// TODO: - Uncomment if View has multiple layouts, depending upon context

/// A pass-through `View.Body` implementation, which applies the `*LayoutRouter` `ViewModifier`
public struct FioriObjectHeaderStyle: ObjectHeaderStyle {
    public func makeBody(configuration: Configuration) -> some View {
        ObjectHeader  {
			configuration.title
		} subtitle: {
			configuration.subtitle
		} footnote: {
			configuration.footnote
		} descriptionText: {
			configuration.descriptionText
		} status: {
			configuration.status
		} substatus: {
			configuration.substatus
		} detailImage: {
			configuration.detailImage
		}
        .modifier(FioriObjectHeaderLayoutRouter())
    }
}

/// Example layout router, which selects the correct `Style` based on `horizontalSizeClass`
/// May be modified, replaced, or chained.
public struct FioriObjectHeaderLayoutRouter: ViewModifier {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @ViewBuilder
    public func body(content: Content) -> some View {
        if horizontalSizeClass == .some(.compact) {
            content.objectHeaderStyle(FioriObjectHeaderStyle.CompactLayout())
        } else {
            content.objectHeaderStyle(FioriObjectHeaderStyle.RegularLayout())
        }
    }
}

extension FioriObjectHeaderStyle {
    public struct CompactLayout: ObjectHeaderStyle {
        public func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.status
			configuration.substatus
			configuration.detailImage
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }

    public struct RegularLayout: ObjectHeaderStyle {
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
			configuration.subtitle
			configuration.footnote
			configuration.descriptionText
			configuration.status
			configuration.substatus
			configuration.detailImage
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding([.top, .bottom], 8)
        }
    }
}
*/
/*
// TODO: - Creating Application-specific Style, while leveraging Fiori Layouts

/// Example Custom Style implementation, using pass-through technique from above.  
/// Developer may pass the `AnyView` from the `Configuration` directly through, 
/// contain it in a super-structure, or replace it entirely.
/// Invoking the `*LayoutRouter` `ViewModifier` causes the standard body implementation
/// to attempt to layout the supplied view.
public struct AcmeObjectHeaderStyle: ObjectHeaderStyle {
    
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        ObjectHeader  {
            VStack {
                configuration.title
                AcmeTitleView()
            }
        } subtitle: {
            VStack {
                configuration.subtitle
                AcmeSubtitleView()
            }
        } footnote: {
            VStack {
                configuration.footnote
                AcmeFootnoteView()
            }
        } descriptionText: {
            VStack {
                configuration.descriptionText
                AcmeDescriptionTextView()
            }
        } status: {
            VStack {
                configuration.status
                AcmeStatusView()
            }
        } substatus: {
            VStack {
                configuration.substatus
                AcmeSubstatusView()
            }
        } detailImage: {
            VStack {
                configuration.detailImage
                AcmeDetailImageView()
            }
        }
        .modifier(FioriKeyValueItemSizeClassModifier())
    }
}
*/
