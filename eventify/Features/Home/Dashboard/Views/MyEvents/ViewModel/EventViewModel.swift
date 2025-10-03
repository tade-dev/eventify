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
    
}
