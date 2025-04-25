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
    @State private var done: Bool = false
    
    var gameOver: Bool {
        gameVM.gameModel.gameOver
    }

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
                
                if let chineseNum = gameVM.gameModel.answer.num99ToChinese() {
                    Text(chineseNum.chinese)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(chineseNum.pinyin)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .opacity(showPinyin ? 1 : 0)
                }
                NumberOptionsView(
                    numbers: gameVM.gameModel.alternatives,
                    answer: gameVM.gameModel.answer
                )
                .onChange(of: gameVM.gameModel.turns) { _, _ in
                    gameVM.gameModel.generateNewProblem()
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $done) {
            GameOverView()
        }
        .fullScreenCover(isPresented: $showSettings) {
            SettingsView(
                showSettings: $showSettings,
                volume: gameVM.gameModel.volume * 100
            )
        }
        .onChange(of: gameOver) { _, _ in
            done = gameOver
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
