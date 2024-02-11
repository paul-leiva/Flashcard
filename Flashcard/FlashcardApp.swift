//
//  FlashcardApp.swift
//  Flashcard
//
//  Created by Paul Leiva on 2/10/24.
//

import SwiftUI

// The @main attribute indicates that FlashcardApp is the entry point for the app.
@main
struct FlashcardApp: App {
    // The `body` property is required for any SwiftUI App. It defines the content of the app.
    var body: some Scene {
        // A Scene represents a single user interface within the app.
        WindowGroup {
            // The WindowGroup represents the main window of the app
            ContentView()
            // ContentView is the main view or the root view of the app.
            // This is where you start defining the structure and content of your app's user interface.
        }
    }
}
