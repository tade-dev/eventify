//
//  AppBar.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct AppBar: View {
    
    var onBack: () -> Void
    var text: String
    var actions: [AnyView] = []
    
    var body: some View {
        HStack {
            
            BackButton {
                onBack()
            }
            
            Spacer()
            
            Text(text)
                .font(.openSansBold(size: 24))
                .foregroundStyle(.textBlack)
            
            Spacer()
            
            HStack {
                ForEach(0..<actions.count, id: \.self) { index in
                    actions[index]
                }
            }
            
        }
    }
}

#Preview {
    AppBar(
        onBack: {
            
        }, text: "Welcome Back"
    )
}
