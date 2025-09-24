//
//  Untitled.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct CheckBoxTile: View {
    
    var text: String?
    @Binding var value: Bool
    var textWidget: AnyView?
    
    var body: some View {
        HStack(spacing: 10) {
            Button(action: {
                value.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: 4.36)
                    .fill(value ? Color.colors.accentColor : .clear)
                    .stroke(value ? .clear : .neutral6)
                    .frame(width: 24, height: 24)
                    .overlay {
                        if(value) {
                            Image(systemName: "checkmark")
                                .font(.caption)
                                .foregroundStyle(.white)
                        }
                    }
            })
            .animation(.easeInOut, value: value)
            
            if(text != nil) {
                Text(text!)
                    .font(.openSansSemiBold(size: 12))
                    .foregroundStyle(Color.colors.textBlack)
                
            }else {
                textWidget
            }
            
        }
    }
}

#Preview {
    CheckBoxTile(text: "Remember me", value: .constant(true))
}
