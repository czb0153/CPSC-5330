//
//  ChoicesView.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import SwiftUI

struct ChoicesView: View {
    let choices: [AdventureChoice]
    let onChoice: (AdventureChoice) -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Text("What do you do?")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ForEach(choices) { choice in
                ChoiceButton(choice: choice, action: {onChoice(choice)})
            }
        }
    }
}


#Preview {
    ChoicesView(
        choices: [
            AdventureChoice(text: "Option 1", nextSceneId: "next"),
            AdventureChoice(text: "Option 2", nextSceneId: "next"),
            AdventureChoice(text: "Option 3", nextSceneId: "next")
        ],
        onChoice: {_ in}
    )
    .padding()
}
