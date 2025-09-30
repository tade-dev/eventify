//
//  ForgotPasswordOtpView.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct ForgotPasswordOtpView: View {

    @EnvironmentObject private var vm: AuthenticationViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text("OTP Verification")
                    .font(.openSansBold(size: 20))
                    .foregroundStyle(.textBlack)
                
                Text("Enter the 4 digit Code sent to xyz@gmail.com")
                    .font(.openSansRegular(size: 14))
                    .foregroundStyle(.neutral6)
                    .padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    
                    Text("Enter OTP")
                        .font(.openSansRegular(size: 16))
                        .foregroundStyle(.textBlack)
                    
                    OTPInputView(
                        code: $vm.otpCode,
                        length: 4,
                        boxSize: .init(width: 70, height: 70),
                        activeColor: .accent,
                        filledColor: .accent,
                        emptyColor: .accent
                    )
                    .padding(.bottom, 15)
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Don't have an account?")
                            .foregroundStyle(.neutral6)
                            .font(.openSansRegular(size: 14))
                        
                        Text("Resend Code")
                            .foregroundColor(.accent)
                            .font(.openSansMedium(size: 14))
                            .underline()
                            .onTapGesture {
                                
                            }
                        Spacer()
                    }
                    
                }
                
            }
            .padding(.horizontal, 20)
        }
        .safeAreaInset(edge: .bottom, content: {
            PrimaryButton(text: "Continue", color: .accent) {
                dismissKeyboardWhenTappedAround()
                vm.selectedResetPasswordViewIndex = 1
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        })
    }

}

#Preview {
    ForgotPasswordOtpView()
        .environmentObject(AuthenticationViewModel())
}
