//
//  AddFoodView.swift
//  iCalories
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var manageObjectContext // This is what we set in the root level of the project
    @Environment(\.dismiss) var dismiss // This will take care of destorying this windows from the preview window - Close window
    
    @State private var name: String = ""
    @State private var calaories: Double = 200.0
    
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
                Button("Submit") {
                    DataController().addFood(name: name, calories: calaories, context: manageObjectContext)
                    dismiss()
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
