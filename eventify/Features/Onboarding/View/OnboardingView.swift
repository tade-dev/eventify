//
//  OnboardingView.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var vm = OnboardingViewModel()
    @State private var isAnimating: Bool = false
    @State private var navigateToNext = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                _buildBackgroundImages(vm.currentIndex)
                    .ignoresSafeArea()
                
                LinearGradient(
                    stops: [
                        .init(color: .colors.textBlack.opacity(0.8), location: 0.58),
                        .init(color: .colors.textBlack, location: 0.85),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack() {
     
                    Image("Logo")
                        .resizable()
                        .frame(width: 113, height: 32)
                        .padding(.top, 90)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 50)

            }
            .overlay(alignment: .bottom, content: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(vm.onboardingViews[vm.currentIndex].title)
                        .font(.openSansBold(size: 32))
                        .foregroundColor(.white)
//                        .scaleEffect(isAnimating ? 1 : 0)
//                        .animation(.bouncy(duration: 0.3).delay(0.8), value: isAnimating)
                    
                    Text(vm.onboardingViews[vm.currentIndex].description)
                        .font(.openSansRegular(size: 16))
                        .foregroundColor(.white)
//                        .offset(x: isAnimating ? 0 : -500, y: 0)
//                        .animation(.bouncy(duration: 0.3).delay(0.8), value: isAnimating)
                    
                    CustomPageIndicator(
                        length: vm.onboardingViews.count,
                        selectedIndex: vm.currentIndex
                    )
                    .padding(.top, 15)
                    .padding(.bottom, 40)
//                    .offset(x: isAnimating ? 0 : -500, y: isAnimating ? 0 : 80)
//                    .animation(.bouncy(duration: 0.3).delay(0.8), value: isAnimating)
                    
                    PrimaryButton(text: "Next", color: .colors.accentColor) {
                        if(vm.currentIndex == 2){
                            navigateToNext = true
                        }else {
                            vm.currentIndex += 1
                        }
                    }
//                    .offset(x: isAnimating ? 0 : -500, y: isAnimating ? 0 : 100)
//                    .animation(.bouncy(duration: 0.3).delay(0.8), value: isAnimating)
                    .navigationDestination(isPresented: $navigateToNext) {
                        AuthIntroView()
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
            })
            .onAppear() {
                isAnimating = true
            }
        }
    }
    
    func _buildBackgroundImages(_ index: Int)-> some View {
        return switch index {
            case 0:
            Image("onboarding_1")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case 1:
            Image("onboarding_2")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case 2:
            Image("onboarding_3")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        default:
            Image("onboarding_1")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
}

#Preview {
    OnboardingView()
}
