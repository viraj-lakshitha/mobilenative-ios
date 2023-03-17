//
//  TODOsApp.swift
//  TODOs
//
//  Created by Viraj Lakshitha Bandara on 2023-03-15.
//

import SwiftUI

@main
struct TODOsApp: App {
    
    @State var taskModel: TaskModel = TaskModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskModel)
        }
    }
}
