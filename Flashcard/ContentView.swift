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
    // Add a @State property to store an array of card and initialize it with the mocked cards
    @State private var cards: [Card] = Card.mockedCards
    
    // Define the body property, required by View protocol
    // Return any object that conforms to the View protocol
    var body: some View {
        // Create and iterate over the deck of cards
        ZStack {
            ForEach(0..<cards.count, id: \.self) { index in
                CardView(card: cards[index])
                    .rotationEffect(.degrees(Double(cards.count - 1 - index) * -5))
            }
        }
    }
}

// Preview the ContentView in the canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
