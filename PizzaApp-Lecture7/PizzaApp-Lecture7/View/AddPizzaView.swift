//
//  AddPizzaView.swift
//  PizzaApp-Lecture7
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI

struct AddPizzaView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var pizzaStore: PizzaStore
    
    @State var name: String = ""
    @State var ingredients: String = ""
    @State var thumbnail: String = ""
    @State var imageName: String = ""
    @State var type: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter pizza name", text: $name)
                } header: {
                    Text("Pizza Name")
                }
                
                Section {
                    TextField("Enter pizza ingredients", text: $ingredients)
                } header: {
                    Text("Pizza Ingredients")
                }
                
                Section {
                    TextField("Enter pizza image", text: $imageName)
                    TextField("Enter pizza thumbnail", text: $thumbnail)
                        .textInputAutocapitalization(.never)
                } header: {
                    Text("Image")
                }
                
                Section {
                    Picker(selection: $type,
                           label: Text("Select pizza type")) {
                            Text("Meat").tag("meat")
                            Text("Veggie").tag("veggie")
                    }
                        .pickerStyle(.segmented)
                } header: {
                    Text("Select pizza type")
                }
                
                Section {
                    Button("Save") {
                        pizzaStore.addPizza(pizza: Pizza(name: name, ingredients: ingredients, imageName: imageName, thumbnailName: thumbnail, type: type))
                        dismiss()
                    }
                    .disabled(name.isEmpty || ingredients.isEmpty || imageName.isEmpty || thumbnail.isEmpty || type.isEmpty)
                }
            }
            .navigationTitle("Add New Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaView()
    }
}
