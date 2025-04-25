//
//  GameOverView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct GameOverView: View {
    @Environment(GameViewModel.self) var gameVM

    var body: some View {
        ZStack {
            Image(
                [
                    .china1, .china2,
                    .china3, .china4,
                    .china5, .china6,
                    .china7
                ].randomElement() ?? .china1
            )
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .opacity(0.9)
            
            VStack {
                VStack {
                    Text("Game Over")
                    Text(
                        "You solved \(gameVM.gameModel.score) out of \(gameVM.gameModel.maxTurns)!"
                    )
                    Text("Tap anywhere to start again!")
                        .font(.title)
                        .fontWeight(.regular)
                        .shadow(radius: 5)
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.foreground)
                .padding()
                .background(Material.ultraThin, in: RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.foreground, lineWidth: 1)
                }

                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            gameVM.gameModel.resetGame()
        }
    }
}

#Preview {
    GameOverView()
    .environment(GameViewModel())
}
