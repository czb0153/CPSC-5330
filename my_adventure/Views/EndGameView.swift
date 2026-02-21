//
//  EndGameView.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import SwiftUI

struct EndGameView: View {
    let didWin: Bool
    let onRestart: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: didWin ? "part.popper.fill" : "cloud.rain.fill")
                .font(.system(size: 50))
                .foregroundColor(didWin ? .yellow : .gray)
            
            Text(didWin ? "You Won!" : "Game Over!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(didWin ? .green : .red)
            
            Button(action: onRestart) {
                Label("Play Again", systemImage: "arrow.clockwise")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green)
                    )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0 , y: 5)
        )
    }
}

#Preview {
    VStack(spacing: 40) {
        EndGameView(didWin: true, onRestart: { })
        EndGameView(didWin: false, onRestart: { })
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
