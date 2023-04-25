//
//  ExamplePageView.swift
//  hackCoordinator
//
//  Created by Aleksandr Menshikov on 25.04.2023.
//

import SwiftUI

struct ExamplePageView: View {
    @State var tab = "two"
    
    var body: some View {
        VStack {
            Text(tab)
            TabView(selection: $tab) {
                Text("Hello, World 1")
                    .tabItem {
                        Text("1")
                    }
                    .tag("one")
                
                Text("Hello, World 2")
                    .tabItem {
                        Text("2")
                    }
                    .tag("two")
                
                Text("Hello, World 3")
                    .tabItem {
                        Image(systemName: "plus")
                        Text("3")
                    }
                    .tag("three")
                
                Text("Hello, World 4")
                    .tabItem {
                        Text("4")
                    }
                    .tag("four")
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
}

struct ExamplePageView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePageView()
    }
}
