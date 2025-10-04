//
//  LoginView.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var switchToLogin: Bool
    @Binding var showForgotPassword: Bool
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var navigateToDashboard: Bool = false
    
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
                        
                        InputField(text: $viewModel.emailAddress, hintText: "Email", height: 48)
                            .padding(.bottom, 10)
                        
                        InputField(text: $viewModel.password, hintText: "Password", isPassword: true, height: 48)
                            .padding(.bottom, 7)
                        
                        HStack {
                            CheckBoxTile(text: "Remember Me", value: $viewModel.rememberMe)
                            Spacer()
                            Text("Forgot Password?")
                                .font(.openSansBold(size: 12))
                                .foregroundStyle(Color.colors.accentColor)
                                .onTapGesture {
                                    showForgotPassword = true
                                }
                        }
                        .padding(.bottom, 20)
                        
                        PrimaryButton(text: "Sign in", color: .accent) {
                            navigateToDashboard = true
                        }
                        .padding(.bottom, 20)
                        .navigationDestination(isPresented: $navigateToDashboard) {
                            DashboardView()
                        }

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
        switchToLogin: .constant(false),
        showForgotPassword: .constant(false)
    )
    .environmentObject(AuthenticationViewModel())
}
