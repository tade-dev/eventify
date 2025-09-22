//
//  OnboardingViewModel.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    
    @Published var currentIndex: Int = 0
    let onboardingViews: [Onboarding] = [
        .init(title: "Find Exciting Events", description: "Browse a wide range of events, from concerts to workshops. Whatever you’re looking for, we’ve got it!", image: "onboarding_1"),
        .init(title: "RSVP & Book Tickets", description: "Easily RSVP to events and secure your spot. Book tickets directly through the app!", image: "onboarding_2"),
        .init(title: "Get Personalized Recommendations", description: "The more you explore, the better your recommendations. Find events that match your interests!", image: "onboarding_3")
    ]
    
}
