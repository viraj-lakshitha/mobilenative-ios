//
//  PizzaViewModel.swift
//  PizzaApp
//
//  Created by Viraj Lakshitha Bandara on 10.03.23.
//

import Foundation
import CoreData

class PizzaViewModel: ObservableObject {
    @Published var savedPizzaData: [PizzaEntity] = []
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "PizzaDataContainer")
        container.loadPersistentStores {description, error in
            if let error = error {
                print("[ERROR] - loading data. \(error)")
            } else {
                print("[SUCCESSFUL] - loaded core data.")
            }
        }
        
        fetchData()
    }
    
    func fetchData(){
        let request = NSFetchRequest<PizzaEntity>(entityName: "PizzaEntity")
        do{
            savedPizzaData = try container.viewContext.fetch(request)
        } catch let error {
            print ("[ERROR] - Fetching Data \(error)")
        }
        
    }
    
    func addPizzaData(name: String, ingredients: String, imageName: String, isFavourite: Bool, pizzaType: String){
        print("name:  \(name), ingredient: \(ingredients), imageName: \(imageName), isFavorite: \(isFavourite), pizzaType: \(pizzaType)")
        let newPizza = PizzaEntity(context: container.viewContext)
        newPizza.name = name
        newPizza.imageName = imageName
        newPizza.isFavourite = isFavourite
        newPizza.pizzaType = pizzaType
        newPizza.ingredients = ingredients
        saveData()
    }
    
    func filterPizzaWithType(pizzaType: String) -> [PizzaEntity] {
        return savedPizzaData.filter { $0.pizzaType == pizzaType }
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchData()
        }catch let error {
            print("[ERROR] - error while saving data \(error)")
        }
       
    }
    
    func filterPizzaWithIsFavourite(state: Bool) -> [PizzaEntity] {
        return savedPizzaData.filter { $0.isFavourite == state }
    }
    
    func updateIsFavourite(pizza: PizzaEntity, isFavourite: Bool) {
        pizza.isFavourite = isFavourite
        saveData()
    }
    
    func deletePizza(offset: IndexSet) {
        if let idx = offset.first {
            var selectedPizza = savedPizzaData[idx]
            container.viewContext.delete(selectedPizza)
            saveData()
        }
    }
}
