/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum TextInput {
        typealias TextFilled = EmptyModifier
        static let textFilled = TextFilled()
    }
}

extension TextInput: View {
    public var body: some View {
        if #available(iOS 14.0, *) {
            TextField("Default", text: self._textFilled ?? .constant("default"))
                .modifier(TextFieldClearButton(textValue: self._textFilled ?? .constant("default")))
                .textFieldStyle(BottomTextFieldStyle())
        } else {
            TextField("Default", text: self._textFilled ?? .constant("default"))
                .modifier(TextFieldClearButton(textValue: self._textFilled ?? .constant("default")))
                .padding(.top, 8)
        }
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var textValue: String
    func body(content: Content) -> some View {
        HStack {
            content
            if !textValue.isEmpty {
                Button(
                    action: { self.textValue = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.black))
                    }
                )
            }
            Spacer()
        }
    }
}

@available(iOS 14.0, *)
struct BottomTextFieldStyle: TextFieldStyle {
    let color1 = Color.preferredColor(.primary1).opacity(0)
    let color2 = Color.preferredColor(.primary1).opacity(0.15)
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [color1, color2, color1]), startPoint: .leading, endPoint: .topTrailing))
                .frame(height: 1, alignment: .bottom)
        }
    }
}