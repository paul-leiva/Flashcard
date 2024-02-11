//
//  ContentView.swift
//  Flashcard
//
//  Created by Paul Leiva on 2/10/24.
//

// Import the SwiftUI Framework in any file you want to use SwiftUI
import SwiftUI

// Define the ContentView structure, which conforms to the View protocol
struct ContentView: View {
    // Define the body property, required by View protocol
    // Return any object that conforms to the View protocol
    var body: some View {
        // Vertical stack (VStack) to arrange views vertically
        VStack {
            // Image view with the system's globe icon
            Image(systemName: "globe")
                .imageScale(.large) // Set the image scale to large
                .foregroundColor(.accentColor) // set the image color to the tint color
            
            // Text view displaying the "Hello, world!" string
            Text("Hello, world!")
        }
        .padding() // Apply padding to the entire VStack
    }
}

// Preview the ContentView in the canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
