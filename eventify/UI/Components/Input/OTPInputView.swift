//
//  OTPInputView.swift
//  eventify
//
//  Created by BSTAR on 29/09/2025.
//


import SwiftUI

struct OTPInputView: View {
    // MARK: - Bindings & Config
    @Binding var code: String
    let length: Int
    var secure: Bool = false
    var placeholder: String = ""
    var onCommit: ((String) -> Void)? = nil
    
    // MARK: - Customization
    var boxSize: CGSize = CGSize(width: 48, height: 56)
    var boxSpacing: CGFloat = 12
    var boxCornerRadius: CGFloat = 8
    var boxStrokeWidth: CGFloat = 1.5
    
    var font: Font = .openSansSemiBold(size: 18)
    var secureDotSize: CGFloat = 12
    var activeColor: Color = .accentColor
    var filledColor: Color = .primary
    var emptyColor: Color = Color(UIColor.separator)
    var boxBackgroundColor: Color = .accent1
    
    var keyboardType: UIKeyboardType = .numberPad
    var autoFocus: Bool = true
    
    // MARK: - Internal State
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            // Hidden TextField (actually handles input)
            TextField(placeholder, text: Binding(
                get: { self.code },
                set: { newValue in
                    // keep only numbers and limit length
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered.count <= length {
                        self.code = filtered
                        if filtered.count == length {
                            DispatchQueue.main.async {
                                onCommit?(filtered)
                            }
                        }
                    } else {
                        self.code = String(filtered.prefix(length))
                    }
                })
            )
            .keyboardType(keyboardType)
            .textContentType(.oneTimeCode)
            .opacity(0.01) // invisible
            .focused($isFocused)
            .onAppear {
                if autoFocus {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isFocused = true
                    }
                }
            }
            
            // Visible OTP boxes
            HStack {
                ForEach(0..<length, id: \.self) { idx in
                    box(for: idx)
                        .onTapGesture { isFocused = true }
                    
                    if idx != length - 1 { // add Spacer after every box except last
                        Spacer()
                    }
                }
            }
        }
    }
    
    // MARK: - Box rendering
    @ViewBuilder
    private func box(for index: Int) -> some View {
        let char: String = {
            if index < code.count {
                let stringIndex = code.index(code.startIndex, offsetBy: index)
                return String(code[stringIndex])
            } else {
                return ""
            }
        }()
        
        ZStack {
            RoundedRectangle(cornerRadius: boxCornerRadius)
                .fill(
                    char.isEmpty
                    ? (isFocused && index == code.count ? Color.clear : Color.clear)
                        : boxBackgroundColor
                )
                .frame(width: boxSize.width, height: boxSize.height)
                .overlay(
                    RoundedRectangle(cornerRadius: boxCornerRadius)
                        .stroke(borderColor(for: index), lineWidth: boxStrokeWidth)
                )
            
            if char.isEmpty {
                if isFocused && index == code.count {
                    // caret indicator
                    Text("_")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.accentColor)
                }
            } else {
                if secure {
                    Circle()
                        .frame(width: secureDotSize, height: secureDotSize)
                        .foregroundColor(filledColor)
                } else {
                    Text(char)
                        .font(font)
                        .foregroundColor(filledColor)
                }
            }
        }
    }
    
    private func borderColor(for index: Int) -> Color {
        if isFocused && index == code.count { return activeColor }
        if index < code.count { return filledColor }
        return emptyColor
    }
}
