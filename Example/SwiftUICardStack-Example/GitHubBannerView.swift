//
//  GitHubSocialPreview.swift
//  SwiftUICardStack-Example
//
//  Created by Peter Larson on 5/30/21.
//

import SwiftUI
import SwiftUICardStack

// 1280×640

struct GitHubBannerView: View {
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("🗂SwiftUIStackView")
                        .font(.system(size: 48, weight: .regular, design: .default))
                        
                    Text("A interactive way to peek and sort through a collection")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }
                
                CardStack(
                    // Data
                    items: mock,
                    // Triggered when User gestures a detail inspection of a item.
                    selection: .constant(nil),
                    // View representation for Data.
                    builder: CardView.init(model:)
                )
                .frame(width: 400)
                .redacted(reason: .placeholder)
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("@p-larson")
                }
            }
            .padding()
        }
    }
}

public struct GitHubBanner_Previews: PreviewProvider {
    public static var previews: some View {
        GitHubBannerView()
            .previewLayout(.fixed(width: 1280, height: 640))
        
    }
}
