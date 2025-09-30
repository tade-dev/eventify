//
//  ResetPasswordFlowView.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct ResetPasswordFlowView: View {
    
    @EnvironmentObject private var vm: AuthenticationViewModel
    @Environment(\.dismiss) private var dismiss
    var views: [AnyView]
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                AppBar(
                    onBack: {
                        if (vm.selectedResetPasswordViewIndex > 0) {
                            vm.selectedResetPasswordViewIndex -= 1
                        } else {
                            dismiss()
                        }
                        dismissKeyboardWhenTappedAround()
                    },
                    text: getTitle(index: vm.selectedResetPasswordViewIndex),
                )
                .padding(.horizontal, 20)
                
                views[vm.selectedResetPasswordViewIndex]
                
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func getTitle(index: Int) -> String {
        switch (index) {
        case 1: return "Reset Password"
        default: return "Forgot Password"
        }
    }
}

#Preview {
    ResetPasswordFlowView(
        views: [
            AnyView(Text(""))
        ]
    )
    .environmentObject(AuthenticationViewModel())
}
