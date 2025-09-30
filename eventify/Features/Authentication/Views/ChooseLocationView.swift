//
//  ChooseLocationView.swift
//  eventify
//
//  Created by BSTAR on 25/09/2025.
//

import SwiftUI

struct ChooseLocationView: View {
    @ObservedObject var vm: AuthenticationViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text("Enter your location")
                    .font(.openSansRegular(size: 14))
                    .foregroundStyle(.neutral6)
                    .padding(.bottom, 15)
                
                InputField(
                    text: $vm.searchLocationText,
                    hintText: "Search location",
                    hintFont: .openSansSemiBold(size: 16),
                    hintColor: .textBlack,
                    borderColor: .accent,
                    isFilled: true,
                    fillColor: .accent1,
                    prefixIcon: Image("search_icon"),
                    borderRadius: 8,
                )
                .padding(.bottom, 20)
                
                HStack(spacing: 20) {
                    Image("navigation")
                        .background {
                            Circle()
                                .fill(.accent.opacity(0.1))
                                .frame(width: 36, height: 36)
                        }
                    
                    Text("Use current location")
                        .font(.openSansSemiBold(size: 14))
                        .foregroundStyle(.textBlack)
                }
                
            }
            .padding(.horizontal, 20)
        }
        .safeAreaInset(edge: .bottom, content: {
            PrimaryButton(text: "Continue", color: .accent) {
                dismissKeyboardWhenTappedAround()
                vm.selectedSignUpViewIndex = 3
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        })
    }
}

#Preview {
    ChooseLocationView(
        vm: AuthenticationViewModel()
    )
}
