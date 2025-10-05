//
//  PrimaryButton.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var color: Color
    var onPressed: ()-> ()
    var isDisabled: Bool = false
    var height: CGFloat = 50
    var width: CGFloat? = nil
    var hasWidth: Bool = true
    var padding: CGFloat?
    var fontSize: CGFloat = 16
    var textColor: Color = .white
    var icon: AnyView?
    
    var body: some View {
        Button(action: onPressed) {
            HStack {
                
                if icon != nil {
                    icon
                }
                
                Text(text)
            }
            .font(.openSans(.semiBold, size: fontSize))
            .foregroundColor(textColor)
            .padding(.horizontal, padding ?? 0)
            .frame(maxWidth: hasWidth ? (width ?? .infinity) : nil)
            .frame(height: height)
            .background(color)
            .cornerRadius(5)
        }
    }
}

