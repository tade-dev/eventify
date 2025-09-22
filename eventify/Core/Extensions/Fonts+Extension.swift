//
//  Fonts+Extension.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import SwiftUI

extension Font {
    static func openSans(_ weight: OpenSansWeight, size: CGFloat) -> Font {
        switch weight {
        case .regular:
            return .custom("OpenSans-Regular", size: size)
        case .medium:
            return .custom("OpenSans-Medium", size: size)
        case .semiBold:
            return .custom("OpenSans-SemiBold", size: size)
        case .bold:
            return .custom("OpenSans-Bold", size: size)
        }
    }

    enum OpenSansWeight {
        case regular, medium, semiBold, bold
    }

    static func openSansRegular(size: CGFloat) -> Font {
        .custom("OpenSans-Regular", size: size)
    }

    static func openSansMedium(size: CGFloat) -> Font {
        .custom("OpenSans-Medium", size: size)
    }

    static func openSansSemiBold(size: CGFloat) -> Font {
        .custom("OpenSans-SemiBold", size: size)
    }

    static func openSansBold(size: CGFloat) -> Font {
        .custom("OpenSans-Bold", size: size)
    }
}
