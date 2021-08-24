//
//  FactListViewModelPreview.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Foundation


final class FactListViewModelPreview: FactListViewModelProtocol, Identifiable {
    
    private(set) var state: FactListState
    
    init(state: FactListState) {
        self.state = state
    }
    
    func load() {
        
    }
    
    static let allCases: [FactListViewModelPreview] = [
        FactListViewModelPreview(state: .idle),
        FactListViewModelPreview(state: .loading),
        FactListViewModelPreview(state: .success([.init(text: "My Preview Dog Fact that does a lorem ipsum.")])),
        FactListViewModelPreview(state: .failure(.invalidURL))
    ]
    
}
