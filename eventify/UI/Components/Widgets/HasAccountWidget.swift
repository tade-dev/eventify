//
//  HasAccountWidget.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct HasAccountWidget: View {
    
    var hasAccount: Bool = false
    var onTap: ()-> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Text(hasAccount ? "Already have an account?" : "Don't have an account?")
                .foregroundStyle(.textBlack)
                .font(.openSansRegular(size: 14))
            
            Text(hasAccount ? "Login" : "Create")
                .foregroundColor(.accent)
                .font(.openSansSemiBold(size: 14))
                .onTapGesture {
                    onTap()
                }
        }
    }
}

#Preview {
    HasAccountWidget {
        
    }
}
