//
//  GameViewModel.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/24/25.
//

import Foundation
import Observation
import AVFoundation

@Observable
class GameViewModel {
    var gameModel: GameModel = .defaultModel
    var audioPlayer: AVAudioPlayer?
    
    func randomExpressionOfJoy() {
        playSounds(name: ["awesome", "bell", "correct", "yes", "whoop"].randomElement() ?? "whoop")
    }
    
    func incorrectSound() {
        playSounds(name: ["incorrectAnswer", "OhNo", "weak"].randomElement() ?? "incorrectAnswer")
    }
    
    func playNumber(num: Int) {
        // TODO: Play Number
    }
    
    private func playDigit(num: Int) {
        // TODO: Play Digit
    }
    
    private func digitToName(digit: Int) -> String? {
        return nil
        // TODO: Digit to Name
    }
    
    private func playSounds(name: String, ext: String = "aiff") {
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext) else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
