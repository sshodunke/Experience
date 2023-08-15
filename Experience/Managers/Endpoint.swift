//
//  Endpoints.swift
//  Experience
//
//  Created by Smith Shodunke on 14/08/2023.
//

import Foundation

public enum Endpoint: String {
    case GAMES
}

extension Endpoint {
    func url() -> String {
        return "/\(self.rawValue.lowercased())"
    }
}
