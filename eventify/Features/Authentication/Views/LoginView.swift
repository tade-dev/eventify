//
//  LoginView.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = AuthenticationViewModel()
    @Binding var switchToLogin: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.white
                .ignoresSafeArea()
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    AppBar(onBack: {
                        switchToLogin = false
                    }, text: "Welcome Back")
                    .padding(.bottom, 5)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Good to have you back, please login to make use of the app")
                            .font(.openSansMedium(size: 14))
                            .foregroundStyle(Color.colors.neutral6)
                            .padding(.bottom, 15)
                        
                        InputField(text: $viewModel.emailAddress, hintText: "Email")
                            .padding(.bottom, 10)
                        
                        InputField(text: $viewModel.password, hintText: "Password", isPasword: true)
                            .padding(.bottom, 7)
                        
                        HStack {
                            CheckBoxTile(text: "Remember Me", value: $viewModel.rememberMe)
                            Spacer()
                            Text("Forgot Password?")
                                .font(.openSansBold(size: 12))
                                .foregroundStyle(Color.colors.accentColor)
                        }
                        .padding(.bottom, 20)
                        
                        PrimaryButton(text: "Sign in", color: .accent) {
                            
                        }
                        .padding(.bottom, 20)
                        
                        OrSectionDivider()
                        
                        SocialButtons(
                            hasBorder: true
                        )
                        .padding(.bottom, 20)
                        
                        HStack {
                            Spacer()
                            HasAccountWidget {
                                
                            }
                            Spacer()
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    LoginView(
        switchToLogin: .constant(false)
    )
}
