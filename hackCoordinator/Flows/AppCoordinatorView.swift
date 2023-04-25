//
//  AppCoordinatorView.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 24.04.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationView {
            Stack1View(model: coordinator.stack1ViewModel)
                .navigation(model: $coordinator.stack2ViewModel) {
                    Stack2View(model: $0)
                }
                .navigation(model: $coordinator.coverCoordinator, mode: .fullScreenPresent()) {
                    CoverCoordinatorView(coordinator: $0)
                }
        }
        .navigationViewStyle(.stack)
        .onOpenURL { url in
            url
        }
    }
}

struct AppCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinatorView()
    }
}
