//
//  SceneHeaderView.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import SwiftUI

struct SceneHeaderView: View {
    let scene: AdventureScene
    
    var body: some View {
        VStack(spacing: 12) {
            if let imageName = scene.imageName {
                Image(systemName: imageName)
                    .font(.system(size: 60))
                    .foregroundColor(.accentColor)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.accentColor.opacity(0.1))
                    )
            }
            
            Text(scene.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
        .padding(.top)
    }
}

#Preview {
    SceneHeaderView(scene: AdventureScene(
        id: "test",
        title: "Test Scene",
        description: "A test description",
        imageName: "star.fill"
    ))
}
