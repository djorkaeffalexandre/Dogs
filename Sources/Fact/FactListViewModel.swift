//
//  FactListViewModel.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Combine
import Foundation

final class FactListViewModel: ObservableObject {
    
    @Published private(set) var facts: [Fact] = []
    
    private let service = FactService()
    
    private var task: AnyCancellable?
    
    func load() {
        task = service.loadFacts()
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \FactListViewModel.facts, on: self)
    }
    
}
