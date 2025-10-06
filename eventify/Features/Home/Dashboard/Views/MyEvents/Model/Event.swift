//
//  Event.swift
//  eventify
//
//  Created by BSTAR on 03/10/2025.
//

import Foundation

struct Event: Hashable {
    var text: String
    var image: String?
    var population: String?
    var address: String?
    var eventType: EventType?
    var date: Date?
    
    init(text: String, image: String? = nil, population: String? = nil, address: String? = nil, eventType: EventType? = nil, date: Date? = nil) {
        self.text = text
        self.image = image
        self.population = population
        self.address = address
        self.eventType = eventType
        self.date = date
    }
    
}

enum EventType {
    case active, past, drafts, upcoming
}

