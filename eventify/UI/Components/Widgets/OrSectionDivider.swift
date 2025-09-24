//
//  OrSectionDivider.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct OrSectionDivider: View {
    var body: some View {
        dividerSection
    }
    
    var dividerSection: some View {
        return HStack {
            Rectangle()
                .fill(Color.neutral6)
                .frame(height: 1)
                
      
            Text("Or")
                .font(.openSans(.regular, size: 10))
                .foregroundStyle(.neutral6)
                .padding(.horizontal, 8)

            Rectangle()
                .fill(Color.neutral6)
                .frame(height: 1)
                
        }
        .padding(.bottom, 20)
    }
    
}

#Preview {
    OrSectionDivider()
}
