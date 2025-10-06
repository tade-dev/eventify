//
//  EventViewModel.swift
//  eventify
//
//  Created by BSTAR on 03/10/2025.
//

import Foundation
import Combine

class EventViewModel: ObservableObject {
    
    var events: [Event] = [
        .init(text: "Masked Out Party", image: "event1", population: "1054"),
        .init(text: "Weekend Chill Event", image: "event2", population: "4500"),
        .init(text: "Active Rave", image: "event1", population: "122"),
    ]
    
    var myEvents: [Event] = [
        .init(text: "Santa Holiday Party", image: "event1", address: "Area 8, Murtala express way", eventType: .upcoming, date: .now),
        .init(text: "Masked Out Party", image: "event2", address: "Area 8, Murtala express way", eventType: .upcoming, date: .now),
        .init(text: "Santa Holiday Party", image: "event1", address: "Area 8, Murtala express way", eventType: .upcoming, date: .now),
        .init(text: "Masked Out Party", image: "event2", address: "Area 8, Murtala express way", eventType: .upcoming, date: .now),
        .init(text: "Tech Conference", image: "event2", population: "2300", address: "Convention Centre", eventType: .active, date: .now),
        .init(text: "Party with MJ", image: "event1", population: "453", address: "Downtown Hubifty", eventType: .active, date: .now),
        .init(text: "Party with MJ", image: "event1", population: "453", address: "Downtown Hubifty", eventType: .active, date: .now),
        .init(text: "Workshop", address: "Innovation Center", eventType: .drafts, date: .now),
        .init(text: "Product Launch", address: "Innovation Center", eventType: .drafts, date: .now),
        .init(text: "Gala Night", address: "Innovation Center", eventType: .drafts, date: .now),
        .init(text: "Year End Party", population: "2000", address: "City Club", eventType: .past, date: .now),
        .init(text: "Workshop Series", population: "2000", address: "Launching Centre", eventType: .past, date: .now),
    ]
    
}
