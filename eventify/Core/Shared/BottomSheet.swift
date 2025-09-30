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
        ZStack(alignment: .bottom) {
            
            content()
                
            if isActive {
                ZStack {
                    
                    backgroundColor.opacity(0.7)
                        .animation(.easeInOut, value: isActive)
                        .ignoresSafeArea()
                    
                }
                .ignoresSafeArea()
            }
            
        }
        .safeAreaInset(edge: .bottom) {
            if isActive {
                child()
                    .padding(.horizontal, 15)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
                    .background(.white)
                    .cornerRadius(20)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                    .animation(.spring())
            }
        }
    }
}

#Preview {
    BottomSheet(content: {
        EmptyView()
    }, child: {
        Text("Active")
    }, isActive: .constant(true))
}
