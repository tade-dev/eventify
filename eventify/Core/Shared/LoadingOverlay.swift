//
//  LoadingOverlay.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct LoadingOverlay<Content: View>: View {
    
    var isLoading: Bool = false
    var backgroundColor: Color = .altPrimary
    var text: String = "Loading, Please wait..."
    var child: ()-> Content
    
    var body: some View {
        ZStack {
            
            child()
            
            if isLoading {
                ZStack {
                    
                    backgroundColor.opacity(0.7)
                        .ignoresSafeArea()
                    
                    VStack {
                        ProgressView()
                        Text(text)
                            .font(.openSansMedium(size: 16))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                    }
                    .padding(.horizontal, 20)
                    .scaleEffect(isLoading ? 1 : 0)
                    .animation(.bouncy.delay(0.1), value: isLoading)
                    
                }
            }
            
        }
    }
}

#Preview {
    LoadingOverlay() {
        LoginView(
            switchToLogin: .constant(false),showForgotPassword: .constant(false))
    }
    .environmentObject(AuthenticationViewModel())
}
