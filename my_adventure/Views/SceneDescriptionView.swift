//
//  SceneDescriptionView.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import SwiftUI

struct SceneDescriptionView: View {
    let scene: AdventureScene
    
    var body: some View {
        Text(scene.description)
            .font(.body)
            .multilineTextAlignment(.center)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
            )
    }
}

#Preview {
    SceneDescriptionView(scene: AdventureScene(
        id: "test",
        title: "Test",
        description: "Test for description scene."
    ))
    .padding()
    .background(Color(.systemBackground))
}
