//
//  EventsTile.swift
//  eventify
//
//  Created by BSTAR on 05/10/2025.
//

import SwiftUI

struct EventsTile: View {
    
    var image: Image?
    var date: Date?
    var title: String
    var address: String
    var population: String
    var eventType: EventType
    
    var body: some View {
        
        HStack {
            
            Image("event1")
                .resizable()
                .frame(width: 84, height: 90)
                .cornerRadius(8)
                .padding(.trailing, 10)
            
            buildViewOnEventType(
                type: eventType,
                date: date,
                title: title,
                address: address,
                population: population
            )
            
            Spacer()
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(
            color: .textBlack.opacity(0.06),
            radius: 35,
            x: 0,
            y: 10
        )
        .frame(maxHeight: 106)
        
    }
    
    func buildViewOnEventType(
        type: EventType,
         date: Date?,
         title: String,
         address: String,
         population: String
    ) -> some View {
        switch type {
        case .active:
            return AnyView(OtherEventsView(eventType: type, date: date, title: title, address: address, population: population))
        case .upcoming:
            return AnyView(UpcomingEventView(date: date, title: title, address: address, population: population))
        case .drafts:
            return AnyView(OtherEventsView(eventType: type, date: date, title: title, address: address, population: population))
        case .past:
            return AnyView(OtherEventsView(eventType: type, date: date, title: title, address: address, population: population))
        }
    }
    
}

struct UpcomingEventView: View {
    var date: Date?
    var title: String
    var address: String
    var population: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(date?.toStandardDateTime() ?? "N/A")
                .font(.openSansMedium(size: 12))
                .foregroundStyle(.accent)
            
            Text(title)
                .font(.openSansSemiBold(size: 16))
                .foregroundStyle(.textBlack)
            
            Spacer()
            
            HStack(spacing: 5) {
                Image("location")
                    .renderingMode(.template)
                    .foregroundStyle(.accent)
                Text(address)
                    .font(.openSansRegular(size: 12))
                    .foregroundStyle(.neutral7)
                
            }
        }
    }
}

struct OtherEventsView: View {
    
    var eventType: EventType
    var date: Date?
    var title: String
    var address: String
    var population: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {

            HStack {
                
                Text(title)
                    .font(.openSansMedium(size: 14))
                    .foregroundStyle(.textBlack)
                
                Spacer()
                
                EventTypeLabel(eventType: eventType)
                
            }
            
            HStack(spacing: 10) {
                HStack(spacing: 5) {
                    Image("calendar")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundStyle(eventType == .active ? .accent : .neutral7)
                        .frame(width: 14, height: 14)
                    Text("Mon, Jan 16")
                        .font(.openSansRegular(size: 12))
                        .foregroundStyle(.neutral7)
                }
                
                HStack(spacing: 5) {
                    Image("time")
                        .renderingMode(.template)
                        .foregroundStyle(eventType == .active ? .accent : .neutral7)
                    Text("12:00 PM")
                        .font(.openSansRegular(size: 12))
                        .foregroundStyle(.neutral7)
                }
            }
            
            HStack(spacing: 5) {
                Image("location")
                    .renderingMode(.template)
                    .foregroundStyle(eventType == .active ? .accent : .neutral7)
                Text("Convention Centre")
                    .font(.openSansRegular(size: 12))
                    .foregroundStyle(.neutral7)
            }
            
            HStack(spacing: 5) {
                Image("user-group")
                    .renderingMode(.template)
                    .foregroundStyle(eventType == .active ? .accent : .neutral7)
                Text("\(population) Attendees")
                    .font(.openSansRegular(size: 12))
                    .foregroundStyle(.neutral7)
            }
        }
    }
}

struct EventTypeLabel: View {
    var eventType: EventType
    
    var body: some View {
        Text(
            eventType == EventType.active ? "Active" : eventType == EventType.drafts ? "Drafts" : eventType == EventType.past ? "Past" : "Live"
        )
        .font(.openSansRegular(size: 10))
        .foregroundColor(Color(hex: eventType == .active ? 0xFF005C5C : 0xFF777777))
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .background(Color(hex: eventType == .active ? 0xFFCCF1F1 : 0xFFF4F4F4))
        .cornerRadius(50)
    }
}

#Preview {
//    EventsTile()
}
