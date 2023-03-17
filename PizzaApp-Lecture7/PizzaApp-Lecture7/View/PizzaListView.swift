//
//  PizzaListView.swift
//  PizzaApp-Lecture7
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI

struct PizzaListView: View {
    @EnvironmentObject var pizzaStore: PizzaStore
    let pizzas: [Pizza]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pizzas) { pizza in
                    NavigationLink(destination: Text("\(pizza.name)")) {
                        HStack {
                            Image("sample_image") // since one image used for all the pizza, I have hardcoded the value here
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                            Text("\(pizza.name)")
                                .font(.title3)
                        }
                    }
                }
                .onDelete(perform: pizzaStore.deletePizza)
            }
            .navigationTitle("Pizza Menu")
        }
    }
}

struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        // Sample data to load the screen
        let pizzas: [Pizza] = [Pizza(name: "Cheese Lover", ingredients: "No Ingredients", imageName: "cheese_lover", thumbnailName: "meet_cheese_lover", type: "meat"), Pizza(name: "Cheese Lover", ingredients: "No Ingredients", imageName: "cheese_lover", thumbnailName: "meet_cheese_lover", type: "meat")]
        PizzaListView(pizzas: pizzas)
    }
}
