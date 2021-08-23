//
//  ErrorView.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import SwiftUI

struct ErrorView: View {
    
    private let error: ServiceError
    private let retryHandler: () -> Void
    
    init(error: ServiceError, retryHandler: @escaping () -> Void) {
        self.error = error
        self.retryHandler = retryHandler
    }
    
    var body: some View {
        VStack {
            Text("Something goes wrong. Code: \(error.code)")
            Button(action: {
                retryHandler()
            }) {
                Text("Try Again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ErrorView(error: ServiceError.jsonParse, retryHandler: { print("retry") })
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme($0)
        }
    }
}



