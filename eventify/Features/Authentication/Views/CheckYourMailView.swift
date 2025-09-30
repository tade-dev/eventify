//
//  CheckYourMailView.swift
//  eventify
//
//  Created by BSTAR on 25/09/2025.
//

import SwiftUI

struct CheckYourMailView: View {
    @ObservedObject var vm: AuthenticationViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text(makeAttributed())
                    .font(.openSansRegular(size: 14))
                    .foregroundStyle(.neutral6)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    
                    Text("Enter Code")
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
                vm.selectedSignUpViewIndex = 2
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        })
    }
    
    func makeAttributed() -> AttributedString {
        var str = AttributedString("We sent a 4 digit verification code to your email danielxyz@gmail.com")

        if let range = str.range(of: "danielxyz@gmail.com") {
            str[range].foregroundColor = .colors.accentColor
            str[range].font = .openSansMedium(size: 14)
        }
        
        return str
    }
    
}

#Preview {
    CheckYourMailView(
        vm: AuthenticationViewModel()
    )
}
