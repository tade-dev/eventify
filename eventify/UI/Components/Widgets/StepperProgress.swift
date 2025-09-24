//
//  StepperProgress.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import SwiftUI

struct StepperProgress: View {
    
    var length: Int = 0
    var currentIndex: Int = 0
    
    var body: some View {
        HStack {
            ForEach(0..<length, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .fill(currentIndex == index ? .accent : .colors.neutral4)
                    .frame(height: 5)
            }
        }
    }
}

#Preview {
    StepperProgress(
        length: 4
    )
}
