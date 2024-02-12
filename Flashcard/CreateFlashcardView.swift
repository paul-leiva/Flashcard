//
//  CreateFlashcardView.swift
//  Flashcard
//
//  Created by Paul Leiva on 2/11/24.
//

import SwiftUI

struct CreateFlashcardView: View {
    
    var onCreate: (Card) -> Void // Closure to pass back the created flashcard
    
    @Environment(\.dismiss) private var dismiss // The dismiss value from the environment. Allows for programmatic dismissal
    
    @State private var questionText = "" // Text property for question text field
    @State private var answerText = "" // Text property for answer text field
    
    var body: some View {
        VStack(spacing: 60) { // Top level VStack, separates the button from the text fields
            HStack { // HStack for the button section
                Spacer() // Spacer on the left side of the HStack expands to position button furthest right
                
                // Save button
                Button("Save") {
                    onCreate(Card(question: questionText, answer: answerText)) // Call onCreate closure passing in a created card
                    dismiss() // Dismiss the view
                }
                .disabled(questionText.isEmpty || answerText.isEmpty) // Disabled the button if either text field is empty
            }
            VStack { // VStack for the text fields
                // Question text field
                TextField("Add a question...", text: $questionText, axis: .vertical) // Pass in $questionText as binding using '$'
                TextField("Add an answer...", text: $answerText, axis: .vertical) // Vertical axis allows text to wrap and expand vertically
            }
            .textFieldStyle(.roundedBorder) // Apply a textFieldStyle with rounded border to both  TextFields
            .font(.title) // Apply title font to both TextFields
            
            Spacer() // Spacer expands to fill empty space below TextFields and button, positioning them at the top
        }
        .padding()
    }
}

// Preview
struct CreateFlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlashcardView { card in
            print("New card created: \(card)") // prints added card to the console on save button tap
        }
    }
}
