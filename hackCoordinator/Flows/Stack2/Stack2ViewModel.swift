//
//  Stack2ViewModel.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 25.04.2023.
//

import Foundation
import Combine

class Stack2ViewModel: IdentifiableObject {
    private let navigationSubject: PassthroughSubject<FlowType, Never>
    
    init(navigationSubject: PassthroughSubject<FlowType, Never>) {
        self.navigationSubject = navigationSubject
    }
    
    func popToStack1() {
        navigationSubject.send(.Stack1)
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
