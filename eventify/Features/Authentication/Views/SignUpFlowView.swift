//
//  SignUpFlowView.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct SignUpFlowView: View {
    
    @EnvironmentObject private var vm: AuthenticationViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                AppBar(
                    onBack: {
                        if (vm.selectedSignUpViewIndex > 0) {
                            vm.selectedSignUpViewIndex -= 1
                        } else {
                            dismiss()
                        }
                        dismissKeyboardWhenTappedAround()
                    },
                    text: getTitle(index: vm.selectedSignUpViewIndex),
                )
                    .padding(.horizontal, 20)
                
                StepperProgress(
                    length: 4,
                    currentIndex: vm.selectedSignUpViewIndex
                )
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                TabView(selection: $vm.selectedSignUpViewIndex) {
                    
                    CreateAccountView(vm: vm)
                        .tag(0)
                    
                    CheckYourMailView(vm: vm)
                        .tag(1)
                    
                    ChooseLocationView(vm: vm)
                        .tag(2)
                    
                    YourInterestView(vm: vm)
                        .tag(3)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func getTitle(index: Int) -> String {
        switch (index) {
        case 0: return "Create an account"
        case 1: return "Check your mail"
        case 2: return "Choose Location"
        default: return "Tell us your interests"
        }
    }
    
}

#Preview {
    SignUpFlowView()
        .environmentObject(AuthenticationViewModel())
}
