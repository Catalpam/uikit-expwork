//
//  CoreDataController.swift
//  A2-iOSPortfolioTasks
//
//  Created by user176152 on 4/9/21.
//

import UIKit
import CoreData

class CoreDataController: NSObject, DatabaseProtocol {
    
    
    var listeners = MulticastDelegate<DatabaseListener>()
    var persistentContainer: NSPersistentContainer
    
    override init() {
        persistentContainer = NSPersistentContainer(name: "MealModel")
        persistentContainer.loadPersistentStores() { (description, error ) in
            if let error = error {
                fatalError("Failed to load Core Data Stack with error: \(error)")
            }
        }
        
        super.init()
    }
    
    // Save changes inside view context if necessary
    func cleanup() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                fatalError("Failed to save changes to Core Data with error: \(error)")
            }
        }
    }
    
    func addListener(listener: DatabaseListener) {
        listeners.addDelegate(listener)
        
        if listener.listenerType == .meal || listener.listenerType == .all {
            listener.onMealChange(change: .update, ingredientMearsurement: fetchAllMeals())
        }
    }
    
    func removeListener(listener: DatabaseListener) {
        listeners.removeDelegate(listener)
    }

    func addMeal(name: String, instruction: String) -> Meal {
        let meal = NSEntityDescription.insertNewObject(forEntityName: "Meal", into: persistentContainer.viewContext) as! Meal
        meal.name = name
        meal.instructions = instruction
        
        return meal
    }
    
    func deleteMeal(meal: Meal) {
        persistentContainer.viewContext.delete(meal)
    }
    
    func fetchAllMeals() -> [Meal] {
        var meals = [Meal]()
        
        let request: NSFetchRequest<Meal> = Meal.fetchRequest()
        
        do {
            try meals = persistentContainer.viewContext.fetch(request)
        } catch {
            print("Fetch request failed with error: \(error)")
        }
        
        return meals
    }
    
    func addIngredientMeasurement(name: String, quantity: String) -> IngrendientMeasurement {
        <#code#>
    }
    
    func deleteIngredientMeasurement(ingredientMeasurement: IngrendientMeasurement) {
        <#code#>
    }
    
    func addIngredientMeasurementToMeal(ingredientMeasurement: IngrendientMeasurement, meal: Meal) -> Bool {
        <#code#>
    }
    
    func removeIngredientMeasurementFromMeal(ingredientMeasurement: IngrendientMeasurement, meal: Meal) {
        <#code#>
    }
    
    func addIngredient(name: String, ingredientDescription: String) -> Ingredient {
        <#code#>
    }
}
