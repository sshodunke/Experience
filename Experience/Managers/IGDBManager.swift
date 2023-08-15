//
//  IGDBManager.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import Foundation

class IGDBManager: ObservableObject {
    
    private let APIUrl = "https://api.igdb.com/v4"
    @Published var games: [Game] = []
    
    func getListOfGames(endpoint: Endpoint, dataResponse: @escaping (Data) -> Void) {
        var request = URLRequest(url: URL(string: "\(APIUrl)\(endpoint.url())")!)
        request.setValue("", forHTTPHeaderField: "client-id")
        request.setValue("Bearer ", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let body = "fields name, platforms; search \"Super Mario \";"
        let data: Data? = body.data(using: .utf8)
        request.httpBody = data
        
        print(request)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to JSON
            do {
                let games = try JSONDecoder().decode([Game].self, from: data)
                DispatchQueue.main.async {
                    self?.games = games
                }
                print(games)
            } catch {
                print(error.localizedDescription)
            }
            
            dataResponse(data)
        })
        
        task.resume()
    }
}
