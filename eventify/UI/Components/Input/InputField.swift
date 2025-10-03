//
//  InputField.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text: String
    
    // MARK: - Configurable Properties
    var hintText: String = "Enter value"
    var hintFont: Font = .openSansRegular(size: 16)
    var hintColor: Color = .colors.neutral6
    var isPassword: Bool = false
    @FocusState private var isFocused: Bool
    var keyboardType: UIKeyboardType = .default
    var onSubmit: () -> Void = { }
    var enabled: Bool = true
    var borderColor: Color? = nil
    var isFilled: Bool = false
    var fillColor: Color = .clear
    var prefixIcon: Image? = nil
    var borderRadius: CGFloat = 4
    var height: CGFloat? = nil   // Optional height
    
    // MARK: - Body
    var body: some View {
        HStack {
            
            if let prefixIcon {
                prefixIcon
            }
            
            Group {
                if isPassword {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
            .focused($isFocused)
            .font(.openSansRegular(size: 16))
            .foregroundStyle(.textBlack)
            .autocorrectionDisabled()
            .textCase(.lowercase)
            .textInputAutocapitalization(.never)
            .keyboardType(keyboardType)
            .onSubmit { onSubmit() }
            .disabled(!enabled)
            .overlay(alignment: .leading) {
                if !isFocused && text.isEmpty {
                    Text(hintText)
                        .foregroundStyle(hintColor)
                        .font(hintFont)
                }
            }
            
            if isPassword {
                Image("visibility_off")
            }
        }
        .padding(.horizontal, 15)
        .frame(height: height) // ✅ Apply optional height
        .background(isFilled ? fillColor : Color.clear)
        .cornerRadius(borderRadius)
        .overlay(
            RoundedRectangle(cornerRadius: borderRadius)
                .stroke(borderColor ?? (isFocused ? .accent : .neutral4))
        )
    }
}

#Preview {
    VStack(spacing: 20) {
        InputField(text: .constant(""), hintText: "Default Height")
        InputField(text: .constant(""), hintText: "Custom Height 60", height: 60)
    }
    .padding()
}
