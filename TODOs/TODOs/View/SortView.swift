//
//  SortView.swift
//  TODOs
//
//  Created by Viraj Lakshitha Bandara on 2023-03-15.
//

import SwiftUI

struct SortView: View {
    
    @ObservedObject var taskModel: TaskModel
    @State var tasksSelector: Priority = .LOW
    
    func didUpdateList(priority: Priority) -> [Task] {
        switch(priority) {
        case .HIGH:
            return taskModel.tasks.filter { $0.priority == .HIGH }
        case .MEDIUM:
            return taskModel.tasks.filter { $0.priority == .MEDIUM }
        default:
            return taskModel.tasks.filter { $0.priority == .LOW }
        }
    }
    
    var body: some View {
        VStack {
            Picker("Category", selection: $tasksSelector) {
                Text("\(Priority.LOW.rawValue.capitalized)")
                    .tag(Priority.LOW)
                Text("\(Priority.MEDIUM.rawValue.capitalized)")
                    .tag(Priority.MEDIUM)
                Text("\(Priority.HIGH.rawValue.capitalized)")
                    .tag(Priority.HIGH)
            }
            .pickerStyle(.segmented)
            .frame(maxWidth: 250)
            
            List {
                ForEach(didUpdateList(priority: tasksSelector)) { task in
                    TaskItemView(task: task)
                }
            }
            .listStyle(.inset)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView(taskModel: TaskModel())
    }
}
