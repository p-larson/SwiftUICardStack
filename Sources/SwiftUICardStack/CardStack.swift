//
//  CardStack.swift
//  SwiftUICardStack
//
//  Created by Peter Larson on 5/28/21.
//

import SwiftUI

// MARK: SwiftUICardStackView

@available(iOS 13.0, *)
public struct CardStack<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    @ObservedObject var source: CardStackSource<Item, ItemView>
    
    // MARK: Constants
    
    var maxItemsDisplayed: Int = 4
    var scaleDecrement: CGFloat = 0.05
    var verticalSpacing: CGFloat = 20.0
    var expandedVerticalSpacing: CGFloat = 100.0
    var animationSpeedLag: Double = 0.1
    var minimumAnimationSpeed: Double = 0.1
        
    // MARK: State
    
    @State var isStacked = true
    @Binding var selection: Item
    
    // MARK: Init
    
    public init(
        items: [Item],
        selection: Binding<Item>,
        builder: @escaping (Item) -> ItemView
    ) {
        self._selection = selection
        self._source = ObservedObject(
            wrappedValue: CardStackSource<Item, ItemView>(
                items: items,
                builder: builder
            )
        )
    }
    
    public var body: some View {
        ZStack {
            ForEach(source.items.indices, content: build)
        }
        .padding(.top, isStacked ? verticalSpacing * CGFloat(maxItemsDisplayed - 1) : expandedVerticalSpacing * CGFloat(source.items.count - 1))
        .frame(
            maxWidth: isStacked ? nil : .infinity,
            maxHeight: isStacked ? nil : .infinity
        )
        .eraseToAnyView
    }
    
    
    // MARK: Content
    
    func build(index: Int) -> AnyView {
        let item = source.items[index]
        let view: AnyView = source.views[index]
        
        // Variables
        let yOffset: CGFloat = (isStacked ? verticalSpacing : expandedVerticalSpacing) * CGFloat(-index)
        
        return view
            .rotation3DEffect(
                isStacked ? .zero : .radians(.pi / 9),
                axis: (x: -1.0, y: 0.0, z: 0.0),
                anchor: .top,
                perspective: 1
            )
            .scaleEffect(isStacked ? 1.0 - (scaleDecrement * CGFloat(index)) : 1)
            .offset(y: yOffset)
            .zIndex(Double(source.items.count-index))
            .opacity(isStacked ? (!(index < maxItemsDisplayed) ? 0 : 1) : 1)
            .shadow(radius: 5)
            .onTapGesture {
                withAnimation(Animation.spring().speed(2)) {
                    isStacked.toggle()
                }
            }
            .onLongPressGesture {
                selection = item
            }
            .eraseToAnyView
        
    }
}
