//
//  ExperienceTabView.swift
//  Experience
//
//  Created by Smith Shodunke on 21/08/2023.
//

import SwiftUI

struct ExperienceTabView: View {
    @EnvironmentObject private var store: Store
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}

struct ExperienceTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceTabView()
            .environmentObject(Store(gameService: GameService(baseURL: URL(string: ApiConstants.baseUrl)!)))
    }
}
