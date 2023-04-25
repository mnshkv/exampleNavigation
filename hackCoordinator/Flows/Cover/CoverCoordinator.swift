//
//  CoverCoordinator.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 25.04.2023.
//

import Combine
import SwiftUI

final class CoverCoordinator: IdentifiableObject {
    
    // MARK: - Inputs
    private let appCoordinatorSubject: PassthroughSubject<FlowType, Never>
    private let navigationSubject = PassthroughSubject<FlowType, Never>()
    
    // MARK: - Outputs
    @Published var stack1ViewModel: Stack1ViewModel!
    @Published var stack2ViewModel: Stack2ViewModel?
    
    // MARK: - Properties
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: Init/Deinit
    init(subject: PassthroughSubject<FlowType, Never>) {
        appCoordinatorSubject = subject
        stack1ViewModel = Stack1ViewModel(navigationSubject: navigationSubject)

        bindPublishers()
    }
    
    private func bindPublishers() {
        navigationSubject
            .sink { [weak self] route in
                switch route {
                case .Stack1:
                    self?.toStack1()
                case .Stack2:
                    self?.toStack2()
                case .Cover:
                    return
                case .popToRoot:
                    self?.popToRoot()
                case .dismissCover:
                    self?.closeCover()
                }
            }
            .store(in: &cancellables)
    }
    
    private func popToRoot() {
        appCoordinatorSubject.send(.popToRoot)
    }
    
    private func closeCover() {
        appCoordinatorSubject.send(.dismissCover)
    }
    
    private func toStack1() {
        stack2ViewModel = nil
    }
    
    private func toStack2() {
        stack2ViewModel = Stack2ViewModel(navigationSubject: navigationSubject)
    }
}

