//
//  FactListViewModel.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Foundation

protocol FactListViewModelProtocol: ObservableObject {
    var state: FactListState { get }
    func load()
}

final class FactListViewModel: FactListViewModelProtocol {
    
    @Published private(set) var state: FactListState = .idle
    
    private let service: FactServiceProtocol
    
    init(service: FactServiceProtocol = FactService()) {
        self.service = service
    }
    
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
