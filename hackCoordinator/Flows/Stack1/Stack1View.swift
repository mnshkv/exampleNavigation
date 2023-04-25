//
//  Stack1View.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 25.04.2023.
//

import SwiftUI

struct Stack1View: View {
    @ObservedObject var model: Stack1ViewModel
    
    var body: some View {
        VStack {
            Text("Stack 1")
            
            Button {
                model.pushToStack2()
            } label: {
                Text("Push to stack 2")
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

struct Stack1View_Previews: PreviewProvider {
    static var previews: some View {
        Stack1View(model: .init(navigationSubject: .init()))
    }
}
