//
//  iCaloriesApp.swift
//  iCalories
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI

@main
struct iCaloriesApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
