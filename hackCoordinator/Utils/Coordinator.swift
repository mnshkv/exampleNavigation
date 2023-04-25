//
//  Coordinator.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 24.04.2023.
//

import SwiftUI

public enum NavigationMode {
    case push(onPop: () -> Void = {})
    case modalPresent(onDismiss: (() -> Void)? = nil)
    case fullScreenPresent(onDismiss: (() -> Void)? = nil)
}

public extension View {
    
    // MARK: - Private methods
    @ViewBuilder private func navigationLink<Destination: View>(
        isActive: Binding<Bool>,
        @ViewBuilder destination: @escaping () -> Destination
    ) -> some View {
        NavigationLink(
            destination: isActive.wrappedValue ? destination() : nil,
            isActive: isActive,
            label: { EmptyView() }
        )
    }
    
    // MARK: - Public methods
    func onNavigation(_ action: @escaping () -> Void) -> some View {
        let isActive = Binding(
            get: { false },
            set: { newValue in
                if newValue {
                    action()
                }
            }
        )
        return NavigationLink(destination: EmptyView(), isActive: isActive) {
            self
        }
    }
    
    @ViewBuilder func navigation<Model: Identifiable, Destination: View> (
        model: Binding<Model?>,
        mode: NavigationMode = .push(),
        @ViewBuilder destination: @escaping (Model) -> Destination
    ) -> some View {
        switch mode {
        case .push(let onPop):
            let isActive = Binding(
                get: { model.wrappedValue != nil },
                set: { newValue in
                    guard model.wrappedValue != nil, !newValue else {
                        return
                    }
                    onPop()
                    model.wrappedValue = nil
                }
            )
            overlay(
                navigationLink(isActive: isActive) {
                    model.wrappedValue.map(destination)
                }
            )
        case .modalPresent(let onDismiss):
            sheet(
                item: model,
                onDismiss: onDismiss,
                content: destination
            )
        case .fullScreenPresent(let onDismiss):
            fullScreenCover(
                item: model,
                onDismiss: onDismiss,
                content: destination
            )
        }
    }
    
}


