//
//  AppCoordinator.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 24.04.2023.
//

import Combine
import SwiftUI

final class AppCoordinator: IdentifiableObject {
    
    // MARK: - Inputs
    private let navigationSubject = PassthroughSubject<FlowType, Never>()
    
    // MARK: - Outputs
    @Published var stack1ViewModel: Stack1ViewModel!
    @Published var stack2ViewModel: Stack2ViewModel?
    @Published var coverCoordinator: CoverCoordinator?
    
    // MARK: - Properties
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: Init/Deinit
    init() {
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
                    self?.toCover()
                case .popToRoot:
                    self?.toStack1()
                case .dismissCover:
                    self?.closeCover()
                }
            }
            .store(in: &cancellables)
    }
    
    private func toStack1() {
        coverCoordinator = nil
        stack2ViewModel = nil
    }
    
    private func toCover() {
        coverCoordinator = CoverCoordinator(subject: navigationSubject)
    }
    
    private func closeCover() {
        coverCoordinator = nil
    }
    
    private func toStack2() {
        stack2ViewModel = Stack2ViewModel(navigationSubject: navigationSubject)
    }
}

enum FlowType {
    case Stack1
    case Stack2
    case Cover
    case dismissCover
    case popToRoot
}
