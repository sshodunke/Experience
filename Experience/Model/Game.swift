//
//  Game.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import Foundation

struct Game: Codable {
    let id: Int
    let name: String
    let screenshots: [Screenshot]?
    let cover: Cover?
    let hypes: Int
    let first_release_date: Int
    
    struct Cover: Codable {
        let image_id: String
        
        enum CodingKeys: String, CodingKey {
            case image_id
        }
    }
    
    struct Screenshot: Codable {
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
        case hypes
        case first_release_date
    }
}

extension Game {
    
    static let dummyData = [
        Game(id: 1, name: "Final Fantasy XVI", screenshots: [Screenshot(image_id: "sc8kvt")], cover: Cover(image_id: "co5w3k"), hypes: 10, first_release_date: 1683849600)
    ]
}
