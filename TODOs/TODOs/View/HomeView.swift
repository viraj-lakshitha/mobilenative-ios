//
//  HomeView.swift
//  TODOs
//
//  Created by Viraj Lakshitha Bandara on 2023-03-15.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var taskModel: TaskModel
    @State var showAddView: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskModel.tasks) { item in
                    TaskItemView(task: item)
                }
                .onDelete(perform: taskModel.deleteTask)
            }
            .sheet(isPresented: $showAddView) {
                AddView(taskModel: taskModel)
            }
            .listStyle(.inset)
            .navigationTitle("Todo's ✅")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddView = !showAddView
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(taskModel: TaskModel())
    }
}

struct TaskItemView: View {
    @State var task: Task
    
    func getTextColor(priority: Priority) -> Color {
        switch priority {
        case .HIGH:
            return Color.red
        case .MEDIUM:
            return Color.gray
        default:
            return Color.blue
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(task.title)
                .bold()
            Text(task.description)
                .foregroundColor(.gray)
            Text("\(task.priority.rawValue.uppercased())")
                .foregroundColor(getTextColor(priority: task.priority))
        }
    }
}
