//
//  InterestsChip.swift
//  eventify
//
//  Created by BSTAR on 29/09/2025.
//

import SwiftUI

struct InterestsChip: View {
    
    var isSelected: Bool = false
    var title: String
    
    var body: some View {
        Text(title)
            .font(.openSansSemiBold(size: 16))
            .foregroundStyle(isSelected ? .accent : .neutral7)
            .padding(.vertical, 12)
            .padding(.horizontal, 15)
            .background(content: {
                Capsule()
                    .fill(isSelected ? .accent1 : .clear)
            })
            .overlay {
                Capsule()
                    .stroke(lineWidth: 1)
                    .fill(isSelected ? .accent : .neutral6)
            }
            .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

#Preview {
    InterestsChip(
        title: "Active"
    )
}
