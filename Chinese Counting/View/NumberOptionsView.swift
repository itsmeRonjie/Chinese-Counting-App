//
//  NumberOptionsView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct NumberOptionsView: View {
    let numbers: [Int]
    let answer: Int
    
    var body: some View {
        Grid(horizontalSpacing: 30, verticalSpacing: 30){
            GridRow {
                RoundedRectangleView(
                    value: numbers[0],
                    answer: 10,
                    color: .blue
                )
                RoundedRectangleView(
                    value: numbers[1],
                    answer: 10,
                    color: .red
                )
            }
            GridRow {
                RoundedRectangleView(
                    value: numbers[2],
                    answer: 10,
                    color: .orange
                )
                RoundedRectangleView(
                    value: numbers[3],
                    answer: 10,
                    color: .indigo
                )
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}


struct RoundedRectangleView: View {
    let value: Int
    let answer: Int
    let color: Color
    @Environment(GameViewModel.self) var gameVM
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(color.gradient)
            Text("\(value)")
                .foregroundStyle(.background)
                .font(.title)
        }
        .frame(
            width: 150,
            height: 150
        )
        .onTapGesture {
            if answer == value {
                self.gameVM.increaseScore()
            } else {
                self.gameVM.incorrectSound()
            }
            self.gameVM.gameModel.nextTurn()
        }
    }
}

#Preview {
    NumberOptionsView(
        numbers: [1, 3, 7, 10],
        answer: 10
    )
    .environment(GameViewModel())
}
