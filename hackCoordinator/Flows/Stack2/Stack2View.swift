//
//  Stack2View.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 25.04.2023.
//

import SwiftUI

struct Stack2View: View {
    @ObservedObject var model: Stack2ViewModel
    
    var body: some View {
        VStack {
            Text("Stack 2")
            
            Button {
                model.popToStack1()
            } label: {
                Text("pop to stack 1")
            }
            
            Button {
                model.showCover()
            } label: {
                Text("Show Cover")
            }
            
            Button {
                model.dismissCover()
            } label: {
                Text("Dismiss Cover")
            }
            
            Button {
                model.popToRoot()
            } label: {
                Text("pop to root")
            }
        }
    }
}

struct Stack2View_Previews: PreviewProvider {
    static var previews: some View {
        Stack2View(model: .init(navigationSubject: .init()))
    }
}
