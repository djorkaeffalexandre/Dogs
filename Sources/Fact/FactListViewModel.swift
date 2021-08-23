//
//  FactListViewModel.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Combine
import Foundation

final class FactListViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case failure(ServiceError)
        case success([Fact])
    }
    
    @Published private(set) var state: State = .idle
    
    private let service = FactService()
    
    func load() {
        state = .loading
        
        service.loadFacts() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let facts):
                    self?.state = .success(facts)
                case .failure(let error):
                    self?.state = .failure(error)
                }
            }
        }
    }
    
}
