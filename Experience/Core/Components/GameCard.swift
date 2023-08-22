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
            VStack(alignment: .leading) {
                Text(game.name)
                Text(getDate(game.first_release_date))
            }
            .padding()
        }
    }
    
    func getDate(_ releaseDateTimestamp: Int) -> String {
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(releaseDateTimestamp))
        dateFormatter.dateFormat = "dd MMM, yyyy"
        //dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = Locale.autoupdatingCurrent.timeZone
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
        GameCard(game: Game.dummyData.first!)
    }
}
