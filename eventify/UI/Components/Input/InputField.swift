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
    var isPasword: Bool = false
    @FocusState var isFocused: Bool
    var keyboardType: UIKeyboardType = .default
    var onSubmit: () -> Void = { }
    var enabled: Bool = true
    
    var body: some View {

        ZStack(alignment: .leading, content: {
            HStack {
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
                
                if isPasword {
                    Image("visibility_off")
                }
            }
            
            if(!isFocused && text.isEmpty){
                Text(hintText)
                    .foregroundStyle(.neutral6)
                    .font(.openSansRegular(size: 16))
            }
        })
        .padding(.horizontal, 15)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(isFocused ? .accent : .neutral4)
        )
        
    }
}

#Preview {
    InputField(
        text: .constant("")
    )
}
