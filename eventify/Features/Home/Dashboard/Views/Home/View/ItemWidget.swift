//
//  ItemWidget.swift
//  eventify
//
//  Created by BSTAR on 03/10/2025.
//

import SwiftUI

struct ItemWidget: View {
    
    var image: String
    var isLiked: Bool = false
    var onTap: () -> Void = { }
    var title: String
    var location: String
    var distance: Double
    var rating: Double
    var price: Double
    var isAvailable: Bool = false
    
    var body: some View {

        VStack {
            
            Color.white
                .frame(height: 204)
                .overlay {
                    GeometryReader { proxy in
                        VStack(alignment: .leading) {
                            
                            Color.red
                                .frame(maxWidth: proxy.size.width)
                                .frame(height: proxy.size.height / 2.1)
                            
                            VStack(alignment: .leading) {
                                Text("Daniel Kyle - Photographer")
                                    .font(.openSansSemiBold(size: 10))
                                    .lineLimit(2)
                                HStack {
                                    HStack(spacing: 4) {
                                        Image("location")
                                            .renderingMode(.template)
                                            .foregroundStyle(.neutral7)
                                        Text("Downtown")
                                            .lineLimit(1)
                                            .font(.openSansRegular(size: 10))
                                            .foregroundStyle(.neutral7)
                                    }
                                    
                                    Circle()
                                        .fill(.accent)
                                        .frame(width: 3, height: 3)
                                    
                                    Text("2.5 miles away")
                                        .font(.openSansRegular(size: 10))
                                        .foregroundStyle(.neutral7)
                                        .lineLimit(1)
                                }
                                
                                HStack(spacing: 4) {
                                    Image("star")
                                        .renderingMode(.template)
                                        .foregroundStyle(.neutral7)
                                    Text("4.8")
                                        .lineLimit(1)
                                        .font(.openSansRegular(size: 10))
                                        .foregroundStyle(.neutral7)
                                }
                                
                                HStack {
                                    Text(makeAttributed())
                                        .foregroundStyle(.accent)
                                        .font(.openSansSemiBold(size: 12))
                                    Spacer()
                                    Text("Available")
                                        .font(Font.openSansSemiBold(size: 10))
                                        .foregroundStyle(Color(hex: 0xFF05BA68))
                                }
                                
                            }
                            .padding(.horizontal, 9)
                            .padding(.vertical, 5)
                            
                        }
                    }
                }
                .cornerRadius(8)
                .shadow(
                    color: .colors.textBlack.opacity(0.06),
                    radius: 35,
                    x: 0,
                    y: 10
                )
                .overlay(alignment: .topTrailing) {
                    LikeLabel()
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                }
            
        }
        
    }
}

struct LikeLabel: View {
    var body: some View {
        Image("favourite")
            .resizable()
            .frame(width: 14, height: 14)
            .padding(.all, 7)
            .background(.ultraThinMaterial)
            .cornerRadius(50)
            .overlay {
                Circle()
                    .stroke(style: .init(lineWidth: 1))
                    .fill(.white)
            }
    }
}
func makeAttributed() -> AttributedString {
    var str = AttributedString("$1,000 / day")

    if let range = str.range(of: "/ day") {
        str[range].foregroundColor = .black
        str[range].font = .openSansSemiBold(size: 10)
    }

    return str
}

#Preview {
    ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
}
