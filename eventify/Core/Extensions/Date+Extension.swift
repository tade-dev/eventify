//
//  Date+Extension.swift
//  eventify
//
//  Created by BSTAR on 05/10/2025.
//

import Foundation

extension Date {
    func toStandardDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d"
        let datePart = dateFormatter.string(from: self)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        let timePart = timeFormatter.string(from: self)
        
        return "\(datePart) •\n\(timePart)"
    }
}
