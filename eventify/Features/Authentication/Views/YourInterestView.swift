//
//  YourInterestView.swift
//  eventify
//
//  Created by BSTAR on 25/09/2025.
//

import SwiftUI

struct YourInterestView: View {
    
    @ObservedObject var vm: AuthenticationViewModel
    @State private var selectedInterests: Set<String> = []
    
    let items = ["Music", "Art", "Eating", "Drinks", "Karaoke", "Photography", "Community", "Family & School", "Fashion", "Church", "Tech", "Business", "Sport", "Lifestyle", "Film & Media"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text("Choose between 3 to 10 interests and we'll tailor the best events to your feed.")
                    .font(.openSansRegular(size: 14))
                    .foregroundStyle(.neutral6)
                    .padding(.bottom, 15)
                
                WrappingHStack(items: items, spacing: 12) { item in
                    InterestsChip(
                        isSelected: selectedInterests.contains(item),
                        title: item
                    )
                    .onTapGesture {
                        toggleSelection(item)
                    }
                }
                
            }
            .padding(.horizontal, 20)
        }
        .safeAreaInset(edge: .bottom, content: {
            VStack(content: {
                
                Button {
                    
                } label: {
                    Text("Skip")
                        .font(.openSansSemiBold(size: 16))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                }

                PrimaryButton(text: "Continue", color: .accent) {
                    dismissKeyboardWhenTappedAround()
                }
                
            })
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        })
    }
    
    private func toggleSelection(_ item: String) {
        if selectedInterests.contains(item) {
            selectedInterests.remove(item)
        } else {
            if selectedInterests.count < 10 {
                selectedInterests.insert(item)
            }
        }
    }
}

struct WrappingHStack<Item: Hashable, Content: View>: View {
    let items: [Item]
    let spacing: CGFloat
    let content: (Item) -> Content
    
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = 0
        var height: CGFloat = 0
        var lineHeight: CGFloat = 0
        
        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                content(item)
                    .padding(.trailing, spacing)
                    .padding(.bottom, spacing)
                    .alignmentGuide(.leading) { dimension in
                        if abs(width - dimension.width) > geometry.size.width {
                            width = 0
                            height -= lineHeight
                            lineHeight = 0
                        }
                        
                        let result = width
                        if index == items.count - 1 {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { dimension in
                        let result = height
                        if index == items.count - 1 {
                            height = 0
                        }
                        lineHeight = max(lineHeight, dimension.height)
                        return result
                    }
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

#Preview {
    YourInterestView(
        vm: AuthenticationViewModel()
    )
}
