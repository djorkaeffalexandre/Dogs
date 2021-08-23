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
            List(viewModel.facts) { fact in
                FactView(fact: fact)
            }
            .navigationTitle("Dog Facts")
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
              viewModel.load()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FactListView_Previews: PreviewProvider {
    static var previews: some View {
        FactListView()
    }
}
