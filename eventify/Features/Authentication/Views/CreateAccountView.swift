//
//  CreateAccountView.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct CreateAccountView: View {
    
    @ObservedObject var vm: AuthenticationViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text("Please fill in the information below to create an account")
                    .font(.openSansMedium(size: 14))
                    .foregroundStyle(Color.colors.neutral6)
                    .padding(.bottom, 15)
                
                InputField(text: $vm.fullName, hintText: "Full Name", height: 48)
                    .padding(.bottom, 10)
                
                InputField(text: $vm.emailAddress, hintText: "Email", height: 48)
                    .padding(.bottom, 10)
                
                InputField(text: $vm.password, hintText: "Password", isPassword: true, height: 48)
                    .padding(.bottom, 10)
                
                InputField(text: $vm.confirmPassword, hintText: "Re-enter Password", isPassword: true, height: 48)
                    .padding(.bottom, 15)
                
                CheckBoxTile(
                    value: $vm.agreedToTerms,
                    textWidget: AnyView(
                        Text(makeAttributed())
                            .font(.openSansRegular(size: 12))
                            .foregroundStyle(.textBlack)
                    )
                )
                .padding(.bottom, 20)
                
                PrimaryButton(text: "Continue", color: .accent) {
                    dismissKeyboardWhenTappedAround()
                    vm.selectedSignUpViewIndex = 1
                }
                .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    HasAccountWidget(hasAccount: true) {
                        
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
                
                OrSectionDivider()
                
                SocialButtons(
                    hasBorder: true
                )
                .padding(.bottom, 20)
                
            }
        }
        .padding(.horizontal, 20)
    }
    
    func makeAttributed() -> AttributedString {
        var str = AttributedString("By continuing, you agree to Eventify Terms of Service and acknowledge you’ve read our Privacy Policy")

        if let range = str.range(of: "Terms of Service") {
            str[range].foregroundColor = .colors.accentColor
            str[range].font = .openSansMedium(size: 12)
        }

        if let range = str.range(of: "Privacy Policy") {
            str[range].foregroundColor = .colors.accentColor
            str[range].font = .openSansMedium(size: 12)
        }

        return str
    }
    
}

#Preview {
    CreateAccountView(
        vm: AuthenticationViewModel()
    )
}
