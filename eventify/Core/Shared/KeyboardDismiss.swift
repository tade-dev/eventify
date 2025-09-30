//
//  KeyboardDismiss.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import Foundation
import UIKit

func dismissKeyboardWhenTappedAround() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
