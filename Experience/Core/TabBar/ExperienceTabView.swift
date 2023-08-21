//
//  ExperienceTabView.swift
//  Experience
//
//  Created by Smith Shodunke on 21/08/2023.
//

import SwiftUI

struct ExperienceTabView: View {
    var igdbApi: IGDBManager = IGDBManager()

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
        .environmentObject(igdbApi)
    }
}

struct ExperienceTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceTabView()
    }
}
