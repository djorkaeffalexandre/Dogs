//
//  FactService.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Combine
import Foundation

enum ServiceError: Error {
    case invalidURL
    case noData
    case jsonParse
    case unknown(Error)
}

struct FactService {
    
    private typealias Path = String
    
    private let urlSession = URLSession.shared
    
    private func buildURL(for path: Path) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dog-facts-api.herokuapp.com"
        components.path = "/" + path
        return components.url
    }
    
    func loadFacts(completion: @escaping (Result<[Fact], ServiceError>) -> Void) {
        guard let url = buildURL(for: "/api/v1/resources/dogs/all") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode([Fact].self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.jsonParse))
            }
        }
        
        task.resume()
    }
    
}
