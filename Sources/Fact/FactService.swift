//
//  FactService.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Combine
import Foundation

struct FactService {
    
    private typealias Path = String
    
    private let urlSession = URLSession.shared
    
    private func buildURL(for path: Path) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dog-facts-api.herokuapp.com"
        components.path = "/" + path
        return components.url.unsafelyUnwrapped
    }
    
    func loadFacts() -> AnyPublisher<[Fact], Error> {
        urlSession.dataTaskPublisher(for: buildURL(for: "/api/v1/resources/dogs/all"))
            .map(\.data)
            .decode(type: [Fact].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
