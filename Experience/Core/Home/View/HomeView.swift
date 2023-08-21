//
//  HomeView.swift
//  Experience
//
//  Created by Smith Shodunke on 21/08/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var igdbApi: IGDBManager

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Highly Rated").font(.title)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(igdbApi.popularGames, id: \.self) { game in
                                if let gameCover = game.cover {
                                    AsyncImage(url: URL(string: "https://images.igdb.com/igdb/image/upload/t_cover_big/\(gameCover.image_id).jpg")) { image in
                                        image
                                            .resizable()
                                            .frame(width: 150, height: 200)
                                            .cornerRadius(20)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 150, height: 200)
                                    }
                                }
                            }
                        }
                    }
                    Text("Coming Soon").font(.title)
                    VStack(alignment: .leading) {
                        ForEach(igdbApi.comingSoon, id: \.self) { game in
                            GameCard(game: game)
                        }
                    }
                }.padding()
            }

        }
        .task {
            do {
                try await igdbApi.getListOfGames(endpoint: .games, apiBody: .popularGames)
                try await igdbApi.getListOfGames(endpoint: .games, apiBody: .comingSoon)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(IGDBManager())
    }
}
