//
//  EventDetailsView.swift
//  eventify
//
//  Created by BSTAR on 05/10/2025.
//

import SwiftUI

struct EventDetailsView: View {
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
        }
        .overlay(alignment: .bottom) {
            PrimaryButton(text: "Book Event", color: .accent) {
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(.white)
        }
        
    }
}

struct EventDetailsTile: View {
    
    var icon: String
    var title: String
    var subtitle: String
    var hasButton: Bool = false
    var btnText: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.accent)
                .frame(width: 20, height: 20)
                .padding(.all, 10)
                .background {
                    Circle()
                        .fill(.accent.opacity(0.10))
                }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.openSansBold(size: 14))
                    .foregroundStyle(.textBlack)
                
                Text(subtitle)
                    .font(.openSansRegular(size: 12))
                    .foregroundStyle(.neutral7)
                
                Text(btnText)
                    .font(.openSansBold(size: 12))
                    .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    EventDetailsView()
}
