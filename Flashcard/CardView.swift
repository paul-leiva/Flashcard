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
    
    var body: some View {
        ZStack {
            
            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                //.fill(Color.blue.gradient)
                .fill(isShowingQuestion ? .blue : .indigo) // update background fill color to differentiate between question and answer
                .shadow(color: .black, radius: 4, x: -2, y: 2)
            
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
    }
}

// Card data model
struct Card {
    let question: String
    let answer: String
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
