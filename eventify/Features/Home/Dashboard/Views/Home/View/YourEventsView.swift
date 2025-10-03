//
//  YourEventsView.swift
//  eventify
//
//  Created by BSTAR on 03/10/2025.
//

import SwiftUI

struct YourEventsView: View {
    
    var image: String
    var title: String
    var population: String
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Upcoming")
                    .font(.openSansSemiBold(size: 10))
                    .foregroundStyle(.white)
                    .padding(.all, 10)
                    .background(
                        Capsule()
                            .fill(.accent)
                    )
                Spacer()
                HStack {
                    Image("people")
                    Text(population)
                        .font(.openSansBold(size: 12))
                        .foregroundStyle(.white)
                }
            }
            .padding(.bottom, 10)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.openSansSemiBold(size: 14))
                        .foregroundStyle(.white)
                    HStack {
                        Image("calendar")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.white)
                            .frame(width: 16, height: 16)
                        Text("Mon Dec 24, 2024")
                            .font(.openSansSemiBold(size: 10))
                            .foregroundStyle(.white)
                    }
                    HStack {
                        Image("time")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.white)
                            .frame(width: 16, height: 16)
                        Text("12:00 PM - 6:00 PM")
                            .font(.openSansSemiBold(size: 10))
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
                Text("View Details")
                    .font(.openSansBold(size: 12))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Color(hex: 0xFF2D264B).opacity(0.5)
                    .background(.ultraThinMaterial)
            )
            .cornerRadius(4)
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(style: .init(lineWidth: 0.2))
                    .foregroundStyle(.white)
            }
            
        }
        .padding()
        .background(
            Image(image)
                .resizable()
                .scaledToFill()
        )
        .cornerRadius(8)
        .padding(.trailing, 10)
    }
}

#Preview {
    YourEventsView(image: "event1", title: "Masked Out Party", population: "1034")
}
