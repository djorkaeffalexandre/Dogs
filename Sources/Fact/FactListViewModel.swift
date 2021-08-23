//
//  FactListViewModel.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Foundation

final class FactListViewModel: ObservableObject {
    
    @Published var facts: [Fact] = []
    
    func loadFacts() {
        
    }
    
}
