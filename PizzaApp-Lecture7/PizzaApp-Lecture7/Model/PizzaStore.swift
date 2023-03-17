//
//  PizzaStore.swift
//  PizzaApp-Lecture7
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import Foundation

class PizzaStore: ObservableObject {
    @Published var pizzas: [Pizza] = []
    
    init() {
        let userDefaults = UserDefaults.standard
        
        // Try to read data from the user default, if it is first time
        if let data = userDefaults.data(forKey: "pizzas"), let decodeData = try? JSONDecoder().decode([Pizza].self, from: data)  {
            self.pizzas = decodeData
        }
        // Else, read from the json file /Model/pizza_details.json
        else if let url = Bundle.main.url(forResource: "pizza_details", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let pizzaDaos = try decoder.decode([PizzaDAO].self, from: data)
                self.pizzas = convertFromPizzaDaoToPizza(pizzaDaos: pizzaDaos)
                
                // Save retrieve data to userDefault
                let encodedData = try JSONEncoder().encode(self.pizzas)
                userDefaults.set(encodedData, forKey: "pizzas")
            } catch {
                print("Error in decoding data \(error)")
            }
        }
    }
    
    func addPizza(pizza: Pizza) {
        self.pizzas.append(pizza)
        savePizzasToUserDefault()
    }
    
    func deletePizza(_ offset: IndexSet) {
        self.pizzas.remove(atOffsets: offset)
        savePizzasToUserDefault()
    }
    
    private func savePizzasToUserDefault() {
        let userDefault = UserDefaults.standard
        do {
            let data = try JSONEncoder().encode(pizzas)
            userDefault.set(data, forKey: "pizzas")
        } catch {
            print("Error in saving data \(error)")
        }
    }
    
    func convertFromPizzaDaoToPizza(pizzaDaos: [PizzaDAO]) -> [Pizza] {
        var pizzaCov: [Pizza] = []
        pizzaDaos.forEach { pizzaDao in
            pizzaCov.append(Pizza(id: UUID(), name: pizzaDao.name, ingredients: pizzaDao.ingredients, imageName: pizzaDao.imageName, thumbnailName: pizzaDao.thumbnailName, type: pizzaDao.type))
        }
        return pizzaCov
    }
}
