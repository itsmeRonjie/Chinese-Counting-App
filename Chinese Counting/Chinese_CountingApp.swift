//
//  Chinese_CountingApp.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/24/25.
//

import SwiftUI

@main
struct Chinese_CountingApp: App {
    @State private var gameVM: GameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(gameVM)
        }
    }
}
