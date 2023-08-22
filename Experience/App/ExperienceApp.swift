//
//  ExperienceApp.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import SwiftUI

@main
struct ExperienceApp: App {
    @StateObject var store = Store(gameService: GameService(baseURL: URL(string: ApiConstants.baseUrl)!))
    
    var body: some Scene {
        WindowGroup {
            ExperienceTabView()
                .environmentObject(store)
        }
    }
}
