//
//  File.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import Foundation

// MARK: - ProverbModel
struct ProverbModel: Codable {
    let id: String
    let proverb: String
    let pinyin: String
    let translation: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb
        case pinyin
        case translation
    }
    
    static func defaultProverb() -> ProverbModel {
        ProverbModel(
            id: "",
            proverb: "留得青山在，不怕没柴烧。",
            pinyin: "Liú dé qīng shān zài, bú pà méi chái shāo",
            translation: "While there are green hills, there'll be wood to burn."
        )
    }
}
