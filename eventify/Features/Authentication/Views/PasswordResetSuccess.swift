//
//  PasswordResetSuccess.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct PasswordResetSuccess: View {
    
    @State private var navigateToLogin = false
    
    var body: some View {
        VStack {
            
            Image("success_check")
                .padding(.bottom, 10)
            
            Text("Password Reset Success")
                .font(.openSansBold(size: 24))
                .foregroundStyle(.textBlack)
                .padding(.bottom, 3)
            
            Text("You have generated a new password, you can now login to your account.")
                .font(.openSansRegular(size: 16))
                .foregroundStyle(.neutral7)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            PrimaryButton(text: "Return to Login", color: .accent) {
                navigateToLogin = true
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                AuthIntroView(switchToLogin: true)
            }
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    PasswordResetSuccess()
}
