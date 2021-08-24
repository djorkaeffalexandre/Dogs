//
//  FactListState.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import Foundation

enum FactListState {
    case idle
    case loading
    case failure(ServiceError)
    case success([Fact])
}
