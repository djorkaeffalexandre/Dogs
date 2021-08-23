//
//  FactView.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import SwiftUI

struct FactView: View {
    @State private var isSharing: Bool = false
    
    private let fact: Fact
    
    init(fact: Fact) {
        self.fact = fact
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fact.text)
                .padding()
            HStack {
                Spacer()
                Button(action: {
                    self.isSharing = true
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color.accentColor)
                }
                .sheet(isPresented: $isSharing) {
                    ActivityViewController(activityItems: [fact.text])
                }
            }
            .padding()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct FactView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            FactView(fact: .init(text: "My preview fact."))
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme($0)
        }
    }
}
