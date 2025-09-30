//
//  ForgotPassword.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct ForgotPassword: View {
    
    @Binding var showForgotPassword: Bool
    @EnvironmentObject private var vm: AuthenticationViewModel
    @State var navigateToResetPassword: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Forgot Password?")
                        .font(.openSansSemiBold(size: 18))
                        .foregroundStyle(.accent)
                    
                    Spacer()
                    
                    Image("cancel-circle")
                        .onTapGesture {
                            showForgotPassword = false
                        }
                }
                .padding(.bottom, 10)
                
                Text("Please provide your email address to initiate the password reset process.")
                    .font(.openSansMedium(size: 14))
                    .foregroundStyle(Color.colors.neutral6)
                    .padding(.bottom, 10)
                
                InputField(
                    text: $vm.emailAddress,
                    hintText: "Email address",
                )
                .padding(.bottom, 10)
                
                HStack(alignment: .center) {
                    Image("info-circle")
                    Text("Remember password?")
                        .foregroundStyle(.neutral6)
                        .font(.openSansRegular(size: 10))
                    
                    Text("Back to Login")
                        .foregroundColor(.accent)
                        .font(.openSansSemiBold(size: 10))
                        .onTapGesture {
                            
                        }
                    
                    Spacer()
                }
                .padding(.bottom, 20)
                
                PrimaryButton(text: "Send OTP", color: .accent) {
                    navigateToResetPassword = true
                }
                .navigationDestination(isPresented: $navigateToResetPassword) {
                    ResetPasswordFlowView(views: [
                        AnyView(ForgotPasswordOtpView()),
                        AnyView(ResetPassword())
                    ])
                }
            }
        }
    }
}

#Preview {
    ForgotPassword(
        showForgotPassword: .constant(false)
    )
    .environmentObject(AuthenticationViewModel())
}
