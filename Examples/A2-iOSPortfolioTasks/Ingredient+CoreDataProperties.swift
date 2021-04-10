//
//  Ingredient+CoreDataProperties.swift
//  A2-iOSPortfolioTasks
//
//  Created by user176152 on 4/9/21.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var ingredientDescription: String?

}

extension Ingredient : Identifiable {

}
