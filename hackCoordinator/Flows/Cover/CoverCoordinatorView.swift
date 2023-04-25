//
//  CoverCoordinatorView.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 25.04.2023.
//

import SwiftUI

struct CoverCoordinatorView: View {
    @ObservedObject var coordinator: CoverCoordinator

    var body: some View {
        NavigationView {
            Stack1View(model: coordinator.stack1ViewModel)
                .navigation(model: $coordinator.stack2ViewModel) {
                    Stack2View(model: $0)
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct CoverCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoverCoordinatorView(coordinator: .init(subject: .init()))
    }
}
