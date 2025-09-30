//
//  DashboardTabView.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct DashboardTabView<Content: View>: View {
    
    @ObservedObject var viewModel: DashboardViewModel
    var content: ()-> Content
    
    var body: some View {
        content()
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .safeAreaInset(edge: .bottom) {
                HStack {
                    ForEach(0..<viewModel.dashboardTabs.count) { index in
                        DashboardItems(title: viewModel.dashboardTabs[index].title, image: viewModel.dashboardTabs[index].image, onTap:  {
                            viewModel.dashboardViewIndex = index
                        }, isSelected: viewModel.dashboardViewIndex == index)
                        if index != viewModel.dashboardTabs.count - 1 {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .frame(maxWidth: .infinity)
                .frame(height: 66)
                .background(
                    Color.white
                )
                .overlay(alignment: .top) {
                    Rectangle()
                        .fill(.neutral3)
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                }
            }
    }
    
    
    
}

struct DashboardItems: View {
    
    var title: String
    var image: String?
    var onTap: () -> Void
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            if let image {
                Image(image)
                    .renderingMode(.template)
                    .foregroundStyle(isSelected ? .accent : .neutral6)
                
            }else {
                Circle()
                    .fill(.accent)
                    .frame(width: 24, height: 24)
            }
            
            Text(title)
                .font(isSelected ? .openSansBold(size: 12) : .openSansRegular(size: 12))
                .foregroundStyle(isSelected ? .accent : .neutral6)
        }
        .animation(.easeInOut, value: isSelected)
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    DashboardTabView(
        viewModel: DashboardViewModel()) {
            ScrollView {
                ForEach(0..<30) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 30)
                        .frame(maxWidth: .infinity)
                }
            }
        }
}
