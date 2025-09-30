//
//  AuthIntroView.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct AuthIntroView: View {
    
    @State var switchToLogin: Bool = false
    @State var showForgotPassword: Bool = false
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        BottomSheet(content: {
            LoadingOverlay(isLoading: viewModel.isLoginLoading, text: "Signing you in, please wait...") {
                ZStack(alignment: .bottom) {
                    backgroundImage
                        .ignoresSafeArea()
                    
                    LinearGradient(
                        stops: [
                            .init(color: .colors.textBlack.opacity(0.5), location: 0.58),
                            .init(color: .colors.textBlack, location: 1.0),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    SignUpLoginView(switchToLogin: $switchToLogin)
                        .opacity(switchToLogin ? 0 : 1)
                        .animation(.easeInOut(duration: 0.5), value: switchToLogin)
                    
                    ZStack {
                        if(switchToLogin) {
                            LoginView(
                                switchToLogin: $switchToLogin,
                                showForgotPassword: $showForgotPassword
                            )
                            .padding(.horizontal, 20)
                            .padding(.top, 30)
                            .background {
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(.white)
                                    .ignoresSafeArea()
                            }
                            .frame(height: UIScreen.main.bounds.height * 0.8)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                            .animation(.spring())
                        }
                    }
                }
                
            }
        }, child: {
            ForgotPassword(showForgotPassword: $showForgotPassword)
        }, isActive: $showForgotPassword, height: 300)
    }
    
    var backgroundImage: some View {
        return Image("sign_up_login")
            .resizable()
    }
    
}

#Preview {
    AuthIntroView()
        .environmentObject(AuthenticationViewModel())
}
