//
//  ContentView.swift
//  Example
//
//  Created by Peter Larson on 5/28/21.
//

import SwiftUI
import SwiftUICardStack

// MARK: Previews

// Mock Card Model

struct CardTheme: Equatable, Hashable {
    let primary, secondary: UIColor
}

extension CardTheme {
    static let executive = CardTheme(primary: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), secondary: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    static let travel = CardTheme(primary: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), secondary: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    static let gift = CardTheme(primary: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), secondary: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    static let food = CardTheme(primary: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), secondary: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
}


struct CardModel: Equatable, Identifiable, Hashable {
    let name: String
    let number: UInt
    let theme: CardTheme
    let id = UUID()
}

let mock = [
    CardModel(name: "Executive Card", number: 1234567812345678, theme: .executive),
    CardModel(name: "Travel Card", number: 1234567812345678, theme: .travel),
    CardModel(name: "Gift Card", number: 1234567812345678, theme: .gift),
    CardModel(name: "Food Card", number: 1234567812345678, theme: .food)
]

struct CardView: View {
    let model: CardModel
    let id = UUID()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(model.theme.primary), Color(model.theme.secondary)]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            
            VStack {
                HStack {
                    Text(model.name.uppercased())
                        .font(
                            .system(size: 20, weight: .regular, design: .monospaced)
                        )
                    Spacer()
                    Text("LARSON")
                        .font(.system(.callout, design: .monospaced))
                        .blendMode(.luminosity)
                        .foregroundColor(.white)
                        .opacity(1/2)
                }
                Spacer()
                HStack(spacing: 0) {
                    Text(model.number.description)
                        .font(
                            .system(size: 16, weight: .bold, design: .rounded)
                        )
                        .kerning(1.5)
                    Spacer()
                    Circle()
                        .strokeBorder(lineWidth: 1.5)
                        .frame(width: 30, height: 30)
                        .offset(x: 15)
                    Circle()
                        .strokeBorder(lineWidth: 1.5)
                        .frame(width: 30, height: 30)
                }
            }
            .foregroundColor(.white)
            .padding(20)
        }
        .frame(height: 200)
    }
}


func cardDetail(for item: CardModel) -> some View {
    VStack {
        Text("Details")
            .font(.title2)
        CardView(model: item)
    }
    .padding(.horizontal, 20)
}

struct CardStackDemoView: View {
    @State var selected: CardModel? = nil
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("SwiftUICardStack Example")
                        .font(.title)
                    // The magic
                    CardStack(
                        // Data
                        items: mock,
                        // Triggered when User gestures a detail inspection of a item.
                        selection: $selected,
                        // View representation for Data.
                        builder: CardView.init(model:)
                    )
                    CardStack(items: mock, selection: $selected) { item in
                        Color.red
                    }
                    
                    Text("plarson/SwiftUICardStack")
                        .font(.caption)
                    Spacer()
                }
                .padding()
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
            }
        }
        // Detail View for Selected Item, triggered by CardStack#showDetail
        .sheet(item: $selected) { item in
            VStack(alignment: .leading) {
                HStack {
                    Text("Some Detail View:")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Text(item.name.description)
                        .font(.footnote)
                        .italic()
                    Spacer()
                }
                CardView(model: item)
            }
            .padding(20)
        }
    }
}

struct CardStackPreviews: PreviewProvider {
    static var previews: some View {
        CardStackDemoView()
    }
}
