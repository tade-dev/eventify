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
    var width: CGFloat = .infinity
    var fontSize: CGFloat = 16
    var textColor: Color = .white
    
    var body: some View {
        Button(action: onPressed) {
            Text(text)
                .frame(maxWidth: width)
                .frame(height: height)
                .foregroundColor(textColor)
                .background(color)
                .cornerRadius(5)
        }
    }
}
