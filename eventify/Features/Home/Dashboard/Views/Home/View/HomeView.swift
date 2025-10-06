//
//  HomeView.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State var text: String = ""
    @State var proxyHeight: CGFloat? = nil
    
    @EnvironmentObject var vm: EventViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            HomeContentView(spacerLength: (proxyHeight ?? 0) + 20, vm: vm)
            
            // Background section
            VStack {
                HomeHeaderImage()
                    .ignoresSafeArea()
                Spacer()
            }
                
            VStack {
                Image("Logo")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(.accent)
                    .frame(width: 49, height: 13)
                
                VStack {
                    HStack {
                        VStack {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Image("location")
                                    Text("Wuse, Abuja")
                                        .font(.openSansRegular(size: 10))
                                        .foregroundStyle(.white)
                                    Spacer()
                                }
                                .padding(.bottom, 3)
                                
                                HStack(spacing: 15) {
                                    Text("Hi, Daniel")
                                        .font(.openSansBold(size: 20))
                                        .foregroundStyle(.white)
                                    Image("rating")
                                    Spacer()
                                }
                                .padding(.bottom, 3)
                                
                                Text("Ready to plan your next event?")
                                    .font(.openSansRegular(size: 12))
                                    .foregroundStyle(.white)
                            }
                            
                        }
                        Spacer()
                        Image("notification")
                            .renderingMode(.template)
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 5)
                    SearchFilter(text: $text)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 3)
                
                QuickActionsView()
                    .padding(.horizontal, 20)
                
            }
            .background(
                GeometryReader(content: { proxy in
                    Color.clear
                        .onAppear {
                            proxyHeight = proxy.size.height
                            print(proxyHeight ?? "")
                        }
                        .onChange(of: proxy.size.height) { _, newHeight in
                            proxyHeight = newHeight
                            print(proxyHeight ?? "")
                        }
                })
            )
            
            
        }
        
    }
}

struct HomeHeaderImage: View {
    var body: some View {
        Image("home_header")
            .resizable()
            .scaledToFit()
            .overlay {
                Rectangle()
                    .fill(.black.opacity(0.20))
            }
    }
}

struct SearchFilter: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            InputField(
                text: $text,
                hintText: "Search for venues, vendors, event types...",
                hintFont: .openSansRegular(size: 12),
                hintColor: .neutral6,
                isFilled: true,
                fillColor: .white,
                prefixIcon: Image("search_icon").renderingMode(.template),
                borderRadius: 4,
                height: 44
            )
            
            Button {
                
            } label: {
                Image("preference")
                    .frame(width: 44, height: 44)
                    .background(.accent)
                    .cornerRadius(4)
            }
        }
    }
}

struct QuickActionsView: View {
    var body: some View {
        HStack {
            quickActionButtons(color: Color(hex: 0xffF0E9F6), label: "Create Event", icon: "create_event", iconColor: Color(hex: 0xFF6B21A8))
            Spacer()
            
            quickActionButtons(color: Color(hex: 0xFF2563EB).opacity(0.1), label: "Find Venue", icon: "location", iconColor: Color(hex: 0xFF2563EB))
            Spacer()
            
            quickActionButtons(color: Color(hex: 0xFF35AB61).opacity(0.1), label: "Book Vendor", icon: "people", iconColor: Color(hex: 0xFF35AB61))
            Spacer()
            
            quickActionButtons(color: Color(hex: 0xFFEA580C).opacity(0.1), label: "Join Event", icon: "calendar", iconColor: Color(hex: 0xFFEA580C))

        }
        .padding(.horizontal, 20)
        .padding(.vertical, 17)
        .frame(maxWidth: .infinity)
        .background(
            Color.white
        )
        .cornerRadius(4)
        .shadow(
            color: .black.opacity(0.08),
            radius: 10,
            x:0,
            y: 2
        )
    }
}

func quickActionButtons(
    color: Color,
    label: String,
    icon: String,
    iconColor: Color
) -> some View {
    VStack {
        Image(icon)
            .renderingMode(.template)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundStyle(iconColor)
            .frame(width: 52, height: 50)
            .background(color)
            .cornerRadius(6)
            .padding(.bottom, 2)
        
        Text(label)
            .foregroundStyle(.neutral7)
            .font(.openSansRegular(size: 10))
    }
}

struct HomeContentView: View {
    
    var spacerLength: CGFloat? = 0
    @ObservedObject var vm: EventViewModel
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Spacer(minLength: spacerLength)
                Rectangle()
                    .fill(.neutral1)
                    .frame(maxWidth: .infinity)
                    .frame(height: 8)
                    .padding(.bottom, 5)
                
                // Your Events Section
                SectionView(content: {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(vm.events, id: \.self) { event in
                                YourEventsView(image: event.image ?? "", title: event.text, population: event.population ?? "")
                            }
                        }
                        .padding(.leading, 20)
                    }
                }, title: "Your Events")
                
                // Trending Section
                SectionView(content: {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }, title: "Trending Vendors", viewText: "See All")
                
                // Events Near You Section
                SectionView(content: {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }, title: "Events near you", viewText: "See All")
                
                // Recommended based on interests Section
                SectionView(content: {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                        ItemWidget(image: "", title: "", location: "", distance: 0.0, rating: 0.0, price: 0.0)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }, title: "Recommended based on interests", viewText: "See All")
                
            }
        }
    }
}

struct SectionView<Content: View>: View {
    
    var content: ()-> Content
    var title: String
    var viewText: String = "View All"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Text(title)
                    .font(.openSansBold(size: 14))
                    .foregroundStyle(.textBlack)
                
                Spacer()
                
                Text(viewText)
                    .font(.openSansSemiBold(size: 12))
                    .foregroundStyle(.accent)
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 2)
            
            content()
                .padding(.bottom, 5)
            
            Rectangle()
                .fill(.neutral1)
                .frame(maxWidth: .infinity)
                .frame(height: 8)
                .padding(.bottom, 5)
            
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(EventViewModel())
}
