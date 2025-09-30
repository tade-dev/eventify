//
//  DashboardView.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        DashboardTabView(viewModel: viewModel) {
            viewModel.dashboardViews[viewModel.dashboardViewIndex]
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DashboardView()
}
