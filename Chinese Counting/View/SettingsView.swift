//
//  SettingsView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(GameViewModel.self) var gameVM
    
    @Binding var showSettings: Bool
    @State var volume: Float
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Volume")
                            Spacer()
                            Text("\(Int(volume))")
                        }
                        Slider(value: ($volume), in: 0...100, step: 1)
                    } header: {
                        Text("Audio Settings")
                    }
                }
                
                Button {
                    gameVM.gameModel.volume = volume / 100
                    showSettings.toggle()
                } label: {
                    Text("Ok")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(
        showSettings: .constant(true),
        volume: 70
    )
    .environment(GameViewModel())
}
