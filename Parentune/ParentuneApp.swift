//
//  ParentuneApp.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import SwiftUI

// Main entry point for the SwiftUI application.
@main
struct ParentuneApp: App {
    // Defines the body of the application. In SwiftUI, the body property is required for all views,
    // including the main app structure.
    var body: some Scene {
        // A scene that represents a group of windows in the app. A window group creates a new
        // window for each instance of the view you provide.
        WindowGroup {
            // The root view of the application. ContentView is assumed to be a user-defined
            // SwiftUI view. This is where you define the user interface of your app.
            ContentView()
        }
    }
}

