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
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Please fill in the information below to create an account")
                    .font(.openSansMedium(size: 14))
                    .foregroundStyle(Color.colors.neutral6)
                    .padding(.bottom, 15)
                
                InputField(text: $vm.fullName, hintText: "Full Name")
                    .padding(.bottom, 10)
                
                InputField(text: $vm.emailAddress, hintText: "Email")
                    .padding(.bottom, 10)
                
                InputField(text: $vm.password, hintText: "Password", isPasword: true)
                    .padding(.bottom, 10)
                
                InputField(text: $vm.confirmPassword, hintText: "Re-enter Password", isPasword: true)
                    .padding(.bottom, 10)
                
                PrimaryButton(text: "Continue", color: .accent) {
    //                vm.isLoginLoading = true
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
    }
}

#Preview {
    CreateAccountView(
        vm: AuthenticationViewModel()
    )
}
