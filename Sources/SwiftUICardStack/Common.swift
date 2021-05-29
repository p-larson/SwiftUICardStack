//
//  Common.swift
//  SwiftUICardStack
//
//  Created by Peter Larson on 5/28/21.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    // For KeyPaths and easier compiling, less type guessing and more assuming.
    var eraseToAnyView: AnyView {
        return AnyView(self)
    }
}

extension CGFloat {
    func capped(by range: ClosedRange<CGFloat>) -> CGFloat {
        guard !range.contains(self) else {
            return self
        }
        
        return self < range.lowerBound ? range.lowerBound : range.upperBound
    }
}
