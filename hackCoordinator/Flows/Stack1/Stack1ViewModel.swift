//
//  Stack1ViewModel.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 25.04.2023.
//

import Foundation
import Combine

class Stack1ViewModel: IdentifiableObject {
    private let navigationSubject: PassthroughSubject<FlowType, Never>
    
    init(navigationSubject: PassthroughSubject<FlowType, Never>) {
        self.navigationSubject = navigationSubject
    }
    
    func pushToStack2() {
        navigationSubject.send(.Stack2)
    }
    
    func showCover() {
        navigationSubject.send(.Cover)
    }
    
    func dismissCover() {
        navigationSubject.send(.dismissCover)
    }
    
    func popToRoot() {
        navigationSubject.send(.popToRoot)
    }
}
