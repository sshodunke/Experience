//
//  IGDBManager.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import Foundation

final class GameService {
    
    let baseUrl: URL
    
    init(baseURL: URL) {
        self.baseUrl = baseURL
    }
    
    func fetchGames(_ body: String = ApiConstants.popularGames) async throws -> [Game] {
        guard let url = URL(string: "\(baseUrl)/games") else {
            throw NetworkError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        print("URL: \(url)")
        print("Request \(request.description)")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
        
        return try JSONDecoder().decode([Game].self, from: data)
    }
    
    func queryVideoGames(searchTerm: String) async throws -> [Game] {
        guard let url = URL(string: "/games", relativeTo: baseUrl) else {
            throw NetworkError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = ApiConstants.comingSoon.data(using: .utf8)

        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
        
        return try JSONDecoder().decode([Game].self, from: data)
    }
}

enum NetworkError: Error {
    case badUrl
    case invalidRequest
}
