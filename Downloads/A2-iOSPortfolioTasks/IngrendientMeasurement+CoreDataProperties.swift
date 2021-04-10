//
//  IngrendientMeasurement+CoreDataProperties.swift
//  A2-iOSPortfolioTasks
//
//  Created by user176152 on 4/9/21.
//
//

import Foundation
import CoreData


extension IngrendientMeasurement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngrendientMeasurement> {
        return NSFetchRequest<IngrendientMeasurement>(entityName: "IngrendientMeasurement")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: String?
    @NSManaged public var measurement: Meal?

}

extension IngrendientMeasurement : Identifiable {

}
