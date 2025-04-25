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
    private var audioPlayer: AVAudioPlayer?
    
    func randomExpressionOfJoy() {
        playSounds(name: ["awesome", "bell", "correct", "yes", "whoop"].randomElement() ?? "whoop")
    }
    
    func incorrectSound() {
        playSounds(name: ["incorrectAnswer", "OhNo", "weak"].randomElement() ?? "incorrectAnswer")
    }
    
    func playNumber(num: Int) {
        switch(num) {
        case 0...10:
            playNumber(num: num + 10)
        
        case 11...19:
            playDigit(digit: 10)
            playDigit(digit: num % 10)
            
        case 20...99:
            let digit = num % 10
            let tenths = num / 10
            playDigit(digit: tenths)
            playDigit(digit: 10)
            if digit != 0 {
                playDigit(digit: digit)
            }
        default: playSounds(name: "bell")
        }
    }
    
    private func playDigit(digit: Int) {
        playSounds(name: digitToName(digit: digit) ?? "bell")
    }
    
    private func digitToName(digit: Int) -> String? {
        let digitNames = [
            "zero", "one", 
            "two", "three",
            "four", "five",
            "six", "seven",
            "eight", "nine",
            "ten"
        ]
        
        if digit >= 0 && digit <= 10 {
            return digitNames[digit]
        } else {
            return nil
        }
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
