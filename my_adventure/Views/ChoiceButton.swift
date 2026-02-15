//
//  ChoiceButton.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import SwiftUI

struct ChoiceButton: View {
    let choice: AdventureChoice
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(choice.text)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.accentColor)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ChoiceButton(
        choice: AdventureChoice(text: "Make a choice", nextSceneId: "next"),
        action: { }
    )
    .padding()
}
