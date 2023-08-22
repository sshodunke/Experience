//
//  Constants.swift
//  Experience
//
//  Created by Smith Shodunke on 22/08/2023.
//

import Foundation

enum ApiConstants {
    static let baseUrl = "https://api.igdb.com/v4"
    
    static let popularGames = "fields name, cover.*, hypes, screenshots.*, first_release_date; where total_rating > 85 & total_rating_count > 25; sort first_release_date desc; limit 5;"
    
    static let comingSoon =   "fields name, cover.*, hypes, screenshots.*, first_release_date; where hypes > 20 & first_release_date > 1692183563; limit 5; sort hypes desc;"
}
