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
    @State private var deckId: Int = 0
    
    // Add a @State property to store an array of card and initialize it with the mocked cards
    @State private var cards: [Card] = Card.mockedCards
    
    @State private var cardsToPractice: [Card] = [] // Store cards removed from the cards array (more practice, left swipes)
    @State private var cardsMemorized: [Card] = [] // Stores cards that are memorized (right swipes)
    
    // Define the body property, required by View protocol
    // Return any object that conforms to the View protocol
    var body: some View {
        // Create and iterate over the deck of cards
        // Card deck
        ZStack {
            
            // Reset buttons
            VStack { // VStack to show buttons arranged vertically behind cards
                Button("Reset!") { // Reset button with tital and action
                    cards = cardsToPractice + cardsMemorized // Reset the cards array with cardsToPractice and cardsMemorized
                    cardsToPractice = [] // set both cardsToPractice and cardsMemorized to empty after reset
                    cardsMemorized = []
                    // deckId += 1 // (NOT WORKING)
                }
                .disabled(cardsToPractice.isEmpty && cardsMemorized.isEmpty)
                
                Button("More Practice") {
                    cards = cardsToPractice // Reset the cards array with cardsToPractice
                    cardsToPractice = [] // Set the cardsToPractice to empty after reset
                    // deckId += 1 // (NOT WORKING)
                }
                .disabled(cardsToPractice.isEmpty)
            }
            
            // Cards
            ForEach(0..<cards.count, id: \.self) { index in
                CardView(card: cards[index],
                    onSwipedLeft: { // Add swiped left property (Need More Practice)
                        let removedCard = cards.remove(at: index) // Remove the card from the cards array
                        cardsToPractice.append(removedCard) // Add removed cards to practice array
                    },
                    onSwipedRight: { // Add swiped right property (Memorized)
                        let removedCard = cards.remove(at: index) // Remove the card from the cards array
                    cardsMemorized.append(removedCard) // Add removed card to memorized cards array
                    }
                )
                    .rotationEffect(.degrees(Double(cards.count - 1 - index) * -5))
            }
        }
        // .animation(.bouncy, value: cards) // (NOT WORKING)
        .id(deckId)
    }
}

// Preview the ContentView in the canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
