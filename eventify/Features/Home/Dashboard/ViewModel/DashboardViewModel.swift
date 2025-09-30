//
//  DashboardViewModel.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import Foundation
import Combine
import SwiftUI

class DashboardViewModel: ObservableObject {
    
    @Published var dashboardViewIndex: Int = 0
    let dashboardTabs: [DashboardTabModel] = [
        .init(title: "Home", image: "home"),
        .init(title: "Explore", image: "explore"),
        .init(title: "My Events", image: "calendar"),
        .init(title: "Updates", image: "notification"),
        .init(title: "Account", hasProfileImage: true)
    ]
    
    let dashboardViews: [AnyView] = [
        AnyView(HomeView()),
        AnyView(ExploreView()),
        AnyView(MyEventView()),
        AnyView(UpdatesView()),
        AnyView(AccountView())
    ]
    
}
