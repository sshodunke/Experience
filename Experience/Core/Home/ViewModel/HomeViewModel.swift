//
//  HomeViewModel.swift
//  Experience
//
//  Created by Smith Shodunke on 22/08/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var games: [Game] = []
    
    func getGames() {
        
    }
    
}
