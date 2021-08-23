//
//  FactListView.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import SwiftUI

struct FactListView: View {
    @StateObject var viewModel = FactListViewModel()
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("Dog Facts")
                .edgesIgnoringSafeArea(.bottom)
                .onAppear {
                    viewModel.load()
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var content: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                Color.clear.onAppear(perform: viewModel.load)
            case .loading:
                ProgressView()
            case .failure(let error):
                ErrorView(error: error, retryHandler: viewModel.load)
            case .success(let facts):
                List(facts) { fact in
                    FactView(fact: fact)
                }
            }
        }
    }
}

struct FactListView_Previews: PreviewProvider {
    static var previews: some View {
        FactListView()
    }
}
