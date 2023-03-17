//
//  AddView.swift
//  TODOs
//
//  Created by Viraj Lakshitha Bandara on 2023-03-16.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var taskModel: TaskModel
    @State var title: String = ""
    @State var description: String = ""
    @State var priority: Priority = .LOW
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Title")
                    .bold()
                TextField("Enter title", text: $title)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                
                Text("Short Description")
                    .bold()
                TextField("Enter description", text: $description)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                
                Text("Priority")
                    .bold()
                Picker("Priority", selection: $priority) {
                    Text("\(Priority.LOW.rawValue.uppercased())").tag(Priority.LOW)
                    Text("\(Priority.MEDIUM.rawValue.uppercased())").tag(Priority.MEDIUM)
                    Text("\(Priority.HIGH.rawValue.uppercased())").tag(Priority.HIGH)
                }
                .pickerStyle(.inline)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("Add New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !(title.isEmpty && description.isEmpty) {
                            taskModel.addTask(task: Task(title: title, description: description, priority: priority))
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(taskModel: TaskModel())
    }
}
