//
//  DashboardTabModel.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import Foundation

struct DashboardTabModel {
    let title: String
    let image: String?
    let hasProfileImage: Bool
    
    init(title: String, image: String? = nil, hasProfileImage: Bool = false) {
        self.title = title
        self.image = image
        self.hasProfileImage = hasProfileImage
    }
    
}
