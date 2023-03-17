//
//  PizzaApp_Lecture7App.swift
//  PizzaApp-Lecture7
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI

@main
struct PizzaApp_Lecture7App: App {
    @State var pizzaStore: PizzaStore = PizzaStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pizzaStore)
        }
    }
}
