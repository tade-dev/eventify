import SwiftUI

struct SliverAppBarView: View {
    @State private var scrollOffset: CGFloat = 0
    let maxHeight: CGFloat = 200
    let minHeight: CGFloat = 60
    
    var collapsedHeight: CGFloat {
        max(minHeight, maxHeight - scrollOffset)
    }
    
    var opacity: CGFloat {
        let threshold = maxHeight - minHeight
        return max(0, 1 - (scrollOffset / threshold))
    }
    
    var body: some View {
        ZStack(alignment: .top) {
    
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    Color.clear
                        .frame(height: maxHeight)
                        .overlay(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        updateScroll(geo)
                                    }
                                    .onChange(of: geo.frame(in: .named("scroll"))) { _ in
                                        updateScroll(geo)
                                    }
                            }
                        )
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Santa Holiday Party")
                            .font(.openSansBold(size: 24))
                            .padding(.bottom, 10)
                        
                        EventDetailsNotes(icon: "calendar", title: "Mon, Dec 28, 2024", description: "04:00 PM - 08:00 PM", hasTextBtn: true, btnText: "Add to calendar")
                            .padding(.bottom, 15)
                        EventDetailsNotes(icon: "location", title: "ICC Event Center", description: "Area 8, Murtala express way", hasTextBtn: true, btnText: "View on maps")
                            .padding(.bottom, 15)
                        EventDetailsNotes(icon: "dollar-circle", title: "Refund Policy", description: "Ticket fee is non-refundable after payment")
                            .padding(.bottom, 15)
                        EventDetailsNotes(icon: "ticket", title: "$30.00 - $150.00", description: "Ticket price depends on package")
                            .padding(.bottom, 10)
                        
                        Text("About")
                            .font(.openSansBold(size: 16))
                        
                        Text("Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...")
                            .font(.openSansRegular(size: 12))
                            .foregroundStyle(.neutral7)
                        
                    }
                    .padding()
                }
            }
            .coordinateSpace(name: "scroll")
            .overlay(alignment: .bottom) {
                PrimaryButton(
                    text: "Book Event",
                    color: .accentColor,
                ) {
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .background {
                    Color.white
                        .ignoresSafeArea()
                }
            }
    
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 0)
                    .ignoresSafeArea()
                ZStack(alignment: .center) {
            
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .cyan]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    VStack(spacing: 8) {
                        Text("Sliver AppBar")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(opacity)
                        
                        Text("Collapsing Header")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .opacity(opacity * 0.7)
                    }
                    .frame(maxWidth: .infinity)
                }
                .ignoresSafeArea(edges: .top)
                .overlay(alignment: .leading) {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                    }
                    .padding(.leading, 16)
                }
                .overlay(alignment: .trailing) {
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                    }
                    .padding(.trailing, 16)
                }
                .frame(height: collapsedHeight)
                
                Divider()
            }
        }
    }
    
    private func updateScroll(_ geo: GeometryProxy) {
        let offset = geo.frame(in: .named("scroll")).minY
        scrollOffset = -offset
    }
}

struct EventDetailsNotes: View {
    
    var icon: String
    var title: String
    var description: String
    var hasTextBtn: Bool = false
    var onTap: () -> Void = { }
    var btnText: String = "Tap me"
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(.accent)
                .frame(
                    width: 20,
                    height: 20
                )
                .padding(.all, 10)
                .background(
                    Color(.accent).opacity(0.1),
                    in: Circle()
                )
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(title)
                    .font(.openSansBold(size: 14))
                    .foregroundStyle(.textBlack)
                
                Text(description)
                    .font(.openSansRegular(size: 12))
                    .foregroundStyle(.neutral7)
                
                if(hasTextBtn) {
                    Text(btnText)
                        .font(.openSansBold(size: 12))
                        .foregroundStyle(.accent)
                        .onTapGesture {
                            
                        }
                }
                
            }
            
        }
    }
}

#Preview {
    SliverAppBarView()
}
