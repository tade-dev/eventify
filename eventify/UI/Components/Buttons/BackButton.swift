//
//  BackButton.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct BackButton: View {
    
    var onTap: () -> Void
    
    var body: some View {
        Image("arrow_back")
            .onTapGesture(perform: onTap)
    }
}

#Preview {
    BackButton {
        
    }
}
