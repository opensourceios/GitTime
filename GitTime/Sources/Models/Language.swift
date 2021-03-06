//
//  Language.swift
//  GitTime
//
//  Created by Kanz on 24/05/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import Foundation

struct Language: Codable {
    let id: Int
    let name: String
    let type: LanguageTypes
    let color: String
    var isFavorite: Bool = false
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = LanguageTypes(rawValue: try container.decode(String.self, forKey: .type)) ?? .programming
        color = try container.decode(String.self, forKey: .color)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(color, forKey: .color)
    }
    
    init(name: String) {
        self.id = 0
        self.name = name
        self.type = LanguageTypes.all
        self.color = ""
    }
    
    init(id: Int, name: String, type: String, color: String) {
        self.id = id
        self.name = name
        self.type = LanguageTypes(rawValue: type) ?? .programming
        self.color = color
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case color
    }
    
    static var allLanguage: Language {
        return Language(name: "All Languages")
    }
}

extension Language {
    func toFavoriteLanguage() -> FavoriteLanguage {
        let favorite = FavoriteLanguage()
        favorite.id = self.id
        favorite.name = self.name
        favorite.color = self.color
        favorite.type = self.type.rawValue
        return favorite
    }
}
