//
//  SignUpLoginView.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import SwiftUI

struct SignUpLoginView: View {
    var body: some View {
        ZStack {
    
            backgroundImage
            
            LinearGradient(
                stops: [
                    .init(color: .colors.textBlack.opacity(0.5), location: 0.58),
                    .init(color: .colors.textBlack, location: 1.0),
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack() {
                
                logo
                
                Spacer()
                
                VStack(spacing: 8) {
                    
                    topSection
                    
                    dividerSection
                    
                    socialButtons
                
                }
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 10)
            
        }
        .navigationBarBackButtonHidden()
    }
    
    var backgroundImage: some View {
        return Image("sign_up_login")
            .resizable()
            .ignoresSafeArea()
    }
    
    var topSection: some View {
        return VStack {
            Text("Discover, Book and Enjoy events tailored to your taste!")
                .font(.openSansBold(size: 24))
                .foregroundColor(.white)
                .padding(.bottom, 15)
            
            PrimaryButton(text: "Sign up for Eventify", color: .colors.accentColor) {
                
            }
            .padding(.bottom, 5)
            
            Button {
                
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
    
    var dividerSection: some View {
        return HStack {
            Rectangle()
                .fill(Color.neutral6)
                .frame(height: 1)
                
      
            Text("Or")
                .font(.openSans(.regular, size: 10))
                .foregroundStyle(.neutral6)
                .padding(.horizontal, 8)

            Rectangle()
                .fill(Color.neutral6)
                .frame(height: 1)
                
        }
        .padding(.bottom, 20)
    }
    
    var socialButtons: some View {
        return VStack(spacing: 10) {
            Button {
                
            } label: {
                HStack(spacing: 10) {
                    Image("apple")
                    Text("Continue with Apple")
                        .font(Font.openSans(.regular, size: 12))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.colors.textBlack)
                .cornerRadius(5)
            }
            .padding(.bottom, 3)
            
            Button {
                
            } label: {
                HStack(spacing: 10) {
                    Image("google")
                    Text("Continue with Google")
                        .font(Font.openSans(.regular, size: 12))
                        .foregroundStyle(.textBlack)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.colors.white)
                .cornerRadius(5)
            }
            .padding(.bottom, 3)
            
            Button {
                
            } label: {
                HStack(spacing: 10) {
                    Image("facebook")
                    Text("Continue with Facebook")
                        .font(Font.openSans(.regular, size: 12))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.colors.facebookBlue)
                .cornerRadius(5)
            }
        }
    }
    
}

#Preview {
    SignUpLoginView()
}
