//
//  SwiftUICardStack_ExampleUITests.swift
//  SwiftUICardStack-ExampleUITests
//
//  Created by Peter Larson on 5/30/21.
//

import XCTest
import SwiftUICardStack
import SnapshotTesting

class SwiftUICardStack_ExampleUITests: XCTestCase {

    // Generates a snapshot of the view @1280x640 png
    func testGitHubSocialPreview() throws {

        let view = GitHubBanner_Previews
            .previews
            .frame(width: 1280, height: 640)
        
        assertSnapshot(matching: view, as: .image)
    }
}
