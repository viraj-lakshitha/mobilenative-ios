//
//  TaskModel.swift
//  TODOs
//
//  Created by Viraj Lakshitha Bandara on 2023-03-15.
//

import Foundation

enum Priority: String {
    case LOW = "low"
    case MEDIUM = "medium"
    case HIGH = "high"
}

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var priority: Priority
}

class TaskModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        tasks.append(contentsOf: [
            Task(title: "Make a coffee", description: "Please make cup of coffee", priority: .LOW),
            Task(title: "Attend lecture", description: "Please make cup of coffee", priority: .MEDIUM),
            Task(title: "Make progress in FYP", description: "Please make cup of coffee", priority: .HIGH)
        ])
    }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func deleteTask(offset: IndexSet) {
        tasks.remove(atOffsets: offset)
    }
}
