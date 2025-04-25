//
//  ScoreView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    let maxTurns: Int
    var body: some View {
        Text("Score: \(score) out of \(maxTurns)")
            .bold()
            .font(.largeTitle)
    }
}

#Preview {
    ScoreView(
        score: 3,
        maxTurns: 5
    )
}
