//
//  CustomPageIndicator.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import SwiftUI

struct CustomPageIndicator: View {
    
    var length: Int
    var height: CGFloat = 8
    var maxWidth: CGFloat = 55
    var cornerRadius: CGFloat = 5
    var mainColor: Color = .colors.accentColor
    var backgroundColor: Color = .colors.neutral4
    var selectedIndex: Int = 2
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<length, id: \.self) { index in
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(index == selectedIndex ? mainColor : backgroundColor)
                    .frame(width: index == selectedIndex ? self.maxWidth : 16, height: self.height)
                    .animation(.easeInOut, value: selectedIndex)
            }
        }
    }
}

#Preview {
    CustomPageIndicator(
        length: 3,
    )
}
