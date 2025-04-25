//
//  ProverbViewModel.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import Foundation
import Observation

@Observable
class ProverbViewModel {
    var proverbModel: ProverbModel = .defaultProverb()
    
    private let urlString: String = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    
    func getRandomQuote() {
        getQuote(urlString: urlString)
    }
    
    private func getQuote(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task =  URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            do {
                let newProverbModel = try JSONDecoder().decode(ProverbModel.self, from: data)
                DispatchQueue.main.async {
                    self.proverbModel = newProverbModel
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
