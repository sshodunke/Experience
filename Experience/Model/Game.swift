//
//  Game.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import Foundation

struct Game: Codable, Hashable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
