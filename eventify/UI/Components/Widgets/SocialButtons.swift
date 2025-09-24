//
//  SocialButtons.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct SocialButtons: View {
    
    var hasBorder: Bool = false
    
    var body: some View {
        socialButtons
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
                .background(
                    Group(content: {
                        if(!hasBorder) {
                            Color.white
                                .cornerRadius(5)
                        }else {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke()
                                .tint(hasBorder ? .colors.textBlack : .clear)
                        }
                    })
                )
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
    SocialButtons()
}
