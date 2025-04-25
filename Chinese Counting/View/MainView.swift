//
//  ContentView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/24/25.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gameVM
    @State private var showSettings: Bool = false
    @State private var showPinyin: Bool = true

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ScoreView(
                        score: gameVM.gameModel.score,
                        maxTurns: gameVM.gameModel.maxTurns
                    )
                    Spacer()
                    GearIconView(showSettings: $showSettings)
                }
    
                Toggle(
                    showPinyin ? "Hide PinYin" : "Show Pinyin",
                    isOn: $showPinyin.animation()
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
