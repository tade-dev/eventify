//
//  DashboardView.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var dashboardViewModel = DashboardViewModel()
    @StateObject private var eventViewModel = EventViewModel()
    
    var body: some View {
        DashboardTabView(viewModel: dashboardViewModel) {
            dashboardViewModel.dashboardViews[dashboardViewModel.dashboardViewIndex]
        }
        .navigationBarBackButtonHidden()
        .environmentObject(dashboardViewModel)
        .environmentObject(eventViewModel)
    }
}

#Preview {
    DashboardView()
}
