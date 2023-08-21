//
//  IGBDHelper.swift
//  Experience
//
//  Created by Smith Shodunke on 16/08/2023.
//

import Foundation

enum ApiBody: String {
    case popularGames = "fields name, cover.*, screenshots.*; where total_rating > 85 & total_rating_count > 25; sort first_release_date desc; limit 5;"
    case comingSoon =   "fields name, cover.*, screenshots.*; where hypes > 20 & first_release_date > 1692183563; limit 5; sort hypes desc;"
}
