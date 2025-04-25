//
//  ContentView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/24/25.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gameVM
    @State var showSettings: Bool = false

    var body: some View {
        ZStack {
            GearIconView(showSettings: $showSettings)
            VStack {
                ScoreView(
                    score: gameVM.gameModel.score,
                    maxTurns: gameVM.gameModel.maxTurns
                )
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
