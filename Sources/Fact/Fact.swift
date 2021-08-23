//
//  Fact.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Foundation

struct Fact: Codable {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    private enum CodingKeys : String, CodingKey {
        case text = "fact"
    }
}

extension Fact: Identifiable {
    var id: String {
        text
    }
}
