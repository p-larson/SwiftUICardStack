//
//  ExampleApp.swift
//  Example
//
//  Created by Peter Larson on 5/28/21.
//

import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        #if DEBUG
        WindowGroup {
            GitHubBanner_Previews.previews
        }
        #else
        WindowGroup {
            CardStackDemoView()
        }
        #endif
        
    }
}
