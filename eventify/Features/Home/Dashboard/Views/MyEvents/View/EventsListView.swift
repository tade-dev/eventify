//
//  EventsListView.swift
//  eventify
//
//  Created by BSTAR on 05/10/2025.
//

import SwiftUI

struct EventsListView: View {
    
    var title: String
    var events: [Event]
    
    var body: some View {
        ZStack{
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                AppBar(
                    text: title,
                    backgroundColor: .white
                )
                
                Spacer()
                
                if events.isEmpty == false {
                    ScrollView {
                        VStack {
                            ForEach(events, id: \.self) { event in
                                EventsTile(title: event.text, address: event.address ?? "Unknown", population: event.population ?? "", eventType: event.eventType ?? .upcoming)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 22)
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                
            }
            
            if events.isEmpty {
                EmptyEventsView(
                    title: "No \(title)",
                    description: "If you have any \(title.lowercased()), it will be displayed here."
                )
            }

        }
        .safeAreaInset(edge: .bottom) {
            if(events.isEmpty) {
                PrimaryButton(text: "Explore Events", color: .accent) {
                    
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct EmptyEventsView : View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            
            Image("empty_event")
                .padding(.bottom, 10)
            
            Text(title)
                .font(.openSansBold(size: 24))
                .foregroundStyle(.textBlack)
                .padding(.bottom, 1)
            
            Text(description)
                .font(.openSansRegular(size: 16))
                .foregroundStyle(.neutral7)

        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    EventsListView(title: "Upcoming Events", events: [
        
    ])
}
