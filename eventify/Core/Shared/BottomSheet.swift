//
//  BottomSheet.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct BottomSheet<Content: View, Child: View>: View {
    
    var content: ()-> Content
    var child: ()-> Child
    @Binding var isActive: Bool
    var backgroundColor: Color = .altPrimary
    var height: CGFloat = 300
    
    var body: some View {
        
            ZStack(content: {
                content()
                Color.altPrimary.opacity(isActive ? 0.7 : 0)
                    .ignoresSafeArea()
                    .animation(.easeInOut, value: isActive)
            })
            .overlay(alignment: .bottom) {
                
                if isActive {
                    child()
                        .padding(.horizontal, 15)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: height)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .ignoresSafeArea()
                        }
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                        .animation(.spring())
                }

            }
    }
}

#Preview {
    BottomSheet(content: {
        Color.red
            .ignoresSafeArea()
    }, child: {
        Text("Actvie")
    }, isActive: .constant(true))
}
