//
//  Meal+CoreDataProperties.swift
//  A2-iOSPortfolioTasks
//
//  Created by user176152 on 4/9/21.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var name: String?
    @NSManaged public var instructions: String?
    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension Meal {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: IngrendientMeasurement)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: IngrendientMeasurement)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

extension Meal : Identifiable {

}
