//
//  SignUpFlowView.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct SignUpFlowView<Content: View>: View {
    
    var content: Content
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                AppBar(text: "Create an account")
                StepperProgress(
                    length: 4
                )
                .padding(.bottom, 10)
                
                content
                
            }
            .padding(.horizontal, 20)
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SignUpFlowView(
        content: EmptyView()
    )
}
