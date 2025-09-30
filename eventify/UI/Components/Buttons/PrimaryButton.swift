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
    var fontSize: CGFloat = 16
    var textColor: Color = .white
    
    var body: some View {
        Button(action: onPressed) {
            Text(text)
                .font(.openSans(.semiBold, size: fontSize))
                .foregroundColor(textColor)
                .frame(maxWidth: width ?? .infinity)
                .frame(height: height)
                .background(color)
                .cornerRadius(5)
        }
    }
}

