//
//  CardStackSource.swift
//  SwiftUICardStack
//
//  Created by Peter Larson on 5/28/21.
//

import SwiftUI

@available(iOS 13.0, *)
class CardStackSource<Item, ItemView>: ObservableObject where ItemView: View {
    // Constants
    let builder: (Item) -> ItemView
    // Data
    private(set) var items: Array<Item>
    // The Power of Keypaths:
    private(set) lazy var views: Array<AnyView> = items.map(builder).map(\.eraseToAnyView)
    
    public init(
        items: Array<Item>,
        builder: @escaping (Item) -> ItemView
    ) {
        self.items = items
        self.builder = builder
    }
}

