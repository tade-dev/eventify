//
//  SignUpLoginView.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import SwiftUI

struct SignUpLoginView: View {
    
    @Binding var switchToLogin: Bool
    @State var navigateToCreateAccount: Bool = false
    @EnvironmentObject private var vm: AuthenticationViewModel
    
    var body: some View {
        ZStack {
    
            VStack() {
                
                logo
                
                Spacer()
                
                VStack(spacing: 8) {
                    
                    topSection
                    
                    OrSectionDivider()
                    
                    SocialButtons()
                
                }
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 10)
            
        }
        .navigationBarBackButtonHidden()
    }
    
    var topSection: some View {
        return VStack {
            Text("Discover, Book and Enjoy events tailored to your taste!")
                .font(.openSansBold(size: 24))
                .foregroundColor(.white)
                .padding(.bottom, 15)
            
            PrimaryButton(text: "Sign up for Eventify", color: .colors.accentColor) {
                navigateToCreateAccount = true
            }
            .padding(.bottom, 5)
            .navigationDestination(isPresented: $navigateToCreateAccount) {
                SignUpFlowView(
                    views: [
                        AnyView(CreateAccountView(vm: vm)),
                        AnyView(CheckYourMailView(vm: vm)),
                        AnyView(ChooseLocationView(vm: vm)),
                        AnyView(YourInterestView(vm: vm)),
                    ]
                )
            }
            
            Button {
                switchToLogin = true
            } label: {
                Text("Log into Eventify")
                    .font(.openSans(.semiBold, size: 16))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white.opacity(0.1))
                    .blur(radius: 10)
                    .border(.white)
            )
            .padding(.bottom, 10)

            
            Button {
                
            } label: {
                Text("Continue as Guest")
                    .font(.openSans(.semiBold, size: 16))
                    .foregroundStyle(.white)
                    .frame(height: 50)
            }
            .accentColor(.white)
            .padding(.bottom, 10)
        }
    }
    
    var logo: some View {
        return Image("Logo")
            .resizable()
            .frame(width: 113, height: 32)
            .padding(.top, 40)
    }
    
}

#Preview {
    SignUpLoginView(
        switchToLogin: .constant(false),
        navigateToCreateAccount: false
    )
    .environmentObject(AuthenticationViewModel())
}
