//
//  ContentView.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var igdbApi = IGDBManager()
    
    var body: some View {
        NavigationStack {
            List {
            ForEach(igdbApi.games, id: \.self) { game in
                    HStack {
                        Text(game.name)
                    }
                }
            }
            .navigationTitle("Experience")
            .onAppear {
                igdbApi.getListOfGames(endpoint: .GAMES) { data in
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
