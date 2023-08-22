//
//  File.swift
//  Experience
//
//  Created by Smith Shodunke on 22/08/2023.
//

import Foundation

@MainActor
final class Store: ObservableObject {
    
    @Published private(set) var popularGames: [Game] = []
    @Published private(set) var gamesComingSoon: [Game] = []
    @Published var isLoading = false
    
    let gameService: GameService
    
    init(gameService: GameService) {
        self.gameService = gameService
    }
    
    func fetchPopularGames() async throws {
        do {
            self.popularGames = try await gameService.fetchGames()
        } catch {
            print("Could not retrieve games: \(error.localizedDescription)")
        }
    }
    
    func fetchGamesComingSoon() async throws {
        do {
            self.gamesComingSoon = try await gameService.fetchGames(ApiConstants.comingSoon)
        } catch {
            print("Could not retrieve games: \(error.localizedDescription)")
        }
    }
}
