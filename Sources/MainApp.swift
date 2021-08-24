import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            FactListView(viewModel: FactListViewModel())
        }
    }
}
