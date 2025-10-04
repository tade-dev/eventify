//
//  ResetPassword.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct ResetPassword: View {
    
    @EnvironmentObject private var vm: AuthenticationViewModel
    @State private var navigateToSuccess = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading) {
                Text("New Password")
                    .font(.openSansBold(size: 20))
                    .foregroundStyle(.textBlack)
                
                Text("Set your new password")
                    .font(.openSansRegular(size: 14))
                    .foregroundStyle(.neutral6)
                    .padding(.bottom, 20)
                
                InputField(
                    text: $vm.password,
                    hintText: "New Password",
                    isPassword: true,
                    height: 48
                )
                .padding(.bottom, 10)
                
                InputField(
                    text: $vm.password,
                    hintText: "Re-enter Password",
                    isPassword: true,
                    height: 48
                )
                
            }
            .padding(.horizontal, 20)
                
        }
        .safeAreaInset(edge: .bottom, content: {
            PrimaryButton(text: "Continue", color: .accent) {
                dismissKeyboardWhenTappedAround()
                navigateToSuccess = true
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
            .navigationDestination(isPresented: $navigateToSuccess) {
                PasswordResetSuccess()
            }
        })
    }
}

#Preview {
    ResetPassword()
        .environmentObject(AuthenticationViewModel())
}
