//
//  ActivityView.swift
//  Dogs
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 8/23/21.
//

import UIKit
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    private let activityItems: [Any]
    private let applicationActivities: [UIActivity]?
    
    init(activityItems: [Any], applicationActivities: [UIActivity]? = nil) {
        self.activityItems = activityItems
        self.applicationActivities = applicationActivities
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
        
}
