//
//  EditFoodView.swift
//  iCalories
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var manageObjectContext // This is what we set in the root level of the project
    @Environment(\.dismiss) var dismiss // This will take care of destorying this windows from the preview window - Close window
    
    var food: FetchedResults<Food>.Element
    
    @State private var name: String = ""
    @State private var calaories: Double = 0.0
    
    var body: some View {
        Form {
            Section {
                TextField("Food Name", text: $name)
            } header: {
                Text("Food Name")
            }
            
            Section {
                VStack {
                    Slider(value: $calaories, in: 0...1000, step: 10)
                }
                .padding(.vertical, 5.0)
            } header: {
                Text("Calaries: \(Int(calaories))")
            }
            
            Section {
                Button("Save") {
                    DataController().editFood(food: food, name: name, calories: calaories, context: manageObjectContext)
                    dismiss()
                }
            }
        }
        .onAppear {
            name = food.name!
            calaories = food.calories
        }
    }
}
