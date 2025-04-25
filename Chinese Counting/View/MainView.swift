//
//  ContentView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/24/25.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gameVM
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Joy") {
                gameVM.randomExpressionOfJoy()
            }
            .padding()
            
            Button("Incorrect") {
                gameVM.incorrectSound()
            }
            .padding()
            
                        
            Button("7") {
                gameVM.playNumber(num: 9)
            }
            .padding()
            
            Button("30") {
                gameVM.playNumber(num: 30)
            }
            .padding()
            
            Button("76") {
                gameVM.playNumber(num: 76)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
