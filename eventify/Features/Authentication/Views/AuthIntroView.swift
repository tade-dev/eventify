//
//  AuthIntroView.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct AuthIntroView: View {
    
    @State var switchToLogin: Bool = false
    
    var body: some View {
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
            
            
            LoginView(
                switchToLogin: $switchToLogin
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
                .offset(x: 0, y: switchToLogin ? 0 : UIScreen.main.bounds.height)
                .transition(.asymmetric(insertion: .move(edge: .bottom).animation(.bouncy), removal: .move(edge: .bottom).animation(.bouncy)).animation(.bouncy(duration: 0.8).delay(0.6)))
                .animation(.bouncy(duration: 0.8).delay(0.6), value: switchToLogin)

        }
    }
    
    var backgroundImage: some View {
        return Image("sign_up_login")
            .resizable()
    }
    
}

#Preview {
    AuthIntroView()
}
