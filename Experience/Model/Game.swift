//
//  Game.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import Foundation

struct Game: Codable, Hashable {
    let id: Int
    let name: String
    let screenshots: [Screenshot]?
    let cover: Cover?
    
    struct Cover: Codable, Hashable {
        let image_id: String
        
        enum CodingKeys: String, CodingKey {
            case image_id
        }
    }
    
    struct Screenshot: Codable, Hashable {
        var image_id: String
        
        enum CodingKeys: String, CodingKey {
            case image_id
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case screenshots
        case cover
    }
}
