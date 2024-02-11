//
//  CardView.swift
//  Flashcard
//
//  Created by Paul Leiva on 2/11/24.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    // Add a state managed property that will update when the user taps the card (to reveal the answer)
    @State private var isShowingQuestion = true
    @State private var offset: CGSize = .zero // A state property to store the offset
    
    private let swipeThreshold: Double = 200 // Define a swipeThreshold constant top level
    
    var body: some View {
        ZStack {
            
            // Card background
            ZStack {// Wrap the existing card background in a ZStack in order to position another background behind it
                
                // Back-most card background
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(offset.width < 0 ? .red : .green)
                
                // Front-most card background
                RoundedRectangle(cornerRadius: 25.0)
                //.fill(Color.blue.gradient)
                    .fill(isShowingQuestion ? .blue : .indigo) // update background fill color to differentiate between question and answer
                    .shadow(color: .black, radius: 4, x: -2, y: 2)
                    .opacity(1 - abs(offset.width) / swipeThreshold) // Fade out front-most background as user swipes
                
            }
            
            VStack(spacing: 20) {
                
                // Card type (question vs answer)
                Text("Question")
                    .bold()
                
                // Separator (line)
                Rectangle()
                    .frame(height: 1)
                
                // Card text
                Text(isShowingQuestion ? card.question : card.answer)
                //Text("Located at the southern end of Puget Sound, what is the capital of Washington")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding()
        }
        .frame(width: 300, height: 500)
        .onTapGesture { // a property to change from showing a question or answer when the card is tapped
            isShowingQuestion.toggle()
        }
        
        
        .opacity(3 - abs(offset.width) / swipeThreshold * 3)
        .rotationEffect(.degrees(offset.width / 20.0)) // Add rotation when swiping
        .offset(CGSize(width: offset.width, height: 0))
        .gesture(DragGesture()
            .onChanged { gesture in // onChanged called for every gesture value change, like when the drag translation changes
                let translation = gesture.translation // Get the current translation value of the gesture. (CGSize with width and height)
                print(translation) // Print the translation value
                offset = translation // update the state offset property as the gesture translation changes
            }
        )
    }
}

// Card data model
struct Card {
    let question: String
    let answer: String
    
    static let mockedCards = [
        Card(question: "Located at the southern end of Puget Sound, what is the capitol of Washington?", answer: "Olympia"),
        Card(question: "Which city serves as the capital of Texas?", answer: "Austin"),
        Card(question: "What is the capital of New York?", answer: "Albany"),
        Card(question: "Which city is the capital of Florida?", answer: "Tallahassee"),
        Card(question: "What is the capital of Colorado?", answer: "Denver")

    ]
}

// Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(
            question: "Located at the southern end of Puget Sound, what is the capitol of Washington?",
            answer: "Olympia")
        )
    }
}
