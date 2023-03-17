//
//  ContentView.swift
//  TODOs
//
//  Created by Viraj Lakshitha Bandara on 2023-03-15.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var taskModel: TaskModel
    
    var body: some View {
        TabView {
            HomeView(taskModel: taskModel)
                .tabItem {
                    Label("Todo's ✅", systemImage: "house.fill")
                }
            SortView(taskModel: taskModel)
                .tabItem {
                    Label("Sort", systemImage: "list.bullet.rectangle.portrait")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
