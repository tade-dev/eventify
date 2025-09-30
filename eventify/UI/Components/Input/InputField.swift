//
//  InputField.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text: String
    var hintText: String = "Enter value"
    var hintFont: Font = .openSansRegular(size: 16)
    var hintColor: Color = .colors.neutral6
    var isPasword: Bool = false
    @FocusState private var isFocused: Bool
    var keyboardType: UIKeyboardType = .default
    var onSubmit: () -> Void = { }
    var enabled: Bool = true
    var borderColor: Color? = nil
    var isFilled: Bool = false
    var fillColor: Color = .clear
    var prefixIcon: Image? = nil
    var borderRadius: CGFloat = 4
    
    var body: some View {

        HStack {
            
            if let prefixIcon {
                prefixIcon
            }
            
            Group(content: {
                if(isPasword) {
                    SecureField("", text: $text)
                }else {
                    TextField("", text: $text)
                }
            })
            .focused($isFocused)
            .font(.openSansRegular(size: 16))
            .foregroundStyle(.textBlack)
            .autocorrectionDisabled()
            .textCase(.lowercase)
            .textInputAutocapitalization(.never)
            .keyboardType(keyboardType)
            .onSubmit {
                onSubmit()
            }
            .disabled(!enabled)
            .padding(.vertical, 15)
            .overlay(alignment: .leading) {
                if(!isFocused && text.isEmpty){
                    Text(hintText)
                        .foregroundStyle(hintColor)
                        .font(hintFont)
                }
            }
            
            if isPasword {
                Image("visibility_off")
            }
        }
        .padding(.horizontal, 15)
        .background(
            isFilled ? fillColor : Color.clear
        )
        .overlay(
            RoundedRectangle(cornerRadius: borderRadius)
                .stroke(borderColor != nil ? borderColor! : (isFocused ? .accent : .neutral4))
        )
        
    }
}

#Preview {
    InputField(
        text: .constant("")
    )
}
