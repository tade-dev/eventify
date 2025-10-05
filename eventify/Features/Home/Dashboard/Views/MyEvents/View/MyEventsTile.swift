//
//  MyEventsTile.swift
//  eventify
//
//  Created by BSTAR on 05/10/2025.
//

import SwiftUI

struct MyEventsTile: View {
    
    var title: String
    var subtitle: String
    var icon: String
    var onTap: () -> Void
    
    var body: some View {
        
        HStack {
            
            IconView(icon: icon)
                .padding(.trailing, 4)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.openSansSemiBold(size: 14))
                    .foregroundStyle(.textBlack)
                
                Text(subtitle)
                    .font(.openSansRegular(size: 12))
                    .foregroundStyle(.neutral7)
            }
            
            Spacer()
            
            Image("arrow-right")
            
        }
        .padding(.all, 20)
        .background(
            Color.white
        )
        .cornerRadius(12)
        .onTapGesture {
            onTap()
        }
        
    }
}

struct IconView: View {
    
    var icon: String
    
    var body: some View {
        
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
        
    }
}

#Preview {
    MyEventsTile(title: "Active Events", subtitle: "2 Upcoming Events today", icon: "time") {
        
    }
}
