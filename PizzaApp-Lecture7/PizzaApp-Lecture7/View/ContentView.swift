//
//  ContentView.swift
//  PizzaApp-Lecture7
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pizzaStore: PizzaStore
    @State var isPresent: Bool = false
    
    var body: some View {
        NavigationView {
            TabView {
                PizzaListView(pizzas: pizzaStore.pizzas)
                    .tabItem {
                        Label("Pizzas", systemImage: "cart")
                    }
                PizzaListView(pizzas: pizzaStore.pizzas)
                    .tabItem {
                        Label("Meat", systemImage: "circle")
                    }
                PizzaListView(pizzas: pizzaStore.pizzas)
                    .tabItem {
                        Label("Veggie", systemImage: "leaf")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isPresent = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $isPresent) {
                AddPizzaView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pizzaStore = PizzaStore()
        ContentView()
            .environmentObject(pizzaStore)
    }
}
