//
//  AdventureView.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import SwiftUI

struct AdventureView: View {
    @ObservedObject var controller: AdventureController
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                    SceneHeaderView(scene: controller.currentScene)
                    
                    SceneDescriptionView(scene: controller.currentScene)
                    
                    if controller.isGameOver {
                        EndGameView(
                            didWin: controller.didWin,
                            onRestart: { controller.restartAdventure() }
                        )
                    } else {
                        ChoicesView(
                            choices: controller.currentScene.choices,
                            onChoice: { choice in
                                withAnimation {
                                    controller.makeChoice(choice)
                                }
                            }
                        )
                    }
                    Spacer(minLength: 20)
                }
                .padding()
                .frame(minHeight: geometry.size.height)
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    AdventureView(controller: AdventureController())
}
