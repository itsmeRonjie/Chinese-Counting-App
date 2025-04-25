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
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
