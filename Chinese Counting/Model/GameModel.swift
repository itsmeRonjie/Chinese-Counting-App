//
//  GameModel.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/24/25.
//

import Foundation

struct GameModel {
    var score: Int
    let maxTurns: Int
    var volume: Float
    var turns: Int
    var answer: Int
    var alternatives: [Int]
    
    var gameCompleted: Bool {
        turns >= maxTurns
    }
    
    var gameOver: Bool {
        score < 0 || gameCompleted
    }
    
    mutating func increaseScore() {
        score += 1
    }
    
    mutating func nextTurn() {
        turns += 1
    }
    
    mutating func generateNewProblem() {
        alternatives = Int.generateUniqueNumbers(count: 4)
        answer = alternatives[3]
        alternatives = alternatives.shuffled()
    }
    
    mutating func resetGame() {
        let alters = Int.generateUniqueNumbers(count: 4)
        let answer = alters[3]
        self = GameModel(
            score: 0,
            maxTurns: 5,
            volume: self.volume,
            turns: 0,
            answer: answer,
            alternatives: alters
        )
    }
    
    static var defaultModel: GameModel {
        .init(
            score: 0,
            maxTurns: 5,
            volume: 1,
            turns: 0,
            answer: 10,
            alternatives: [1, 3, 7, 10].shuffled()
        )
    }
}
