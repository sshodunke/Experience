//
//  IGDBManager.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import Foundation

class IGDBManager: ObservableObject {
    
    private let APIUrl = "https://api.igdb.com/v4"
    
    @Published var popularGames: [Game] = []
    @Published var comingSoon: [Game] = []
    
    let POPULAR_GAMES = ""
    
    func getListOfGames(endpoint: Endpoint, apiBody: ApiBody) async throws {
        var request = URLRequest(url: URL(string: "\(APIUrl)\(endpoint.url())")!)
        request.setValue("", forHTTPHeaderField: "client-id")
        request.setValue("", forHTTPHeaderField: "authorization")
        request.httpMethod = "POST"
        let body = apiBody.rawValue
        let httpBody: Data? = body.data(using: .utf8)
        request.httpBody = httpBody
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            return
        }
        
        if let decodedResponse = try? JSONDecoder().decode([Game].self, from: data) {
            DispatchQueue.main.async {
                switch apiBody {
                case .popularGames:
                    self.popularGames = decodedResponse
                case .comingSoon:
                    self.comingSoon = decodedResponse
                }
            }
            print("games: \(decodedResponse)")
        } else {
            print("Could not retrieve data")
        }
    }
}
