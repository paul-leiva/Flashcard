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
        ZStack {
            
            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.blue.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)
            
            VStack(spacing: 20) {
                
                // Card type (question vs answer)
                Text("Question")
                    .bold()
                
                // Separator (line)
                Rectangle()
                    .frame(height: 1)
                
                // Card text
                Text("Located at the southern end of Puget Sound, what is the capital of Washington")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding()
        }
        .frame(width: 300, height: 500)
    }
}

// Preview the ContentView in the canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
