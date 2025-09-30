//
//  AuthenticationViewModel.swift
//  eventify
//
//  Created by BSTAR on 24/09/2025.
//

import Foundation
import Combine

class AuthenticationViewModel: ObservableObject {
    
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var fullName: String = ""
    @Published var rememberMe: Bool = false
    @Published var agreedToTerms: Bool = false
    @Published var isLoginLoading = false
    @Published var isSignUpLoading = false
    @Published var otpCode = ""
    @Published var searchLocationText = ""
    
    @Published var selectedSignUpViewIndex = 0
    
    
}
