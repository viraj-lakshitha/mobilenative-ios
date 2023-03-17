//
//  AddNewPizza.swift
//  PizzaApp
//
//  Created by Viraj Lakshitha Bandara on 2023-03-01.
//

import SwiftUI

struct AddNewPizza: View {
    
    @ObservedObject var viewModel: PizzaViewModel
    
    @State private var pizzaName = ""
    @State private var ingredients = ""
    @State private var imageName = ""
    @State private var pizzaType = ""
    @State private var isFavorite = false
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("Name", text: $pizzaName)
                } header: {
                    Text("Pizza Name")
                }
                Section {
                    TextEditor(text: $ingredients).frame(height: 200)
                } header: {
                    Text("Ingredients")
                }
                Section {
                    TextField("Image Name", text: $imageName)
                        .textInputAutocapitalization(.never) // because first letter may be lowercase in image name
                } header: {
                    Text("Image Name")
                }
                Section {
                    TextField("Type", text: $pizzaType)
                } header: {
                    Text("Pizza Type")
                }
                Section {
                    Toggle("Favourite", isOn: $isFavorite)
                }
            }
            .navigationTitle("New Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save"){
                        viewModel.addPizzaData(name: pizzaName, ingredients: ingredients, imageName: imageName.lowercased(), isFavourite: isFavorite, pizzaType: pizzaType)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
            
        }
    }
}

struct AddNewPizza_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizza(viewModel: PizzaViewModel()) // PizzaViewModel() initialized only for developement purposes
    }
}
