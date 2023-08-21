//
//  GameCard.swift
//  Experience
//
//  Created by Smith Shodunke on 21/08/2023.
//

import SwiftUI

struct GameCard: View {
    let game: Game
    
    var body: some View {
        HStack {
            if let gameCover = game.cover {
                AsyncImage(url: URL(string: "https://images.igdb.com/igdb/image/upload/t_cover_big/\(gameCover.image_id).jpg")) { image in
                    image
                        .resizable()
                        .frame(width: 60, height: 80)
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 200)
                }
            }
            Text(game.name)
        }
    }
}
