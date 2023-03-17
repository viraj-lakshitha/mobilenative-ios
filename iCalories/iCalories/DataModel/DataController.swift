//
//  DataController.swift
//  iCalories
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("[Error] - Failed to load the data \(error)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("[Success] - Data saved successfully")
        } catch {
            print("[Error] - Unable to save dats")
        }
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        let food = Food(context: context)
        food.id = UUID()
        food.name = name
        food.calories = calories
        save(context: context)
    }
    
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
}
